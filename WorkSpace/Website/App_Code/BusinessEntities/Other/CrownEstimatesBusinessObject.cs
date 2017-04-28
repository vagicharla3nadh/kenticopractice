using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FAC.BusinessDataAccess;
using System.Data;
using System.Threading;
using System.Web.Caching;
using System.Text;


namespace CrownEstimates.BusinessModel
{
    [BusinessDataAccess.StringMappingZeroLengthToDBNull]
    public abstract class CrownEstimatesBusinessObject<T> : BusinessObject<T> where T : BusinessObject<T>
    {
        protected CrownEstimatesBusinessObject() : base(DatabaseStatus.DoesNotExist) { }
        protected CrownEstimatesBusinessObject(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        #region Caching

        protected static List<T2> GetListCached<T2>(ListRetriever<T2> _listRetriever, string cacheKey, params object[] parameterValues) where T2 : T
        {
            List<T2> list = GetFromCache(cacheKey) as List<T2>;
            if (list == null)
            {
                list = _listRetriever.GetList(parameterValues);
                AddToCache(cacheKey, list);
            }

            return list;
        }

        protected static short CompanyID
        {
            get { return 1; } //hardcoded as only one company
        }


        protected static DataTable GetDataTableCached(string sql, params object[] parameterValues)
        {
            return GetDataSetCached(sql, parameterValues).Tables[0];
        }
        public static DataSet GetDataSetCached(string sql, params object[] parameterValues)
        {
            string key = FAC.BusinessDataAccess.CacheKey.GetKey(sql, parameterValues);
            DataSet ds = (DataSet)GetFromCache(key);
            if (ds != null) return ds;

            ds = GetDataSet(sql, parameterValues);

            foreach (DataTable dt in ds.Tables)
            {
                dt.RowDeleted += delegate(object sender, DataRowChangeEventArgs e) { throw new InvalidOperationException("Can not modify DataTable as it is currenly shared via the Web Cache."); };
                dt.RowChanged += delegate(object sender, DataRowChangeEventArgs e) { throw new InvalidOperationException("Can not modify DataTable as it is currenly shared via the Web Cache."); };
                dt.TableNewRow += delegate(object sender, DataTableNewRowEventArgs e) { throw new InvalidOperationException("Can not modify DataTable as it is currenly shared via the Web Cache."); };
            }

            AddToCache(key, GetCompanyId(sql, parameterValues), ds);
            return ds;
        }


        #region New Caching


        private static void CacheAdd(string key, object value)
        {
            HttpRuntime.Cache.Insert(key, value, null, Cache.NoAbsoluteExpiration, TimeSpan.FromMinutes(180), CacheItemPriority.Normal, new CacheItemRemovedCallback(_cacheDependencyList.CacheEntryRemovedCallback));
        }

        private static object CacheGet(string key)
        {
            object value = HttpRuntime.Cache[key];

            if (value == null)
                _cacheDependencyList.MarkCacheMiss();
            else
                _cacheDependencyList.MarkCacheHit();

            return value;
        }

        private static void CacheInvalidate(string key)
        {
            HttpRuntime.Cache.Remove(key);
        }


        #endregion


        protected static object GetFromCache(string key)
        {
            CompanyWrapper cw = (CompanyWrapper)HttpRuntime.Cache.Get(key);
            if (cw == null)
            {
                _cacheDependencyList.MarkCacheMiss();
                return null;
            }
            else
            {
                _cacheDependencyList.MarkCacheHit();
                return cw.Value;
            }
        }


        protected static void AddToCache(string key, object value)
        {
            AddToCache(key, CompanyID, value);
        }
        private static void AddToCache(string key, short companyId, object value)
        {
            HttpRuntime.Cache.Insert(key, new CompanyWrapper(companyId, value), CreateDependancy(companyId, key), Cache.NoAbsoluteExpiration, TimeSpan.FromMinutes(180), CacheItemPriority.Normal, new CacheItemRemovedCallback(_cacheDependencyList.CacheEntryRemovedCallback));
        }

        private class CompanyWrapper
        {
            private readonly short _companyId;
            private readonly object _value;
            public CompanyWrapper(short companyId, object value)
            {
                _companyId = companyId;
                _value = value;
            }
            public object Value { get { return _value; } }
            public short CompanyId { get { return _companyId; } }
        }

        private static short GetCompanyId(string sql, object[] values)
        {
            return CompanyID;
            //string[] pns = FAC.BusinessDataAccess.Tools.SqlParser.ParseSqlForParameterNames(sql);
            //for (int i = 0; i < pns.Length; i++)
            //{
            //    if (string.Compare(pns[i], "@CompanyID", true) == 0)
            //        return (short)values[i];
            //}
            //throw new ArgumentException("Could not find parameter '@CompanyID' in sql - " + sql + ".");
        }


        private static readonly CacheDependencyList<T> _cacheDependencyList = new CacheDependencyList<T>();
        protected void InvalidateDependancies()
        {
            InvalidateDependancies(CompanyID);
        }
        private void InvalidateDependancies(short companyId)
        {
            _cacheDependencyList.InvalidateDependencies(companyId);
        }
        private static CompanyCacheDependency CreateDependancy(short companyId, string key)
        {
            CompanyCacheDependency ccd = new CompanyCacheDependency(key);
            _cacheDependencyList.AddDependency(companyId, ccd);
            return ccd;
        }
        private class CacheDependencyList<T1>
        {
            private readonly ReaderWriterLock _listLock = new ReaderWriterLock();
            private readonly Dictionary<short, List<CompanyCacheDependency>> _list = new Dictionary<short, List<CompanyCacheDependency>>();


            public void AddDependency(short companyId, CompanyCacheDependency ccd)
            {
                List<CompanyCacheDependency> subList = GetSubList(companyId);
                if (subList == null)
                    subList = AddSubList(companyId);

                lock (subList)
                    subList.Add(ccd);
            }

            public void CacheEntryRemovedCallback(String k, Object v, CacheItemRemovedReason r)
            {
                UpdateCacheItemRemovedStatistics(r);


                if (r == CacheItemRemovedReason.DependencyChanged) return; // should have already been removed from list.

                //                CompanyWrapper cw = (CompanyWrapper)v;//Now that we tuck other stuff in.
                CompanyWrapper cw = v as CompanyWrapper;
                if (cw == null) return;

                List<CompanyCacheDependency> subList = GetSubList(cw.CompanyId);
                if (subList == null) return;//should not happen??

                lock (subList)
                {
                    for (int i = 0; i < subList.Count; i++)
                    {
                        if (subList[i].KeyMatches(k))
                        {
                            subList.RemoveAt(i);
                            return;
                        }
                    }
                }
                //should not get here??
            }

            public void InvalidateDependencies(short companyId)
            {
                List<CompanyCacheDependency> subList = GetSubList(companyId);
                if (subList == null)
                    return;

                CompanyCacheDependency[] ccds;
                lock (subList)
                {
                    ccds = subList.ToArray();
                    subList.Clear();
                }
                //Do the invalidation outside the lock to reduce contention.
                foreach (CompanyCacheDependency ccd in ccds)
                    ccd.InValidate();
            }
            private List<CompanyCacheDependency> GetSubList(short companyId)
            {
                _listLock.AcquireReaderLock(100);
                try
                {
                    List<CompanyCacheDependency> subList;
                    _list.TryGetValue(companyId, out subList);
                    return subList;
                }
                finally
                {
                    _listLock.ReleaseReaderLock();
                }

            }
            private List<CompanyCacheDependency> AddSubList(short companyId)
            {
                _listLock.AcquireWriterLock(100);
                try
                {
                    List<CompanyCacheDependency> subList;
                    if (_list.TryGetValue(companyId, out subList))
                        return subList;

                    _list[companyId] = subList = new List<CompanyCacheDependency>();
                    return subList;
                }
                finally
                {
                    _listLock.ReleaseWriterLock();
                }

            }

            #region Statistics

            public void MarkCacheHit() 
            { 
                //CacheStatistics.Get(GetType()).MarkCacheHit(); 
            }
            public void MarkCacheMiss() { 
                //CacheStatistics.Get(GetType()).MarkCacheMiss();
            }
            private void UpdateCacheItemRemovedStatistics(CacheItemRemovedReason r)
            {
                //CacheStatistics.Get(GetType()).UpdateCacheItemRemovedStatistics(r);
            }

            #endregion

        }
        private class CompanyCacheDependency : CacheDependency
        {
            private readonly string _key;
            public CompanyCacheDependency(string key)
            {
                _key = key;
                base.FinishInit();
            }
            public void InValidate()
            {
                base.SetUtcLastModified(DateTime.Now);
                base.NotifyDependencyChanged(this, EventArgs.Empty);
            }
            public bool KeyMatches(string key)
            {
                return object.ReferenceEquals(key, _key);
            }
            //protected override void DependencyDispose()
            //{
            //    base.DependencyDispose();
            //}
        }



        #endregion

    }
}