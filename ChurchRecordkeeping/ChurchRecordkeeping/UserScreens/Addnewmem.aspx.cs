#region directives
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChurchRecordkeeping.Business;
using System.Data.SqlClient;
using System.Data;
using Telerik.Web.UI;
#endregion

namespace ChurchRecordkeeping.UserScreens
{
public partial class Addnewmem : System.Web.UI.Page
{
    #region variable declaration

    Member objm = new Member();
    Validations val = new Validations();
    string envelopID = string.Empty;
    string MID = string.Empty;
    #endregion

    #region Page Load 
    protected void Page_Load(object sender, EventArgs e)
    {
           
        if (!Page.IsPostBack)
        {
            GetStateDetailinCombo();
            getdetail();
        }


    }
    #endregion

    #region GetStateDetailinCombo
    //GetStateDetailinCombo is to bind state details to combobox
    public void GetStateDetailinCombo()
    {
        //using DataTable we can get the state details from database and those are bind to combobox
        using (DataTable dt = objm.GetStateDetailinCombo())
        {
            StateRadComboBox.DataSource = dt;
            StateRadComboBox.DataTextField = "State";
            StateRadComboBox.DataValueField = "Statenumber";
            StateRadComboBox.DataBind();
            StateRadComboBox.Items.Insert(0, new RadComboBoxItem("--- Select ---", "0"));

        }
    }
    #endregion

    #region getdetails of EID from querystring to edit details  
    public void getdetail()
    {

        if (Request.QueryString["EID"] != null)
            MID = (Request.QueryString["EID"].ToString());
        if (MID != string.Empty)
        {
            save1.Text = "Update";
            addmember.Text = "Update Member";
            getEditDetails(MID);
        }
    }
    #endregion

    #region InsertMemberDetails
    //InsertMemberDetails method is used insert the member details into database 
    protected void InsertMemberDetails()
    {

        int noOfRowsaffected = 0;
        objm.Firstname = FirstnameIDtxtbox.Text.Trim();
        objm.Lastname = LastnameIDtxtbox.Text.Trim();
        objm.Address = AddressRadTextBox.Text.Trim();
        objm.City = CityIDtxtbox.Text.Trim();
        objm.State = StateRadComboBox.SelectedItem.Text.Trim();
        objm.Zipcode = ZipcodeRadTextBox.Text.Trim();
        objm.Envelopenumber = EnvelopeRadText.Text.Trim();
        string IsAvailabel = string.Empty;

        //checking whether it is IsAvailabel or not 
        IsAvailabel = objm.chkAvailabelenvelopeID();

        //if it is not available then it wil insert  
        if (IsAvailabel == "0")
        {
            try
            {
                noOfRowsaffected = objm.insertIntoMember();
                //is display that member is added successfully.
                Validations.showMessage(lblErrorMsg, Validations.Msg_AddMember, "Success");
            }
            catch (Exception ex)
            {   //else catching error
                Validations.showMessage(lblErrorMsg, Validations.Msg_AddMembererror, "Error");
            }

        }
        else
        {
            Validations.showMessage(lblErrorMsg, "EnvelopID" + Validations.Err_Duplicate, "Error");
        }
    }

    #endregion


