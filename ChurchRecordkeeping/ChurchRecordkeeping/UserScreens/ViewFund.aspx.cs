using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using ChurchRecordkeeping.Business;

namespace ChurchRecordkeeping.UserScreens
{
    public partial class ViewFund : System.Web.UI.Page
    {
        Fund objfund = new Fund();
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

                GridFilteringItem item = gvfund.MasterTableView.GetItems(GridItemType.FilteringItem)[0] as GridFilteringItem;

                string Fundnumber = (item["FundNumber"].Controls[0] as TextBox).Text;
                string FundName = (item["FundName"].Controls[0] as TextBox).Text;
                if (Fundnumber == "" && FundName == "")
                {
                    Validations.showMessage(lblErrorMsg, Validations.Msg_EnterSearchText, "Error");
                    return;
                }


                #region Get Expression

                string expression = "";

                if (FundName.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([FundName]  LIKE \'%" + FundName + "%\')";
                }
                if (Fundnumber.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([Fundnumber]  = \'" + Fundnumber + "\')";
                }
              
                #endregion

                BindGrid();

                #region Assign CurrentFilterValue

                gvfund.MasterTableView.GetColumnSafe("Fundnumber").CurrentFilterValue = Fundnumber;
                gvfund.MasterTableView.GetColumnSafe("FundName").CurrentFilterValue = FundName;

                #endregion

                #region Assign CurrentFilterFunction

                gvfund.MasterTableView.GetColumnSafe("Fundnumber").CurrentFilterFunction = GridKnownFunction.Contains;
                gvfund.MasterTableView.GetColumnSafe("FundName").CurrentFilterFunction = GridKnownFunction.Contains;
      
                #endregion

                gvfund.EnableLinqExpressions = false;
                gvfund.MasterTableView.FilterExpression = expression;
                gvfund.MasterTableView.Rebind();
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
                foreach (GridColumn column in gvfund.MasterTableView.Columns)
                {
                    column.CurrentFilterFunction = GridKnownFunction.NoFilter;
                    column.CurrentFilterValue = string.Empty;
                }
                gvfund.MasterTableView.FilterExpression = string.Empty;
                BindGrid();
            }
            catch (Exception ex)
            {

            }
        }



        protected void GridFund_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            string FundNumber;
            if (e.CommandName == "EditFund")
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    FundNumber = item["FundNumber"].Text.ToString().Trim();

                    Response.Redirect("~/UserScreens/Addnewfund.aspx?FID=" + FundNumber);
                }

                //txtGroupName.Text = item["GroupName"].Text.ToString().Trim();
                //SaveButton1.AlternateText = "Update";
            }

            else if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                objfund.Fundnumber =Convert.ToInt32( item["FundNumber"].Text.ToString());

                no_of_rows_affected = objfund.DELETEFund();
                if (no_of_rows_affected == 1)
                {
                    Validations.showMessage(lblErrorMsg, "Fund " + Validations.RecordDeleted, "");
                    BindGrid();
                    //reset();
                    //SaveButton1.AlternateText = "Save";
                }
                else
                {
                    Validations.showMessage(lblErrorMsg, "Fund " + Validations.Err_RefDelete, "Error");
                }
            }

        }

        protected void DownloadPDF_Click(object sender, EventArgs e)
        {
            gvfund.MasterTableView.ExportToPdf();
        }

        #region CouponTitle_NeedDataSource
        protected void CouponTitle_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = objfund.getfunddetails();

            gvfund.DataSource = dt;

        }
        #endregion

        #region BindGrid()
        private void BindGrid()
        {
            DataTable dt = new DataTable();
            {
                dt = objfund.getfunddetails();

                gvfund.DataSource = dt;
                gvfund.DataBind();
            }
        }
        #endregion
    }
}