using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ChurchRecordkeeping.DataAccess
{
   public class DonationDataAccess
    {
        public static string chkAvailabelenvelopeID(string Envelopenumber)
        {
            int IsAvilabel = 0;
            SqlTransaction transation = null;
            try
            {
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {
                    transation = con.BeginTransaction();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.Transaction = transation;

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter COUNT = new SqlParameter("COUNT", SqlDbType.Int);
                    COUNT.Direction = ParameterDirection.ReturnValue;
                    cmd.Parameters.Add(COUNT);

                    cmd.CommandText = "[member_sp]";
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "chkAvailableEnvelopeID"));
                    cmd.Parameters.Add(new SqlParameter("@evID", Envelopenumber));

                    cmd.ExecuteScalar();
                    cmd.Transaction.Commit();

                    IsAvilabel = Convert.ToInt32(COUNT.Value);
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();

            }

            return IsAvilabel.ToString();
        }

        // InsertintoDonation method is insert record of donation for member 
        public static int InsertintoDonation(string Envelopenumber,string Amount,string FundName,string Moneytype,string Note, DateTime Date)
        {
            int noOfRowsAffected = 0;
            //Represents a Transact-SQL transaction to be made in a SQL Server database. This class cannot be inherited
                     SqlTransaction transation = null;
            try
            {
                // Represents open conncetion to sql server to datatbase
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {   //BeginTransaction commands start database transaction
                    transation = con.BeginTransaction();
                    //SqlCommand represents store procedure to execute against SQL server database
                     SqlCommand cmd = new SqlCommand();
                     //get or set the conncetion used by the instance of sql command
                    cmd.Connection = con;
                    //get or set the transaction used by the instance of sql command executes
                    cmd.Transaction = transation;

                    cmd.CommandType = CommandType.StoredProcedure;

                    //Represents a parameter to a SqlCommand and optionally its mapping to DataSet columns.
                    SqlParameter returnValue = new SqlParameter("returnVal", SqlDbType.Int);

                    //ParameterDirection specifies parameter within queries and Return value represents an return value from an operation such as stored procedure
                    returnValue.Direction = ParameterDirection.ReturnValue;
                    cmd.Parameters.Add(returnValue);

                    //get or set storeprocedure name to execute at datasource
                    cmd.CommandText = "[donation_sp]";

                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "InsertintoDonation"));
                    cmd.Parameters.Add(new SqlParameter("@evID", Envelopenumber));
                    cmd.Parameters.Add(new SqlParameter("@Amount", Amount));
                    cmd.Parameters.Add(new SqlParameter("@Fundname", FundName));
                    cmd.Parameters.Add(new SqlParameter("@moneytype", Moneytype));
                    cmd.Parameters.Add(new SqlParameter("@note", Note));
                    cmd.Parameters.Add(new SqlParameter("@Date", Date));
                   
                    //Executes a Transact-SQL statement against the connection and returns the number of rows affected
                    cmd.ExecuteNonQuery();

                    noOfRowsAffected = Convert.ToInt32(returnValue.Value);
                    if (noOfRowsAffected != -1 && noOfRowsAffected != 0)
                    {
                        //rollback transaction from pending state
                        transation.Rollback();
                    }
                    else
                    {
                        //commit database transation
                        cmd.Transaction.Commit();

                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();

            }


            return noOfRowsAffected;
        }


        //Datatable represents one table memory data and Getmemberdetails is method to retrive details from database in datatable
        public static DataTable getfundnamedetails()
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
                    cmd.CommandText = "[donation_sp]";

                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetFundName"));


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

        //Datatable represents one table memory data and GetDonationDetailsusingDate is method to retrive details from database in datatable based on the date
        public static DataTable GetDonationDetailsusingDate(DateTime date)
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
                    cmd.CommandText = "[donation_sp]";

                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetDonationDetailsusingDate"));
                    cmd.Parameters.Add(new SqlParameter("@Date", date));

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

        //Datatable represents one table memory data and GetDonationDetails is method to retrive details from database in datatable 
        public static DataTable GetDonationDetails()
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
                    cmd.CommandText = "[donation_sp]";

                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetDonationDetails"));

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

        //Datatable represents one table memory data and GetEnvelopenumberdetails is method to retrive details from database in datatable 
        public static DataTable GetEnvelopenumberdetails()
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
                    cmd.CommandText = "[donation_sp]";

                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "GetEnvelopemember"));

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

        // DELETEDonation method is delete record of donation for Envelopenumber and Fundname
        public static int DELETEDonation(string Envelopenumber, string Fundname)
        {
            int noofRowsAffected = 0;
            // Represents open conncetion to sql server to datatbase
            using (SqlConnection connection = ConnectionManager.GetCRKSecurityConnection())
            {
                try
                {   //It represents store procedure to execute against SQL server database
                    SqlCommand command = new SqlCommand("donation_sp", connection);
                    //get or set storeprocedure name to execute at datasource
                    command.CommandType = CommandType.StoredProcedure;
                    //Removes all SqlCLientParameter
                    command.Parameters.Clear();
                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    command.Parameters.Add(new SqlParameter("@RESULT", "DELETEDonation"));
                    command.Parameters.Add(new SqlParameter("@evID", Envelopenumber));
                     command.Parameters.Add(new SqlParameter("@Fundname", Fundname));
                     //Executes a Transact-SQL statement against the connection and returns the number of rows affected
                    noofRowsAffected = Convert.ToInt32(command.ExecuteNonQuery());
                    noofRowsAffected = 1;
                }
                catch (Exception ex)
                {
                    if (connection != null)
                        connection.Close();
                }
            }
            return noofRowsAffected;
        }

        // EDITDonationDETAILS method is to edit record of donation for DonationID
        public static SqlDataReader EDITDonationDETAILS(string DonationID)
        {
            SqlDataReader dr = null;
            try
            {
                SqlConnection con = ConnectionManager.GetCRKSecurityConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[donation_sp]";
                cmd.Parameters.Add(new SqlParameter("@Result", "EDITMEMBERDETAILS"));
                cmd.Parameters.Add(new SqlParameter("@DID", DonationID));
                //cmd.Parameters.Add(new SqlParameter("@Fundname", Fundname));
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            }
            catch (Exception ex)
            {

            }
            return dr;

        }

        public static int UpdateDonationDetails(string Envelopenumber, string Amount, string FundName, string Moneytype, string Note, DateTime Date,string DonationID)
        {
            int noOfRowsAffected = 0;
            SqlTransaction transation = null;
            try
            {
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {
                    transation = con.BeginTransaction();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.Transaction = transation;

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter returnValue = new SqlParameter("returnVal", SqlDbType.Int);
                    returnValue.Direction = ParameterDirection.ReturnValue;
                    cmd.Parameters.Add(returnValue);


                    cmd.CommandText = "[donation_sp]";
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "UpdateDonationDetails"));
                    cmd.Parameters.Add(new SqlParameter("@evID", Envelopenumber));
                    cmd.Parameters.Add(new SqlParameter("@Amount", Amount));
                    cmd.Parameters.Add(new SqlParameter("@Fundname", FundName));
                    cmd.Parameters.Add(new SqlParameter("@moneytype", Moneytype));
                    cmd.Parameters.Add(new SqlParameter("@note", Note));
                    cmd.Parameters.Add(new SqlParameter("@Date", Date));
                    cmd.Parameters.Add(new SqlParameter("@DID", DonationID));
                    cmd.ExecuteNonQuery();

                    noOfRowsAffected = Convert.ToInt32(returnValue.Value);
                    if (noOfRowsAffected != -1 && noOfRowsAffected != 0)
                    {
                        transation.Rollback();
                    }
                    else
                    {
                        cmd.Transaction.Commit();

                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();

            }


            return noOfRowsAffected;
        }

    }
}
