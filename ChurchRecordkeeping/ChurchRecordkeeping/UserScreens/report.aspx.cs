using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using ChurchRecordkeeping.Business;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.UserScreens
{
    public partial class report : System.Web.UI.Page
    {
        #region variable declaration
        Validations val = new Validations();
        Report objr = new Report();
        string FundName = string.Empty;
        string Amount = string.Empty;
        int fundID = 0;
        #endregion

        #region Pageload

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                emptygrid();
            }
        }
        #endregion

        #region CouponTitle_NeedDataSource
        //CouponTitle_NeedDataSource where we can bind the based ont he values of today fromdate and member name
        protected void CouponTitle_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (FromDateTimePicker.SelectedDate == null && ToDateTimePicker.SelectedDate == null && FirstnameIDtxtbox.Text != string.Empty)
            {
                DataTable dt = new DataTable();
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                dt = objr.GetreportDetailsusingmembername();
                gvmember.DataSource = dt; ;
            }
            else if (FromDateTimePicker.SelectedDate != null && ToDateTimePicker.SelectedDate != null && FirstnameIDtxtbox.Text == string.Empty)
            {
                DataTable dt = new DataTable();

                objr.FDate = FromDateTimePicker.SelectedDate.Value;
                objr.Todate = ToDateTimePicker.SelectedDate.Value;
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                dt = objr.GetDonationDetailsusingDate();
                gvmember.DataSource = dt;
            }
            else
            {
                DataTable dt = new DataTable();

                objr.FDate = FromDateTimePicker.SelectedDate.Value;
                objr.Todate = ToDateTimePicker.SelectedDate.Value;
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                dt = objr.GetreportDetailsusingmembernamewithdate();
                gvmember.DataSource = dt;
 
            }
        }
        #endregion

        #region ViewButton_onclick
        // ViewButton_onclick on this event it bind grid by checking condition of fromdate todate and membername
        protected void ViewButton_onclick(object sender, EventArgs e)
        {
            lblErrorMsg.Text = string.Empty;

            //if fromdate todate is empty and member name is selected  it will display  griddata based on member name
            if (FromDateTimePicker.SelectedDate ==null && ToDateTimePicker.SelectedDate == null && FirstnameIDtxtbox.Text!=string.Empty)
            {
                BindmemberGrid();
            }
            //if fromdate and todate is selected then it will display the data in grid based on selected date
            else if (FromDateTimePicker.SelectedDate!= null && ToDateTimePicker.SelectedDate!= null && FirstnameIDtxtbox.Text == string.Empty)
            {
                BindGrid();
            }
            ////if fromdate if selected but todate is not and member name is empty it will display error msg that you need to select both date
            else if (ValidateDateControl() == false && FirstnameIDtxtbox.Text == string.Empty)
            {
                Validations.showMessage(lblErrorMsg, Validations.Msg_datefield, "Error");
                return;
            }
            //if fromdate if selected but todate is not and member name is not empty it will display error msg that you need to select both date
            else if (ValidateDateControl() == false && FirstnameIDtxtbox.Text != string.Empty)
            {
                Validations.showMessage(lblErrorMsg, Validations.Msg_datefield, "Error");
                return;
            }
            else
            {
                DataTable dt = new DataTable();

                objr.FDate = FromDateTimePicker.SelectedDate.Value;
                objr.Todate = ToDateTimePicker.SelectedDate.Value;
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                dt = objr.GetreportDetailsusingmembernamewithdate();
                gvmember.DataSource = dt;
                gvmember.DataBind();
            }

        }
        #endregion


        #region DownloadPDF_Click
        //this DownloadPDF_Click event is used to export the grid in pdf
        protected void DownloadPDF_Click(object sender, EventArgs e)
        {
            gvmember.MasterTableView.ExportToPdf();
        }
        #endregion

        #region ClearButton_Click
        //ClearButton_Click event clear the all fields from page
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            FromDateTimePicker.SelectedDate = null;
            ToDateTimePicker.SelectedDate = null;
            FirstnameIDtxtbox.Text = string.Empty;
        }
        #endregion

        #region PDf_exporting
        //PDf_exporting event is used to set the requirement for PDF report like what need to be included 
        //for example todate from date and Total amount of donation set based on if conditions
        protected void PDf_exporting(object sender, GridPdfExportingArgs e)
        {
            if (FromDateTimePicker.SelectedDate == null && ToDateTimePicker.SelectedDate == null && FirstnameIDtxtbox.Text != string.Empty)
            {
                e.RawHTML = "<div>Donation Details for Member" + ' ' + FirstnameIDtxtbox.Text.ToString() + " " + "are :-" + e.RawHTML + "</div>";
                gvmember.MasterTableView.ExportToPdf();
            }

            else if (FromDateTimePicker.SelectedDate != null && ToDateTimePicker.SelectedDate != null && FirstnameIDtxtbox.Text == string.Empty)
            {
                gvmember.ExportSettings.Pdf.Producer = "Page" + FromDateTimePicker.SelectedDate.ToString() + "of";
                objr.FDate = FromDateTimePicker.SelectedDate.Value.Date;
                objr.Todate = ToDateTimePicker.SelectedDate.Value.Date;
                getamount();

                e.RawHTML = "<div>To Date:-</div>" + ToDateTimePicker.SelectedDate.ToString() + e.RawHTML;

                e.RawHTML = "<div>From Date:-</div>" + FromDateTimePicker.SelectedDate.Value + e.RawHTML;

                e.RawHTML = "<div>Total Amount of Donation for Members is:-" + Amount + e.RawHTML + "</div>";
            }
            else
            {
                gvmember.ExportSettings.Pdf.Producer = "Page" + FromDateTimePicker.SelectedDate.ToString() + "of";
                objr.FDate = FromDateTimePicker.SelectedDate.Value.Date;
                objr.Todate = ToDateTimePicker.SelectedDate.Value.Date;
                objr.Membername = FirstnameIDtxtbox.Text.ToString();
                getamountmember();

                e.RawHTML = "<div>To Date:-</div>" + ToDateTimePicker.SelectedDate.ToString() + e.RawHTML;

                e.RawHTML = "<div>From Date:-</div>" + FromDateTimePicker.SelectedDate.Value + e.RawHTML;

                e.RawHTML = "<div>Total Amount of Donation for Members is:-" + Amount + e.RawHTML + "</div>";

            }
        }
        #endregion


        #region emptygrid
        //emptygrid this method is used to display the empty grid on pageload
        private void emptygrid()
        {
            DataTable dt = new DataTable();
            gvmember.DataSource = dt;
            gvmember.DataBind();
        }
        #endregion

        #region BindGrid()
        //This method bind grid data based on or filteration of selected date
       
        private void BindGrid()
        {
            DataTable dt = new DataTable();

            objr.FDate = FromDateTimePicker.SelectedDate.Value;
            objr.Todate = ToDateTimePicker.SelectedDate.Value;

            dt = objr.GetDonationDetailsusingDate();
            gvmember.DataSource = dt;
            gvmember.DataBind();

        }
        #endregion


        #region BindmemberGrid()
        //BindmemberGrid this method is bind data in grid based on member name only 
        private void BindmemberGrid()
        {
            DataTable dt = new DataTable();


            objr.Membername = FirstnameIDtxtbox.Text.ToString();
            dt = objr.GetreportDetailsusingmembername();
            gvmember.DataSource = dt;
            gvmember.DataBind();

        }
        #endregion

        #region getamountmember
        // getamountmember is method which retrive the value of amount based on selected date and member name
        protected void getamountmember()
        {
            objr.FDate = FromDateTimePicker.SelectedDate.Value;
            objr.Todate = ToDateTimePicker.SelectedDate.Value;
            objr.Membername = FirstnameIDtxtbox.Text.ToString();
            using (SqlDataReader dr = objr.GetAmountusingDatenmember())
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Amount = dr["Amount"].ToString();
                    }
                }

            }
        }
        #endregion

        #region getamount
        //Below getamount method is get the sum of amount based on selected date from Database
        protected void getamount()
        {
            objr.FDate=FromDateTimePicker.SelectedDate.Value;
            objr.Todate=ToDateTimePicker.SelectedDate.Value;
             using (SqlDataReader dr = objr.GetAmountusingDate())
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                         Amount = dr["Amount"].ToString();
                    }
                }

            }
        }
        #endregion


        #region ValidateDateControl
        //This ValidateDateControl method is check whether controls like fromdate and selectdate are selected or not if it is not
        //then it sets validateflag to false
        public bool ValidateDateControl()
        {
            bool ValidateFlag = true;
            if (FromDateTimePicker.SelectedDate == null)
                ValidateFlag = false;

            if (ToDateTimePicker.SelectedDate == null)
                ValidateFlag = false;


            return ValidateFlag;
        }
        #endregion

        
    }
}