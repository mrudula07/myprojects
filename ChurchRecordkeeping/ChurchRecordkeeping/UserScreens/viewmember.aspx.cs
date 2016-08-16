using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using ChurchRecordkeeping.Business;

namespace ChurchRecordkeeping.UserScreens
{
    public partial class viewmember : System.Web.UI.Page
    {
        Member objm = new Member();
        int no_of_rows_affected = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                BindGrid();
            }

        }


        protected void SearchButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";

                GridFilteringItem item = gvmember.MasterTableView.GetItems(GridItemType.FilteringItem)[0] as GridFilteringItem;

                string membername = (item["Firstname"].Controls[0] as TextBox).Text;
                string City = (item["city"].Controls[0] as TextBox).Text;
                string State = (item["state"].Controls[0] as TextBox).Text;
                string EnvelopeID = (item["evid"].Controls[0] as TextBox).Text;
                if (membername == "" && City == "" && State == "" && EnvelopeID=="")
                {
                    Validations.showMessage(lblErrorMsg, Validations.Msg_EnterSearchText, "Error");
                    return;
                }


                #region Get Expression

                string expression = "";

                if (membername.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([Firstname]  LIKE \'%" + membername + "%\')";
                }
                if (City.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([city]  LIKE \'%" + City + "%\')";
                }
                if (State.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([state]  LIKE \'%" + State + "%\')";
                }
                if (EnvelopeID.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([evid]  = \'" + EnvelopeID + "\')";
                }
                #endregion

                BindGrid();

                #region Assign CurrentFilterValue

                gvmember.MasterTableView.GetColumnSafe("Firstname").CurrentFilterValue = membername;
                gvmember.MasterTableView.GetColumnSafe("city").CurrentFilterValue = City;
                gvmember.MasterTableView.GetColumnSafe("state").CurrentFilterValue = State;
                gvmember.MasterTableView.GetColumnSafe("evid").CurrentFilterValue = EnvelopeID;
                #endregion

                #region Assign CurrentFilterFunction

                gvmember.MasterTableView.GetColumnSafe("Firstname").CurrentFilterFunction = GridKnownFunction.Contains;
                gvmember.MasterTableView.GetColumnSafe("city").CurrentFilterFunction = GridKnownFunction.Contains;
                gvmember.MasterTableView.GetColumnSafe("evid").CurrentFilterFunction = GridKnownFunction.Contains;
                gvmember.MasterTableView.GetColumnSafe("state").CurrentFilterFunction = GridKnownFunction.Contains;
                #endregion

                gvmember.EnableLinqExpressions = false;
                gvmember.MasterTableView.FilterExpression = expression;
                gvmember.MasterTableView.Rebind();
            }
            catch (Exception ex)
            {
                
            }
        }      


        protected void ResetButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";
                foreach (GridColumn column in gvmember.MasterTableView.Columns)
                {
                    column.CurrentFilterFunction = GridKnownFunction.NoFilter;
                    column.CurrentFilterValue = string.Empty;
                }
                gvmember.MasterTableView.FilterExpression = string.Empty;
                BindGrid();
            }
            catch (Exception ex)
            {
                
            }
        }


        protected void GridmEMBER_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            string MID;
            if (e.CommandName == "EditMember")
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    MID = item["MID"].Text.ToString().Trim();

                    Response.Redirect("~/UserScreens/Addnewmem.aspx?EID=" + MID);
                  }
                    
                    //txtGroupName.Text = item["GroupName"].Text.ToString().Trim();
                    //SaveButton1.AlternateText = "Update";
            }
            
            else if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                objm.Memberid = item["MID"].Text.ToString();

                no_of_rows_affected = objm.DELETEMEMBER();
                if (no_of_rows_affected == 1)
                {
                    Validations.showMessage(lblErrorMsg, "Member " + Validations.RecordDeleted, "");
                    BindGrid();
                    //reset();
                    //SaveButton1.AlternateText = "Save";
                }
                else
                {
                    Validations.showMessage(lblErrorMsg, "Member " + Validations.Err_RefDelete, "Error");
                }
            }

        }

        protected void DownloadPDF_Click(object sender, EventArgs e)
        {
            gvmember.MasterTableView.ExportToPdf();
        }

        #region CouponTitle_NeedDataSource
        protected void CouponTitle_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = objm.Getmemberdetails();

            gvmember.DataSource = dt; 
           
        }
        #endregion

        #region BindGrid()
        private void BindGrid()
        {
            DataTable dt = new DataTable();
            {
                dt = objm.Getmemberdetails();

                gvmember.DataSource = dt;
                gvmember.DataBind();
            }
        }
        #endregion
    }
}