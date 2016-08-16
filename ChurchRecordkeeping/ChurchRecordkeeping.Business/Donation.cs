using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ChurchRecordkeeping.DataAccess;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.Business
{
    public class Donation
    {
        #region Variables
        private string envelopenumber;
        private string donationID;
        private string amount;
        private string fundName;
        private string moneytype;
        private DateTime date;
        private string note;
        #endregion

        #region Properties
        public string DonationID
        {
            get { return donationID; }
            set { donationID = value; }
        }

        public string Envelopenumber
        {
            get { return envelopenumber; }
            set { envelopenumber = value; }
        }
       
        public string Amount
        {
            get { return amount; }
            set { amount = value; }
        }
        
        public string FundName
        {
            get { return fundName; }
            set { fundName = value; }
        }
        
        public string Moneytype
        {
            get { return moneytype; }
            set { moneytype = value; }
        }
        
        public string Note
        {
            get { return note; }
            set { note = value; }
        }
       
        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        #endregion

        #region Methods
        public DataTable GetEnvelopenumberdetails()
        {
            return DonationDataAccess.GetEnvelopenumberdetails();
        }
        
         public DataTable getfundnamedetails()
        {
            return DonationDataAccess.getfundnamedetails();
        }

         public  int  InsertintoDonation()
        {
            return DonationDataAccess.InsertintoDonation(Envelopenumber,Amount,FundName,Moneytype,Note,Date);
        }

         public DataTable GetDonationDetailsusingDate()
         {
             return DonationDataAccess.GetDonationDetailsusingDate(Date);
         }


         public DataTable getdonationdetails()
        {
            DataTable dt = new DataTable();
            dt = DonationDataAccess.GetDonationDetails();
            return dt;
        }

        public int DELETEDonation()
        {
            return DonationDataAccess.DELETEDonation(Envelopenumber,FundName);
        }

        public SqlDataReader EDITDonationDETAILS()
        {
            return DonationDataAccess.EDITDonationDETAILS(DonationID);
        }

        public int UpdateDonationDetails()
        {
            return DonationDataAccess.UpdateDonationDetails(Envelopenumber,Amount,FundName,Moneytype,Note,Date,DonationID);
        }
        #endregion



    }

}
