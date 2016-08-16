using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ChurchRecordkeeping.DataAccess;
using System.Data;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.Business
{
    public class Member
    {

        #region Varibles
        //Vairiable Declaration and Intialization
    
        private string _firstname = string.Empty;
        private string _lastname = string.Empty;
        private string _address = string.Empty;
        private string _city = string.Empty;
        private string _state = string.Empty;
        private string _zipcode = string.Empty;
        private string _envelopenumber = string.Empty;
        private string _memberid = string.Empty;
        #endregion

        #region properties
        public string Firstname
        {
            get { return _firstname; }
            set { _firstname = value; }
        }

          
        public string Lastname
        {
            get { return _lastname; }
            set { _lastname = value; }
        }

          
        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }
           
        public string City
        {
            get { return _city; }
            set { _city = value; }
        }
          
        public string State
        {
            get { return _state; }
            set { _state = value; }
        }
         
        public string Zipcode
        {
            get { return _zipcode; }
            set { _zipcode = value; }
        }
           
        public string Envelopenumber
        {
            get { return _envelopenumber; }
            set { _envelopenumber = value; }
        }

        public string Memberid
        {
            get { return _memberid; }
            set { _memberid = value; }
        }
        
        #endregion

        #region Methods
        //Methodswhich communicate to Dataclass to passing varibles to and from 
        public string chkAvailabelenvelopeID()
        {
             return Memberdataaccess.chkAvailabelenvelopeID(Envelopenumber);
        }

        public int insertIntoMember()
        {           
              return Memberdataaccess.insertIntoMember(Firstname, Lastname, Address, City, State, Zipcode, Envelopenumber);
        }

        public DataTable Getmemberdetails()
        {
             DataTable dt = new DataTable();
             dt= Memberdataaccess.Getmemberdetails();
             return dt;
        }

        public int DELETEMEMBER()
        {
              return Memberdataaccess.DELETEMEMBER(Memberid);
        }

        public SqlDataReader getEditMemberDetails()
        {
               return Memberdataaccess.getEditMemberDetails(Memberid);
        }

        public int updatememberdetails()
        {
               return Memberdataaccess.updatememberdetails(Firstname, Lastname, Address, City, State, Zipcode, Envelopenumber,Memberid);
        }

        public DataTable GetStateDetailinCombo()
        {
              DataTable dt = new DataTable();
              dt = Memberdataaccess.GetStateDetailinCombo();
              return dt;
        }
        #endregion
    }
}
