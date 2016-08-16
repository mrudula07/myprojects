using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ChurchRecordkeeping.DataAccess;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.Business
{
    public class Report
    {
        #region Variables   
        private string envelopenumber;
        private string donationID;
        private string membername;
        private string amount;
        private string fundName;
        private string moneytype;
        private DateTime fromdate;
        private DateTime todate;
        #endregion

        #region Properties
        public string DonationID
        {
            get { return donationID; }
            set { donationID = value; }
        }
        
        public string Membername
        {
            get { return membername; }
            set { membername = value; }
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
       
        public DateTime FDate
        {
            get { return fromdate; }
            set { fromdate = value; }
        }
        
        public DateTime Todate
        {
            get { return todate; }
            set { todate = value; }
        }
        #endregion


        #region
        public DataTable GetDonationDetailsusingDate()
        {
            return ReportDataAccess.GetDonationDetailsusingDate(FDate,Todate);
        }

        public DataTable GetreportDetailsusingmembername()
        {
            return ReportDataAccess.GetreportDetailsusingmembername(Membername);
         }

        public SqlDataReader GetAmountusingDate()
        {
            return ReportDataAccess.GetAmountusingDate(FDate, Todate);
        }

        public SqlDataReader GetAmountusingDatenmember()
        {
            return ReportDataAccess.GetAmountusingDatenmember(FDate, Todate,Membername);
        }
        public DataTable GetreportDetailsusingmembernamewithdate()
        {
            return ReportDataAccess.GetreportDetailsusingmembernamewithdate(FDate, Todate,Membername);
        }
        #endregion
    }
}