    #region EditMemberDetails
    //EditMemberDetails method is to update member details based on mid number.
    protected void EditMemberDetails(string mid)
    {
        //updated fields are passing to objects of business through which is will pass to data class to enter into database
        int noOfRowsaffected = 0;
        objm.Memberid = mid;
        objm.Firstname = FirstnameIDtxtbox.Text.Trim();
        objm.Lastname = LastnameIDtxtbox.Text.Trim();
        objm.Address = AddressRadTextBox.Text.Trim();
        objm.City = CityIDtxtbox.Text.Trim();
        objm.State = StateRadComboBox.SelectedItem.Text.Trim();
        objm.Zipcode = ZipcodeRadTextBox.Text.Trim();
        objm.Envelopenumber = EnvelopeRadText.Text.Trim();

        string IsAvailabel = string.Empty;
        //IsAvailabel is chexking envelopid is available or not 
        IsAvailabel = objm.chkAvailabelenvelopeID();

        try
        {   // updatememberdetails method from busniess class is passing details to dataclass to update member details
            noOfRowsaffected = objm.updatememberdetails();
            // message is displying for updating member successfully.
            Validations.showMessage(lblErrorMsg, Validations.Msg_updatedMember, "Success");
        
        }
        catch (Exception ex)
        {
            //Error is displying if duplicates members are exist 
            Validations.showMessage(lblErrorMsg, "EnvelopeID" + Validations.Err_Duplicate, "Error");
        }
    }

    #endregion

    #region validation
    // validatemembercontrol is checking whether field is empty or not 
    //if it is iempty then  validationflag assign as false else it is true.
    public bool validatemembercontrol()
    {
        bool ValidateFlag = true;

        if (FirstnameIDtxtbox.Text == string.Empty)
            ValidateFlag = false;

        if (LastnameIDtxtbox.Text == string.Empty)
            ValidateFlag = false;

        if (AddressRadTextBox.Text == string.Empty)
            ValidateFlag = false;

        if (CityIDtxtbox.Text == string.Empty)
            ValidateFlag = false;

        if (StateRadComboBox.SelectedItem.Text == "--- Select ---")
            ValidateFlag = false;

        if (ZipcodeRadTextBox.Text == string.Empty)
            ValidateFlag = false;

        if (EnvelopeRadText.Text == string.Empty)
            ValidateFlag = false;
        return ValidateFlag;
    }
    #endregion

    #region getEditDetails
    // getEditDetails method is get details of member based on EID number using SqlDataReader 
    //from database using objm which is object of business class member to get details
    protected void getEditDetails(string MID)
    {
        objm.Memberid = MID;
        //getEditMemberDetails in SqlDataReader
        using (SqlDataReader dr = objm.getEditMemberDetails())
        {   //if it is not empty 
            if (dr.HasRows)
            {   // the read the SqlDataReader
                while (dr.Read())
                { //disply the fields
                    FirstnameIDtxtbox.Text = dr["Firstname"].ToString();
                    LastnameIDtxtbox.Text = dr["Lastname"].ToString();
                    AddressRadTextBox.Text = dr["Address"].ToString();
                    CityIDtxtbox.Text = dr["City"].ToString();
                    GetStateDetailinCombo();
                    StateRadComboBox.SelectedItem.Text = dr["State"].ToString();
                    ZipcodeRadTextBox.Text = dr["Zipcode"].ToString();
                    EnvelopeRadText.Text = dr["Envelopenumber"].ToString();
                }
            }
        }

    }

    #endregion

    #region EVENTS

    //StateRadComboBox_OnSelectedIndexChanged to set focus on next textbox
    protected void StateRadComboBox_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ZipcodeRadTextBox.Focus();
    }

    //this is button event to redirect to gridview page
    protected void Viewgrid_click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    //it is save button click event where checking of validations of fields and update, edit, or insert the members
    //basis of data
    protected void Save_onclick(object sender, EventArgs e)
    {
        lblErrorMsg.Text = string.Empty;

        //call validatemember control method to check validation if it is false will show error 
        // else it will insert or edit member details basis on the value of EID which will be getting from querystring
        if (validatemembercontrol()==false)
        {
            Validations.showMessage(lblErrorMsg, Validations.Msg_mandatory, "Error");
            return;
        }
        
            //get the value of EID from querystring 
        else if (Request.QueryString["EID"] != null)
        {
            MID = (Request.QueryString["EID"].ToString());
            //change name of label from save  to update
            save1.Text = "Update";
            addmember.Text = "Update Member";
            //call EditMemberDetails method to disply details on respective field
            EditMemberDetails(MID);
        }
        else
        {   //call InsertMemberDetails method to  insert details of member 
            InsertMemberDetails();
        }
    }

