using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace CrownEstimates.BusinessModel
{
    public class SqlSearchQuerry
    {
        private StringBuilder _select;
        private StringBuilder _from;
        private SqlWhereClause _where;

        public SqlSearchQuerry()
        {
            _select = new StringBuilder();
            _from = new StringBuilder();
            _where = new SqlWhereClause();
        }

        public StringBuilder Select
        {
            get { return _select; }
        }
        public StringBuilder From
        {
            get { return _from; }
        }
        public SqlWhereClause Where
        {
            get { return _where; }
        }

        public override string ToString()
        {
            return String.Format("{0}\r\n{1}\r\n{2}", _select.ToString(), _from.ToString(), _where.ToString());
        }

        public object[] Parameters
        {
            get { return _where.Parameters.ToArray(); }
        }


        public class SqlWhereClause
        {
            private List<string> _conditions;
            private List<object> _parameters;

            public SqlWhereClause()
            {
                _conditions = new List<string>();
                _parameters = new List<object>();
            }

            public void Add(string condition, object parameter)
            {
                _conditions.Add(condition);
                _parameters.Add(parameter);
            }
            public void Add(string condition)
            {
                _conditions.Add(condition);
            }

            public void AddIfNotNull(string condition, string parameter)
            {
                if (!String.IsNullOrEmpty(parameter))
                {
                    _conditions.Add(condition);
                    _parameters.Add(parameter);
                }
            }
            public void AddIfNotNull(string condition, object parameter)
            {
                if (parameter != null)
                {
                    _conditions.Add(condition);
                    _parameters.Add(parameter);
                }
            }

            public List<object> Parameters
            {
                get { return _parameters; }
            }

            public override string ToString()
            {
                if (_conditions.Count == 0)
                    return String.Empty;

                StringBuilder sb = new StringBuilder();
                sb.Append("WHERE");

                sb.AppendFormat(" {0}", _conditions[0]);
                for (int i = 1; i < _conditions.Count; i++)
                    sb.AppendFormat(" AND {0}", _conditions[i]);

                return sb.ToString();
            }

        }
    }
}