using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.DataAccess
{
    public class ReportDataAccess
    {
        #region GetDonationDetailsusingDate
        //Datatable represents one table memory data and GetDonationDetailsusingDate is method where 
        //from date and todate are passing using method to retrive details from database in datatable
        public static DataTable GetDonationDetailsusingDate(DateTime fromdate,DateTime toDate)
        {   
            //it represent table
            DataTable dt = new DataTable();
            try
            {  
                // Represents open conncetion to sql server to datatbase
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {
                    //It represents store procedure to execute against SQL server database
                    SqlCommand cmd = new SqlCommand();
                   
                    //get or set the conncetion used by the instance of sql command
                    cmd.Connection = con;

                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    //get or set storeprocedure name to execute at datasource
                    cmd.CommandText = "[report_sp]";
                    
                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetreportDetailsusingDate"));
                    cmd.Parameters.Add(new SqlParameter("@startDate", fromdate));
                    cmd.Parameters.Add(new SqlParameter("@endDate", toDate));
                    
                    //Provided a way of reading a forward stream of rows from sql server database
                    //sends command text to a conncetion and builds sql datareader using one of the behaviour rule
                    //CloseConnection using this associated datareader object is closed
                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    
                    // get the values whether SqlDataReader contain one or more rows
                    if (dr.HasRows)
                       
                        //if the datatable contain the rows then incoming datasource is merged with existing rows.
                        dt.Load(dr);
                }
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion

        #region GetreportDetailsusingmembername
        //Datatable represents one table memory data and GetreportDetailsusingmembername is method where 
        //MemberName are passing  to retrive details from database in datatable
        public static DataTable GetreportDetailsusingmembername(string MemberName)
        {   //it represent table
            DataTable dt = new DataTable();
            try
            { 
                // Represents open conncetion to sql server to datatbase
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                { 
                    //It represents store procedure to execute against SQL server database
                    SqlCommand cmd = new SqlCommand();

                    //get or set the conncetion used by the instance of sql command
                    cmd.Connection = con;

                    //specifies how command string is interpreted
                    cmd.CommandType = CommandType.StoredProcedure;
                   
                    //get or set storeprocedure name to execute at datasource
                    cmd.CommandText = "[report_sp]";
                   
                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetreportDetailsusingmembername"));
                    cmd.Parameters.Add(new SqlParameter("@Firstname", MemberName));
                   
                    //Provided a way of reading a forward stream of rows from sql server database
                    //sends command text to a conncetion and builds sql datareader using one of the behaviour rule
                    //CloseConnection using this associated datareader object is closed
                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                   
                    // get the values whether SqlDataReader contain one or more rows
                    if (dr.HasRows)
                        
                        //if the datatable contain the rows then incoming datasource is merged with existing rows.
                        dt.Load(dr);
                }
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion

        #region GetreportDetailsusingmembernamewithdate
        //Datatable represents one table memory data and GetreportDetailsusingmembernamewithdate is method where 
        //fromdate,toDate and MemberName are passing  to retrive details from database in datatable
        public static DataTable GetreportDetailsusingmembernamewithdate(DateTime fromdate, DateTime toDate, string MemberName)
        {
            //it represent table
            DataTable dt = new DataTable();
            try
            {    // Represents open conncetion to sql server to datatbase
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {
                    //It represents store procedure to execute against SQL server database
                    SqlCommand cmd = new SqlCommand();

                    //get or set the conncetion used by the instance of sql command
                    cmd.Connection = con;

                    //specifies how command string is interpreted
                    cmd.CommandType = CommandType.StoredProcedure;

                    //get or set storeprocedure name to execute at datasource
                    cmd.CommandText = "[report_sp]";

                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetreportDetailsusingmembernamewithdate"));
                    cmd.Parameters.Add(new SqlParameter("@startDate", fromdate));
                    cmd.Parameters.Add(new SqlParameter("@endDate", toDate));
                    cmd.Parameters.Add(new SqlParameter("@Firstname", MemberName));

                    //Provided a way of reading a forward stream of rows from sql server database
                    //sends command text to a conncetion and builds sql datareader using one of the behaviour rule
                    //CloseConnection using this associated datareader object is closed
                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    // get the values whether SqlDataReader contain one or more rows
                    if (dr.HasRows)

                        //if the datatable contain the rows then incoming datasource is merged with existing rows.
                         dt.Load(dr);
                }
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion

        #region GetAmountusingDate
        // GetAmountusingDate is SqlDataReader method it retrive details in row after filtering startdate and enddate
        //SqlDataReader provide way of reading of rows from sql server database
        public static SqlDataReader GetAmountusingDate(DateTime startdate, DateTime enddate)
        {
            SqlDataReader dr = null;
            try
            {   // Represents open conncetion to sql server to datatbase
                SqlConnection con = ConnectionManager.GetCRKSecurityConnection();

                //It represents store procedure to execute against SQL server database
                SqlCommand cmd = new SqlCommand();

                //get or set the conncetion used by the instance of sql command
                cmd.Connection = con;

                //specifies how command string is interpreted
                cmd.CommandType = CommandType.StoredProcedure;

                //get or set storeprocedure name to execute at datasource
                cmd.CommandText = "[report_sp]";

                //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                //of new system
                cmd.Parameters.Add(new SqlParameter("@Result", "GetAmountusingDate"));

                cmd.Parameters.Add(new SqlParameter("@startDate", startdate));
                cmd.Parameters.Add(new SqlParameter("@endDate", enddate));

                //Provided a way of reading a forward stream of rows from sql server database
                //sends command text to a conncetion and builds sql datareader using one of the behaviour rule
                //CloseConnection using this associated datareader object is closed
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            }
            catch (Exception ex)
            {

            }
            return dr;

        }
        #endregion

        #region GetAmountusingDatenmember

        // GetAmountusingDatenmember is SqlDataReader method it retrive details in row after filtering startdate and enddate and MemberName 
        //SqlDataReader provide way of reading of rows from sql server database
        public static SqlDataReader GetAmountusingDatenmember(DateTime startdate, DateTime enddate, string MemberName)
        {
            SqlDataReader dr = null;
            try
            {   // Represents open conncetion to sql server to datatbase
                SqlConnection con = ConnectionManager.GetCRKSecurityConnection();

                //It represents store procedure to execute against SQL server database
                SqlCommand cmd = new SqlCommand();

                //get or set the conncetion used by the instance of sql command
                cmd.Connection = con;

                //specifies how command string is interpreted
                cmd.CommandType = CommandType.StoredProcedure;

                //get or set storeprocedure name to execute at datasource
                cmd.CommandText = "[report_sp]";

                //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                //of new system
                cmd.Parameters.Add(new SqlParameter("@Result", "GetAmountusingDatenmember"));

                cmd.Parameters.Add(new SqlParameter("@startDate", startdate));
                cmd.Parameters.Add(new SqlParameter("@endDate", enddate));
                cmd.Parameters.Add(new SqlParameter("@Firstname", MemberName));

                //Provided a way of reading a forward stream of rows from sql server database
                //sends command text to a conncetion and builds sql datareader using one of the behaviour rule
                //CloseConnection using this associated datareader object is closed
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            }
            catch (Exception ex)
            {

            }
            return dr;

        }
        #endregion
    }
}