    // Cancel_onclick event is to clear fiels of add member page 
    protected void Cancel_onclick(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        FirstnameIDtxtbox.Text = "";
        LastnameIDtxtbox.Text = "";
        AddressRadTextBox.Text = "";
        CityIDtxtbox.Text = "";
        StateRadComboBox.SelectedIndex = 0;
        ZipcodeRadTextBox.Text = "";
        EnvelopeRadText.Text = "";
            

    }
    // ZipcodeRadTextBox_OnTextChanged event is used to validate the  ZipcodeRadTextBox 
    protected void ZipcodeRadTextBox_OnTextChanged(object sender, EventArgs e)
    {   //Using below expression user can only enter numbers for ZipcodeRadTextBox 
 
        if (System.Text.RegularExpressions.Regex.IsMatch(ZipcodeRadTextBox.Text, "[^0-9]"))
        {
            lblErrorMsg.Text = "Please enter only numbers.";

        }
        else
        {
            lblErrorMsg.Text = "";
            //set focus to a next field
            EnvelopeRadText.Focus();
        }
    }

    // TextBox1_TextChanged event is used to validate the  FirstnameIDtxtbox 
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string lbl = FirstnameIDtxtbox.Text;
        //Using below expression user can only enter charcters for FirstnameIDtxtbox 
       
        if (System.Text.RegularExpressions.Regex.IsMatch(FirstnameIDtxtbox.Text, "^[a-zA-Z]+$"))
        {
            lblErrorMsg.Text = "";
            //Focus is set to next field.  
            LastnameIDtxtbox.Focus();
        }
        else
        {
             lblErrorMsg.Text=("Enter the firstname for ex.Rachel ");

        }
    }

    // LastnameIDtxtbox_TextChanged event is used to validate the  LastnameIDtxtbox 
    protected void LastnameIDtxtbox_TextChanged(object sender, EventArgs e)
    {
        string lbl = LastnameIDtxtbox.Text;
        //Using below expression user can only enter charcters for LastnameIDtxtbox 
        if (System.Text.RegularExpressions.Regex.IsMatch(LastnameIDtxtbox.Text, "^[a-zA-Z]+$"))
        {
            lblErrorMsg.Text = "";

            //Focus is set to next field.
            AddressRadTextBox.Focus();
        }
        else
        {
            lblErrorMsg.Text = ("Enter the Lastname for ex.stewart ");
        }
    }

    // CityIDtxtbox_TextChanged event is used to validate the  Citytextbox 
    protected void CityIDtxtbox_TextChanged(object sender, EventArgs e)
    {
        string lbl = CityIDtxtbox.Text;
        //Using below expression user can only enter charcters for city 
        if (System.Text.RegularExpressions.Regex.IsMatch(CityIDtxtbox.Text, "^[a-zA-Z ]+$"))
        {
            lblErrorMsg.Text = "";
            //set focus to next field
            StateRadComboBox.Focus();
        }
        else
        {
            CityIDtxtbox.Text = CityIDtxtbox.Text.Remove(CityIDtxtbox.Text.Length - 1);
            lblErrorMsg.Text = ("Enter the Cityname for ex.Dallas ");



        }
    }

    // EnvelopeRadText_OnTextChanged event is used to validate the  envelopetextboxtextbox 
    protected void EnvelopeRadText_OnTextChanged(object sender, EventArgs e)
    {
        string lbl = EnvelopeRadText.Text;
        //regular expression for numbers is used. So user can only enter the numbers.
        if (System.Text.RegularExpressions.Regex.IsMatch(EnvelopeRadText.Text, "[^0-9]"))
        {
            lblErrorMsg.Text = "Please enter only numbers.";
        }
        else
        {
            lblErrorMsg.Text = "";
            //focus is set to next fields
            save1.Focus();
        }
    }
    #endregion

}
}