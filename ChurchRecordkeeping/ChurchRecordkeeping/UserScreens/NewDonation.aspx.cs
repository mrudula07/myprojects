using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChurchRecordkeeping.Business;
using System.Data;
using Telerik.Web.UI;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.UserScreens
{
    public partial class NewDonation : System.Web.UI.Page
    {
          Donation objd = new Donation();
        Validations val = new Validations();
        string envelopID = string.Empty;
        string fundname = string.Empty;
        string DID = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getfundnamedetails();
                GetEnvelopenumberdetails();
                getdetail();
            }

          

        }

        public void getdetail()
        {

            if (Request.QueryString["DID"] != null)
            {
                DID = (Request.QueryString["DID"].ToString());
            }


            if (DID != string.Empty)
            {
                Savebutton.Text = "Update";
                createdonation.Text = "Update Donation";
                getEditDetails(DID);
            }
        }

        #region getEditDetails

        protected void getEditDetails(string DID)
        {
            objd.DonationID = DID;
          
            using (SqlDataReader dr = objd.EDITDonationDETAILS())
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                       
                         GetEnvelopenumberdetails();
                        EnveRadComboBox.SelectedItem.Text = dr["Envelopenumber"].ToString().Trim();
                        getfundnamedetails();
                        Fundnameradcombo.SelectedItem.Text = dr["FundName"].ToString().Trim();
                        moneytypecombo.SelectedIndex = 0;
                        moneytypecombo.SelectedItem.Text = dr["Moneytype"].ToString().Trim();
                        Amounttxtbox.Text = dr["Amount"].ToString();
                        NoteRadTextBox.Text = dr["Note"].ToString();
                        RadDatePicker.SelectedDate =Convert.ToDateTime( dr["Date"].ToString());
                       
                        //moneytypecombo.SelectedItem.Text = mtype.ToString();
                    }
                }
            }

        }

        #endregion

        protected void Save_onclick(object sender, EventArgs e)
        {
            lblErrorMsg.Text = string.Empty;

            if (validatedonationcontrol() == false)
            {
                Validations.showMessage(lblErrorMsg, Validations.Msg_mandatory, "Error");
                return;
            }
            else if(validatedonationcontrol() == true)
            {
                bool isValidNumeric = ValidateNumber(Amounttxtbox.Text);
                if (isValidNumeric == false)
                {
                   // lblErrorMsg.Text = "Please enter valid numbers.";
                    Validations.showMessage(lblErrorMsg, Validations.Msg_entervalidamount, "Error");
                   
                    return;
                }
                
                else if (Request.QueryString["DID"] != null)
                {
                    DID = (Request.QueryString["DID"].ToString());
                    EditDonationDetails(DID);
                }

                else 
                {
                    InsertMemberDetails();
                }
               

            
            }

            
        }

        protected void clearbutton_click(object sender, EventArgs e)
        {
            Amounttxtbox.Text = string.Empty;
            RadDatePicker.SelectedDate = null;
            GetEnvelopenumberdetails();
            getfundnamedetails();
            moneytypecombo.Items.Clear();
            //moneytypecombo.SelectedItem.Text = "---Select Money Type---";

            moneytypecombo.Items.Insert(0,
        new Telerik.Web.UI.RadComboBoxItem { Text = "Cash", Value = "1" }   );
            moneytypecombo.Items.Insert(0,
        new Telerik.Web.UI.RadComboBoxItem { Text = "Check", Value = "2" });
  
            
            lblErrorMsg.Text = "";

        }

        public static bool ValidateNumber(string number)
        {
            bool validatenum = true;
            try
            {
                double _num = Convert.ToDouble(number.Trim());
                if (_num > 0)
                {
                    return true;
                }
               
               
            }
            catch
            {
                return false;
            }
            return false;
        }

        #region validation

        public bool validatedonationcontrol()
        {
            bool ValidateFlag = true;

            if (Amounttxtbox.Text == string.Empty)
                ValidateFlag = false;

            if (RadDatePicker.SelectedDate == null)
               ValidateFlag = false;

            if (EnveRadComboBox.SelectedItem.Text == "--- Select ---")
                ValidateFlag = false;

            if (Fundnameradcombo.SelectedItem.Text == "--- Select ---")
                ValidateFlag = false;

            if (moneytypecombo.SelectedItem.Text == "---Select Money Type---")
                ValidateFlag = false;

            return ValidateFlag;
        }
        #endregion


        #region EditDonationDetails
        protected void EditDonationDetails(string Did)
        {
            int noOfRowsaffected = 0;
            objd.DonationID = Did;
            objd.Amount = Amounttxtbox.Text.Trim();
            objd.Note = NoteRadTextBox.Text.Trim();
            objd.Moneytype = moneytypecombo.SelectedItem.Text.Trim();
            objd.Date = RadDatePicker.SelectedDate.Value;
            objd.FundName = Fundnameradcombo.SelectedItem.Text.Trim();
            objd.Envelopenumber = EnveRadComboBox.SelectedItem.Text.Trim();
           
            try
            {
                noOfRowsaffected = objd.UpdateDonationDetails();
                Validations.showMessage(lblErrorMsg, Validations.Msg_updatedonation, "Success");
            }
            catch (Exception ex)
            {

            }
        }

        #endregion



        public void GetEnvelopenumberdetails()
        {

            using (DataTable dt = objd.GetEnvelopenumberdetails())
            {
                EnveRadComboBox.DataSource = dt;
                EnveRadComboBox.DataTextField = "Envelopenumber";
                EnveRadComboBox.DataValueField = "Firstname";
                EnveRadComboBox.DataBind();
                EnveRadComboBox.Items.Insert(0, new RadComboBoxItem("--- Select ---", "0"));

            }
        }

        public void getfundnamedetails()
        {

            using (DataTable dt = objd.getfundnamedetails())
            {
                Fundnameradcombo.DataSource = dt;
                Fundnameradcombo.DataTextField = "FundName";
                Fundnameradcombo.DataValueField = "Fundnumber";
                Fundnameradcombo.DataBind();
                Fundnameradcombo.Items.Insert(0, new RadComboBoxItem("--- Select ---", "0"));

            }
        }



           #region InsertMemberDetails
        protected void InsertMemberDetails()
        {
            
                int noOfRowsaffected = 0;
                objd.Amount = Amounttxtbox.Text.Trim();
                if (RadDatePicker.SelectedDate == null)
                {
                    RadDatePicker.SelectedDate= DateTime.Today;
                    objd.Date = RadDatePicker.SelectedDate.Value;
                }
                else
                {
                    objd.Date = RadDatePicker.SelectedDate.Value;
                }
                objd.Envelopenumber = EnveRadComboBox.SelectedItem.Text.Trim();
                objd.FundName = Fundnameradcombo.SelectedItem.Text.Trim();
                objd.Note = NoteRadTextBox.Text.Trim();
                objd.Moneytype = moneytypecombo.SelectedItem.Text.Trim();
                string IsAvailabel = string.Empty;

               // IsAvailabel = objd.chkAvailabelenvelopeID();

                //if (IsAvailabel == "0")
                //{
                    try
                    {
                        noOfRowsaffected = objd.InsertintoDonation();
                        Validations.showMessage(lblErrorMsg, Validations.Msg_Adddonation, "Success");
                    }
                    catch (Exception ex)
                    {
                        Validations.showMessage(lblErrorMsg, "Is not inserted", "Error");
                    }
                   
                }
                //else 
                //{
                //    Validations.showMessage(lblErrorMsg, "Fund Name" + Validations.Err_Duplicate, "Error");
                //}
            }

        #endregion


       
    
}