using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ChurchRecordkeeping.DataAccess
{
     public class FundDataAccess
    {
        // chkAvailableFundName method is to check for FundName whether it is present or not  
         public static string chkAvailableFundName(string FundName)
        {
            int IsAvilabel = 0;
            //Represents a Transact-SQL transaction to be made in a SQL Server database. This class cannot be inherited
             SqlTransaction transation = null;
            try
            {    // Represents open conncetion to sql server to datatbase
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {    //BeginTransaction commands start database transaction
                    transation = con.BeginTransaction();
                    //SqlCommand represents store procedure to execute against SQL server database
                    SqlCommand cmd = new SqlCommand();
                    //get or set the conncetion used by the instance of sql command
                    cmd.Connection = con;
                    //get or set the transaction used by the instance of sql command executes
                    cmd.Transaction = transation;
                    //Represents a parameter to a SqlCommand and optionally its mapping to DataSet columns.
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter COUNT = new SqlParameter("COUNT", SqlDbType.Int);
                    //ParameterDirection specifies parameter within queries and Return value represents an return value from an operation such as stored procedure
                    COUNT.Direction = ParameterDirection.ReturnValue;
                    cmd.Parameters.Add(COUNT);
                    //get or set storeprocedure name to execute at datasource
                    cmd.CommandText = "[Fund_sp]";
                    //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                    //of new system
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "chkAvailableFundName"));
                    cmd.Parameters.Add(new SqlParameter("@FundName", FundName));
                    //Executes a Transact-SQL statement against the connection and returns the number of rows affected
                    cmd.ExecuteScalar();
                    //rollback transaction commit
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

         public static int InsertintoFund(string FundName)
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


                    cmd.CommandText = "[Fund_sp]";
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "InsertintoFund"));
                    cmd.Parameters.Add(new SqlParameter("@FundName", FundName));
                   
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

         public static DataTable getfunddetails()
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[Fund_sp]";
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "getfunddetails"));
                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    if (dr.HasRows)
                        dt.Load(dr);
                }
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

         public static int DELETEFund(int FundNumber)
             
        {
            int noofRowsAffected = 0;
            using (SqlConnection connection = ConnectionManager.GetCRKSecurityConnection())
            {
                try
                {
                    SqlCommand command = new SqlCommand("Fund_sp", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("@RESULT", "DELETEFund"));
                    command.Parameters.Add(new SqlParameter("@FundID", FundNumber));

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

         public static SqlDataReader getEDITFUNDDETAILS(int FundNumber)
        {
            SqlDataReader dr = null;
            try
            {
                SqlConnection con = ConnectionManager.GetCRKSecurityConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[Fund_sp]";
                cmd.Parameters.Add(new SqlParameter("@Result", "EDITFUNDDETAILS"));
                cmd.Parameters.Add(new SqlParameter("@FundID", FundNumber));
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            }
            catch (Exception ex)
            {

            }
            return dr;

        }

         public static int UpdateFundDetails(int FundNumber, string FundName)
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


                    cmd.CommandText = "[Fund_sp]";
                    cmd.Parameters.Add(new SqlParameter("@RESULT", "UpdateFundDetails"));
                    cmd.Parameters.Add(new SqlParameter("@FundName", FundName));
                    cmd.Parameters.Add(new SqlParameter("@FundID", FundNumber));
                   

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
