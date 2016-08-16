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
    public partial class ViewDonation : System.Web.UI.Page
    {
        Donation objd = new Donation();
        int no_of_rows_affected = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                BindGrid();
            }



        }

        #region BindGrid()
        private void BindGrid()
        {
            DataTable dt = new DataTable();
            {
                dt = objd.getdonationdetails();
                gvdonation.DataSource = dt;
                gvdonation.DataBind();
            }
        }
        #endregion

        #region Events

        #region CouponTitle_NeedDataSource
        //gvdonation_NeedDataSource event is apply getdonationdetails to gvmember grid 
        protected void gvdonation_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            DataTable dt = new DataTable();
            
                dt = objd.getdonationdetails();

            gvdonation.DataSource = dt;
       
        }
        #endregion


        #region RadDatePicker_SelectedDateChanged
        //RadDatePicker_SelectedDateChanged event checks if raddatepicker is empty it binds the grid 
        protected void RadDatePicker_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {

            if (RadDatePicker.SelectedDate == null)
            {
                BindGrid();
            }
            else
                //if the date is selected it binds grid based on the selected date
            {
                objd.Date = RadDatePicker.SelectedDate.Value;
                DataTable dt = new DataTable();
                dt = objd.GetDonationDetailsusingDate();
                gvdonation.DataSource = dt;
                gvdonation.DataBind();
            }
        }
        #endregion


        #region SearchButton_Click
        //SearchButton_Click event is used to check each every column of grid including char column and number column
        protected void SearchButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";

                GridFilteringItem item = gvdonation.MasterTableView.GetItems(GridItemType.FilteringItem)[0] as GridFilteringItem;

                string Envelopenumber =(item["Envelopenumber"].Controls[0] as TextBox).Text;
                string FundName = (item["FundName"].Controls[0] as TextBox).Text;

                string Amount = (item["Amount"].Controls[0] as TextBox).Text;
                string Moneytype = (item["Moneytype"].Controls[0] as TextBox).Text;
                string Firstname = (item["Firstname"].Controls[0] as TextBox).Text;

                if (Envelopenumber == null && FundName == "" && Amount == "" && Moneytype == "" && Firstname == "")
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
                //if (Envelopenumber != "")
                //{
                //    if (expression != "")
                //        expression += " OR ";
                //    expression += "([Envelopenumber]   \'" + Envelopenumber + "\')";
                //}
                if (Envelopenumber.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([Envelopenumber] = \'" + Envelopenumber.Trim() + "\')";
                }

                if (Amount.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([Amount] =  \'" + Amount + "\')";
                }
                if (Moneytype.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([Moneytype]  LIKE \'%" + Moneytype + "%\')";
                }
                if (Firstname.Trim() != "")
                {
                    if (expression != "")
                        expression += " OR ";
                    expression += "([Firstname]  LIKE \'%" + Firstname + "%\')";
                }
                #endregion

                BindGrid();

                #region Assign CurrentFilterValue

                gvdonation.MasterTableView.GetColumnSafe("Envelopenumber").CurrentFilterValue =Envelopenumber.ToString();
                gvdonation.MasterTableView.GetColumnSafe("FundName").CurrentFilterValue = FundName;

                gvdonation.MasterTableView.GetColumnSafe("Amount").CurrentFilterValue = Amount;
                gvdonation.MasterTableView.GetColumnSafe("Moneytype").CurrentFilterValue = Moneytype;

                gvdonation.MasterTableView.GetColumnSafe("Firstname").CurrentFilterValue = Firstname;
                
                #endregion

                #region Assign CurrentFilterFunction

                gvdonation.MasterTableView.GetColumnSafe("Envelopenumber").CurrentFilterFunction = GridKnownFunction.EqualTo;
                gvdonation.MasterTableView.GetColumnSafe("FundName").CurrentFilterFunction = GridKnownFunction.Contains;

                gvdonation.MasterTableView.GetColumnSafe("Amount").CurrentFilterFunction = GridKnownFunction.EqualTo;
                gvdonation.MasterTableView.GetColumnSafe("Moneytype").CurrentFilterFunction = GridKnownFunction.Contains;
                gvdonation.MasterTableView.GetColumnSafe("Firstname").CurrentFilterFunction = GridKnownFunction.Contains;
                #endregion

                gvdonation.EnableLinqExpressions = false;
                gvdonation.MasterTableView.FilterExpression = expression;
                gvdonation.MasterTableView.Rebind();
            }
            catch (Exception ex)
            {

            }
        }
        #endregion

        #region ResetButton_Click
        //ResetButton_Click event makes CurrentFilterFunction for each column as null and then binds grid 
        protected void ResetButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";
                RadDatePicker.SelectedDate = null;
                foreach (GridColumn column in gvdonation.MasterTableView.Columns)
                {
                    column.CurrentFilterFunction = GridKnownFunction.NoFilter;
                    column.CurrentFilterValue = string.Empty;
                }
                gvdonation.MasterTableView.FilterExpression = string.Empty;
                BindGrid();
            }
            catch (Exception ex)
            {

            }
        }
        #endregion

        #region GridFund_ItemCommand
        //GridFund_ItemCommand event is use for two command name edit and delete
        protected void GridFund_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            string EnvelopedNumber, DID;
            //if  command name is EditDonation donation it will get the id of particuar
            //row to edit the donation and redirecte it to newdonation screen to update that donation
            if (e.CommandName == "EditDonation")
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;
                    EnvelopedNumber = (item["Envelopenumber"].Text.ToString());
                    DID = item["DID"].Text.ToString().Trim();

                    Response.Redirect("~/UserScreens/NewDonation.aspx?DID=" + DID);
                }

            }
            //If command name is delete it will get the id that donation which needs to be deleted by calling DELETEDonation 
                //it will successfully get deleted 
            else if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                objd.Envelopenumber = (item["Envelopenumber"].Text.ToString());
                objd.FundName = (item["FundName"].Text.ToString());
                no_of_rows_affected = objd.DELETEDonation();
                if (no_of_rows_affected == 1)
                {
                    Validations.showMessage(lblErrorMsg, "Donation " + Validations.RecordDeleted, "");
                    BindGrid();
                   
                }
                else
                {
                    Validations.showMessage(lblErrorMsg, "Donation " + Validations.Err_RefDelete, "Error");
                }
            }

        }
        #endregion

     

        #endregion

    }
}