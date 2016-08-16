using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Drawing;

namespace ChurchRecordkeeping.Business
{
   public class Validations
    {

        #region Member
        public const string Msg_mandatory = "All * fields are mandatory.";
        public static string Msg_AddMember = "Member added successfully.";
       public static string Msg_AddMembererror = "Member is not geting added.";
       

        public static string Msg_updatedMember = "Member updated successfully.";
        public static string RecordDeleted = "deleted successfully.";
        public static string Err_RefDelete = "is not getting deleted";
        public static string Err_ = "Please Enter all mandetory fields ";
        public static string Err_retrivemember = "An error occurred while retrieving the Member. Please try again.";
        public static string Err_Duplicate = " already exists.";
        public static string Msg_EnterSearchText = "Please enter search text.";
        public const string Msg_entervalidamount = "Please enter valid numbers.";
        
        public static string Msg_AddFund = "Fund created successfully.";
        public static string Msg_updatedFund = "Fund updated successfully.";
        public static string Msg_datefield = "Select both date or enter member name";

        public static string Msg_Adddonation = "Donation added successfully.";
        public static string Msg_updatedonation = "Donation updated successfully.";
       
        
       
        #endregion

        public static Label showMessage(Label ErrLabel, string Message, string Type)
        {

            ErrLabel.Text = Message;
            ErrLabel.Visible = true;

            if (Type == "Error")
                ErrLabel.ForeColor = Color.Red;
            else
                ErrLabel.ForeColor = Color.Green;
            return ErrLabel;
        }




    }
}
