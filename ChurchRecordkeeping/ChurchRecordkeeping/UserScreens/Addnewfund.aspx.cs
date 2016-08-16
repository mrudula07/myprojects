using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChurchRecordkeeping.Business;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace ChurchRecordkeeping.UserScreens
{
    public partial class Addnewfund : System.Web.UI.Page
    {
        Fund Objfund = new Fund();
        Validations val = new Validations();
        string FundName = string.Empty;
        int fundID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getdetail();
            }

        }

     

        public void getdetail()
        {

            if (Request.QueryString["FID"] != null)
                fundID = Convert.ToInt32((Request.QueryString["FID"].ToString()));
            if (fundID != 0)
            {
                Save1.Text = "Update";
                createlabel.Text = "Update Fund";
                getEditDetails(fundID);
            }
        }


        #region EVENTS

        protected void Save_onclick(object sender, EventArgs e)
        {
            lblErrorMsg.Text = string.Empty;

            if (validatefundcontrol() == false)
            {
                Validations.showMessage(lblErrorMsg, Validations.Msg_mandatory, "Error");
                return;
            }
            else
            {

                string lbl = fundnametxtbox.Text;
                // Regex r = new Regex(@"[~`!@#$%^&*()-+=|\{}':;.,<>/?]");
                Regex r = new Regex("^[a-zA-Z ]+$");

                //Regex r = new Regex(@"^[a-zA-Z]+(\s[a-zA-Z]+)?$");
                if (r.IsMatch(fundnametxtbox.Text))
                {

                    lblErrorMsg.Text = "";

                    if (Request.QueryString["FID"] != null)
                        fundID = Convert.ToInt32((Request.QueryString["FID"].ToString()));

                    if (fundID == 0)
                    {
                        InsertFundDetails();
                    }
                    else
                    {
                        Save1.Text = "Update";
                        createlabel.Text = "Update Fund";
                        UpdateFundDetails(fundID);
                    }




                }
                else
                {

                    lblErrorMsg.Text = ("Enter the Fund for ex.General Fund");
                    fundnametxtbox.Text = "";
                    
                }
            }
            
           

           
        }


        protected void Cancel_onclick(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            fundnametxtbox.Text = "";
        }
        #endregion


        #region InsertFundDetails
        protected void InsertFundDetails()
        {

            int noOfRowsaffected = 0;
            Objfund.Fundname = fundnametxtbox.Text.Trim();
            string IsAvailabel = string.Empty;
            IsAvailabel = Objfund.chkAvailableFundName();

            if (IsAvailabel == "0")
            {
                try
                {
                    noOfRowsaffected = Objfund.InsertintoFund();
                    Validations.showMessage(lblErrorMsg, Validations.Msg_AddFund, "Success");
                }
                catch (Exception ex)
                {

                }

            }
            else
            {
                Validations.showMessage(lblErrorMsg, "Fund Name" + Validations.Err_Duplicate, "Error");
            }
        }

        #endregion


        #region UpdateFundDetails
        protected void UpdateFundDetails(int fundID)
        {
            int noOfRowsaffected = 0;
            Objfund.Fundnumber = fundID;
            Objfund.Fundname = fundnametxtbox.Text.Trim();
          
            try
            {
                noOfRowsaffected = Objfund.UpdateFundDetails();
                Validations.showMessage(lblErrorMsg, Validations.Msg_updatedFund, "Success");
            }
            catch (Exception ex)
            {

            }
        }

        #endregion

        #region validation

        public bool validatefundcontrol()
        {
            bool ValidateFlag = true;

            if (fundnametxtbox.Text == string.Empty)
                ValidateFlag = false;

           
            return ValidateFlag;
        }
        #endregion

        #region getEditDetails

        protected void getEditDetails(int fundID)
        {
            Objfund.Fundnumber = fundID;
            using (SqlDataReader dr = Objfund.getEDITFUNDDETAILS())
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        fundnametxtbox.Text = dr["FundName"].ToString();
                       
                    }
                }
            }

        }

        #endregion
    }
}