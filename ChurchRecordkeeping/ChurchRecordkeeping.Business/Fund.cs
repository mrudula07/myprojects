using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ChurchRecordkeeping.DataAccess;
using System.Data;
using System.Data.SqlClient;
namespace ChurchRecordkeeping.Business
{
   public class Fund
   {
        #region Variables
       private string fundname;
       private int fundnumber;
       #endregion

        #region Properties
       public string Fundname
        {
            get { return fundname; }
            set { fundname = value; }
        }

       
        public int Fundnumber
        {
            get { return fundnumber; }
            set { fundnumber = value; }
        }
        #endregion

        #region Methods
        public string chkAvailableFundName()
        {
            return FundDataAccess.chkAvailableFundName(Fundname);
        }

        public int InsertintoFund()
        {
            return FundDataAccess.InsertintoFund(Fundname);
        }

        public DataTable getfunddetails()
        {
            DataTable dt = new DataTable();
            dt = FundDataAccess.getfunddetails();
            return dt;
        }

        public int DELETEFund()
        {
            return FundDataAccess.DELETEFund(Fundnumber);
        }

        public SqlDataReader getEDITFUNDDETAILS()
        {
            return FundDataAccess.getEDITFUNDDETAILS(Fundnumber);
        }

        public int UpdateFundDetails()
        {
            return FundDataAccess.UpdateFundDetails(Fundnumber,Fundname);
        }
        #endregion



   }
}
