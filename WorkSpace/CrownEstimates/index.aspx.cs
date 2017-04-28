﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.Reporting;
using CrownEstimates.BusinessModel;
using FAC.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Services;

public partial class index : CrownEstimatesWizardsBasePage
{
	SortedList<int, object> roominvList = new SortedList<int, object>();
	SortedList<int, object> currentRoomInvList = new SortedList<int, object>();

	#region Session Variables

	public int SessionRoomID
	{
		get
		{
			return Convert.ToInt32(Session["RoomID"]);
		}
		set { Session["RoomID"] = value; }
	}

	#endregion

	#region Page Events

	private bool bSwitch = false;
	string color1 = "#ffffcc";
	string color2 = "#ccff99";

	public string TRJavaScript(Control con)
	{
		string tmp;
		DataListItem dli = con as DataListItem;
		Button btn = dli.FindControl("HiddenButton") as Button;
		string _js = " this.style.cursor = \"hand\"' " +
					 " onclick='document.getElementById(\"{1}\").click();' ";
		tmp = bSwitch ? string.Format(_js, color1, btn.ClientID) :
					   string.Format(_js, color2, btn.ClientID);
		bSwitch = !bSwitch;
		return tmp;
	}

	public string ReturnCheckBoxStatus(int roomid, int itemindex)
	{
		if (Session["RoomInvDetails"] == null && itemindex == 0)
			return "checked";
		else if (Session["RoomID"] != null && SessionRoomID == roomid)
		{
			return "checked";
		}
		else if (Session["RoomInvDetails"] != null)
		{
			roominvList = Session["RoomInvDetails"] as SortedList<int, object>;
			return (roominvList != null && roominvList.ContainsKey(roomid)) ? "checked" : string.Empty;
		}
		return string.Empty;
	}
	protected override void OnInitComplete(EventArgs e)
	{
		regv1.ValidationExpression = EmailRegXValidation;

		base.OnInitComplete(e);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			Session["RoomInvDetails"] = null; Session["RoomID"] = null;

			BindRooms();
			BindRoomCartoonItems();
			Session["RoomCount"] = ((DataView)RoomsDataSource.Select(DataSourceSelectArguments.Empty)).Count;


			if (Session["QuoteSubmitted"] != null && Convert.ToBoolean(Session["QuoteSubmitted"]))
			{
				divContent.Visible = false;
				divContentBanner.Visible = false;

				divThankyou.Visible = true;
				divContentBannerThankyou.Visible = true;

				Session["QuoteSubmitted"] = null;
			}
			else
			{
				if (RoomTypeDataList.Items.Count > 0)
				{
					RoomTypeDataList.SelectedIndex = 0;
					int roomid = SessionRoomID = Convert.ToInt32(RoomTypeDataList.DataKeys[0]);
					RoomInventoryItemsRepeater.DataSource = GetRoomInventoryItemDetails(roomid);
					RoomInventoryItemsRepeater.DataBind();
				}
				//txtApproximateDateOfMove.Text = DEFAULT_APPROX_DATE;
				if (SessionQuoteIDNullable.HasValue)
					LoadYourDetails();

			}

			if (Request != null)
			{
				if (!String.IsNullOrEmpty(Request.QueryString.Get("thankyou")))
				{
					divContent.Visible = false;
					divContentBanner.Visible = false;

					divThankyou.Visible = true;
					divContentBannerThankyou.Visible = true;
				}
			}
		}

	}



	#endregion


	#region Button Events
	protected void RoomTypeDataList_ItemCommand(object source, DataListCommandEventArgs e)
	{
		RoomTypeDataList.SelectedIndex = e.Item.ItemIndex;
		StoreRoomDetailsIntoSession();

		Control hdnRoomID = e.Item.FindControl("hdnRoomID");

		if (hdnRoomID != null)
		{
			SessionRoomID = Convert.ToInt32(((HiddenField)hdnRoomID).Value);
			RoomInventoryItemsRepeater.DataSource = GetRoomInventoryItemDetails(SessionRoomID);
			RoomInventoryItemsRepeater.DataBind();
			BindRoomCartoonItems();
			BindDataToRepeaters();
			BindRooms();
			roominvList[SessionRoomID] = new SortedList<int, object>();
			Session["RoomInvDetails"] = roominvList;

		}

	}

	protected void btnSubmit_Click1(object sender, EventArgs e)
	{
		try
		{
			if (Page.IsValid)
			{
				StoreRoomDetailsIntoSession();

				DataTable rooms = new DataTable();
				DataTable Inventory = new DataTable();

				rooms.Columns.AddRange(new DataColumn[2] { new DataColumn("RoomId", typeof(int)), new DataColumn("RoomNo", typeof(int)) });
				Inventory.Columns.AddRange(new DataColumn[3] { new DataColumn("RoomId", typeof(int)), new DataColumn("InventoryId", typeof(int)), new DataColumn("Quantity", typeof(int)) });

				roominvList = Session["RoomInvDetails"] as SortedList<int, object>;
				bool isRoomInvSelected = false;
				if (roominvList != null)
				{
					foreach (var key in roominvList.Keys)
					{
						bool roomSelected = false;

						currentRoomInvList = roominvList[key] as SortedList<int, object>;

						if (currentRoomInvList != null)
						{
							foreach (var key1 in currentRoomInvList.Keys)
							{
								if (Convert.ToInt32(currentRoomInvList[key1]) > 0)
								{
									roomSelected = true;
									Inventory.Rows.Add(key, key1, Convert.ToInt32(currentRoomInvList[key1]));
								}
							}
						}
						if (roomSelected)
						{
							isRoomInvSelected = true;
							rooms.Rows.Add(key, 1);
						}
						else
						{
							rooms.Rows.Add(key, 0);
						}
					}
				}
				if (isRoomInvSelected)
				{
					if (!SessionQuoteIDNullable.HasValue)//new quote(hopefully)
						CreateQuote();

					SaveYourDetails(Quote);
					SaveRoomSelection(rooms);
					SaveQuoteInventoryItems(Inventory);

					Quote.Save();

					EmailHelper.SendCompletedQuoteCrownEmailNew(Quote, "Crown Relocations - Full Quote Request");
					EmailHelper.SendCompletedQuoteCustomerEmailNew(Quote, "Crown Relocations - Full Quote Request");

					LeadIntegration.SendLeadToCrownGlobalSite(Quote, "Crown Relocations - Full Quote Request");

					Session["QuoteSubmitted"] = true;
					Session["RoomInvDetails"] = null;
					Session["RoomID"] = null;
					ClearSessionQuoteID();
                    Response.Redirect(Request.RawUrl);
				}
				else
				{
					ScriptManager.RegisterStartupScript(this, GetType(), "RoomInvSelectionError", "RoomInvSelectionError();", true);
				}
			}
		}
		catch
		{
			Session["RoomInvDetails"] = null;
			Session["RoomID"] = null;
			ClearSessionQuoteID();
			throw;
		}
	}

	#endregion


	#region Private Methods

	void BindRooms()
	{
		RoomTypeDataList.DataSourceID = "RoomsDataSource";
		RoomTypeDataList.DataBind();
	}

	void BindRoomCartoonItems()
	{
		RoomInventoryCartoonsRepeater.DataSourceID = "InventoryCartoonsDataSource";
		RoomInventoryCartoonsRepeater.DataBind();

	}

	void BindDataToRepeaters()
	{
		if (Session["RoomInvDetails"] != null)
		{
			roominvList = Session["RoomInvDetails"] as SortedList<int, object>;

			if (roominvList != null && roominvList.ContainsKey(SessionRoomID))
			{
				currentRoomInvList = roominvList[SessionRoomID] as SortedList<int, object>;

				if (currentRoomInvList != null)
				{
					foreach (RepeaterItem item in RoomInventoryItemsRepeater.Items)
					{
						Control invCtrl = item.FindControl("hdnInvID");
						Control invTextbox = item.FindControl("txtInvCount");

						if (invCtrl != null && currentRoomInvList.ContainsKey(Convert.ToInt32(((HiddenField)invCtrl).Value)))
						{
							((TextBox)invTextbox).Text = Convert.ToString(currentRoomInvList[Convert.ToInt32(((HiddenField)invCtrl).Value)]);
						}
					}

					foreach (RepeaterItem item in RoomInventoryCartoonsRepeater.Items)
					{
						Control invCtrl = item.FindControl("hdnInvID");
						Control invTextbox = item.FindControl("txtInvCount");

						if (invCtrl != null && currentRoomInvList.ContainsKey(Convert.ToInt32(((HiddenField)invCtrl).Value)))
						{
							((TextBox)invTextbox).Text = Convert.ToString(currentRoomInvList[Convert.ToInt32(((HiddenField)invCtrl).Value)]);
						}
					}
				}
			}
			// If not present also need to reset Inventory cartoon  items
			else if (roominvList != null && !roominvList.ContainsKey(SessionRoomID))
			{
				foreach (RepeaterItem item in RoomInventoryCartoonsRepeater.Items)
				{
					Control invTextbox = item.FindControl("txtInvCount");
					if (invTextbox != null)
						((TextBox)invTextbox).Text = "0";
				}
			}
		}
	}

	void StoreRoomDetailsIntoSession()
	{
		currentRoomInvList = new SortedList<int, object>();
		// Get other inventory values except cartoons
		foreach (RepeaterItem item in RoomInventoryItemsRepeater.Items)
		{
			Control invCtrl = item.FindControl("hdnInvID");
			Control invTextbox = item.FindControl("txtInvCount");

			if (invCtrl != null && invTextbox != null)
			{
				if (currentRoomInvList.ContainsKey(Convert.ToInt32(((HiddenField)invCtrl).Value)))
					currentRoomInvList[Convert.ToInt32(((HiddenField)invCtrl).Value)] = ((TextBox)invTextbox).Text;
				else
					currentRoomInvList.Add(Convert.ToInt32(((HiddenField)invCtrl).Value), ((TextBox)invTextbox).Text);
			}
		}
		// Get box values for current room
		foreach (RepeaterItem item in RoomInventoryCartoonsRepeater.Items)
		{
			Control invCtrl = item.FindControl("hdnInvID");
			Control invTextbox = item.FindControl("txtInvCount");

			if (invCtrl != null && invTextbox != null)
			{
				if (currentRoomInvList.ContainsKey(Convert.ToInt32(((HiddenField)invCtrl).Value)))
					currentRoomInvList[Convert.ToInt32(((HiddenField)invCtrl).Value)] = ((TextBox)invTextbox).Text;
				else
					currentRoomInvList.Add(Convert.ToInt32(((HiddenField)invCtrl).Value), ((TextBox)invTextbox).Text);
			}
		}

		if (Session["RoomInvDetails"] != null)
		{
			roominvList = Session["RoomInvDetails"] as SortedList<int, object>;
		}

		roominvList[SessionRoomID] = currentRoomInvList;
		Session["RoomInvDetails"] = roominvList;
	}

	DataSet GetRoomInventoryItemDetails(int roomid)
	{
		SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBUpgrade"].ConnectionString);
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "GetRoomInventoryItemDetails";
		cmd.Connection = conn;

		cmd.Parameters.Add(new SqlParameter("RoomID", roomid));

		DataSet riDS = new DataSet();
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		da.Fill(riDS, "RoomInventoryDetails");
		return riDS;
	}

	#endregion

	#region Load/Save Tab

	private void LoadYourDetails()
	{
		txtFirstName.Text = Quote.FirstName;
		txtSurname.Text = Quote.Surname;
		txtDayPhone.Text = Quote.DayPhone;
		txtEmail.Text = Quote.Email;
		txtMovingOutDate.Text = Quote.PickupDate;
		txtConsultantComments.Text = Quote.Comments;
		txtLocation.Text = Quote.FromStreet;
		txtMoveTo.Text = Quote.ToStreet;
        txtSuburb.Text = Quote.FromSuburb;

		chkPBO.Checked = Quote.IsPackedByOwner;
		chkPets.Checked = Quote.IsPetsRequired;
		chkPAC.Checked = Quote.IsPreArrivalCleanRequired;
		chkPPC.Checked = Quote.IsProfessionalPackingforCrown;
		chkSS.Checked = Quote.IsSecureStorage;
		chkUnsure.Checked = Quote.IsUnsure;
		chkVehicle.Checked = Quote.IsVehicleRequired;
		chkInsurance.Checked = Quote.IsInsurenceRequired;

		LoadRoomInventoryDetails();

	}
	private void SaveYourDetails(Quotes q)
	{
		// Quotes q = (SessionQuoteIDNullable.HasValue) ? Quotes.Get(SessionQuoteIDNullable.Value) : Quotes.Create();
		q.FirstName = txtFirstName.Text;
		q.Surname = txtSurname.Text;
		q.DayPhone = txtDayPhone.Text;
		q.Comments = txtConsultantComments.Text;
		q.CopyToClient = true;
		q.Email = txtEmail.Text;
		q.PickupDate = txtMovingOutDate.Text;
        q.FromSuburb = txtSuburb.Text;
		q.QuoteType = Quotes.QuoteTypes.Quote;

		q.IsPackedByOwner = chkPBO.Checked;
		q.IsPetsRequired = chkPets.Checked;
		q.IsPreArrivalCleanRequired = chkPAC.Checked;
		q.IsProfessionalPackingforCrown = chkPPC.Checked;
		q.IsSecureStorage = chkSS.Checked;
		q.IsUnsure = chkUnsure.Checked;
		q.IsVehicleRequired = chkVehicle.Checked;
		q.IsInsurenceRequired = chkInsurance.Checked;

		q.FromStreet = txtLocation.Text;

		q.ToStreet = txtMoveTo.Text;


		if (!SessionQuoteIDNullable.HasValue)
		{
			q.Save();
			//if (EmailHelper.SendNewQuotePasswordEmail(q, "Crown Relocations - Full Quote"))
			//    q.PasswordEmailSentOn = DateTime.Now;
			SessionQuoteID = q.QuoteId;
		}
	}
	private void LoadRoomInventoryDetails()
	{
		SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBUpgrade"].ConnectionString);
		SqlCommand command = new SqlCommand("GetQuoteInventoryByQuoteId", conn);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.AddWithValue("@QuoteID", QuoteID);
		SqlDataAdapter da = new SqlDataAdapter(command);
		DataSet ds = new DataSet();
		da.Fill(ds);
		if (ds.Tables.Count > 0)
		{
			DataTable table = ds.Tables[0];

			var rmgroupList = from ri in table.AsEnumerable()
							  group ri by ri.Field<int>("RoomID") into Group1
							  select new { RoomID = Group1.Key, Properties = Group1 };
			foreach (var item in rmgroupList)
			{
				currentRoomInvList = new SortedList<int, object>();

				foreach (var p in item.Properties)
				{
					currentRoomInvList.Add(p.Field<int>("InventoryID"), p.Field<int>("Quantity"));
				}
				roominvList[item.RoomID] = currentRoomInvList;
			}
			Session["RoomInvDetails"] = roominvList;
		}
		BindDataToRepeaters();
		BindRooms();
	}
	private void SaveRoomSelection(DataTable rooms)
	{
		SaveRoomNew(rooms);
	}
	private void SaveQuoteInventoryItems(DataTable inventory)
	{
		SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBUpgrade"].ConnectionString);
		SqlCommand command = new SqlCommand("Quotes_Inventory_Insert", conn);
		command.CommandType = CommandType.StoredProcedure;
		if (conn.State == ConnectionState.Closed)
			conn.Open();

		command.Parameters.AddWithValue("@QuoteID", QuoteID);
		command.Parameters.AddWithValue("@tblInventory", inventory);
		command.ExecuteNonQuery();
		conn.Close();
	}

	#endregion



}