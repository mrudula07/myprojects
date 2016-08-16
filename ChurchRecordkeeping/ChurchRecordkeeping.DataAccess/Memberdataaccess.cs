using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ChurchRecordkeeping.DataAccess
{
   public class Memberdataaccess
   {
       #region chkAvailabelenvelopeID
       //chkAvailabelenvelopeID is method which checks whether Envelopenumber is already present in database or not 
       public static string chkAvailabelenvelopeID(string Envelopenumber)
       {
           // IsAvilabel to 0
           int IsAvilabel = 0;
            
           //Represents a Transact-SQL transaction to be made in a SQL Server database. This class cannot be inherited
           SqlTransaction transation = null;
           try
           {     // Represents open conncetion to sql server to datatbase
               using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
               {    //local variable of SqlTransaction
                   transation = con.BeginTransaction(); //BeginTransaction commands start database transaction

                   //SqlCommand represents store procedure to execute against SQL server database
                   SqlCommand cmd = new SqlCommand();

                   //get or set the conncetion used by the instance of sql command
                   cmd.Connection = con;

                   //get or set the transaction used by the instance of sql command executes
                   cmd.Transaction = transation;

                   cmd.CommandType = CommandType.StoredProcedure;

                   //Represents a parameter to a SqlCommand and optionally its mapping to DataSet columns.
                   SqlParameter COUNT = new SqlParameter("COUNT", SqlDbType.Int);
                   //ParameterDirection specifies parameter within queries and Return value represents an return value from an operation such as stored procedure
                   COUNT.Direction = ParameterDirection.ReturnValue;
                   cmd.Parameters.Add(COUNT);

                   //get or set storeprocedure name to execute at datasource
                   cmd.CommandText = "[member_sp]";

                   //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                   //of new system
                   cmd.Parameters.Add(new SqlParameter("@RESULT", "chkAvailableEnvelopeID"));
                   cmd.Parameters.Add(new SqlParameter("@evID", Envelopenumber));

                   //Executes the query, and returns the first column of the first row in the result set returned by the query. Additional columns or rows are ignored.
                   cmd.ExecuteScalar();

                   //commit database transation
                   cmd.Transaction.Commit();

                   //get count in IsAvilabel 
                   IsAvilabel = Convert.ToInt32(COUNT.Value);
               }
           }
           catch (Exception ex)
           {
               ex.Message.ToString();

           }

           return IsAvilabel.ToString();
       }
       #endregion
       
       #region Getmemberdetails
       //Datatable represents one table memory data and Getmemberdetails is method to retrive details from database in datatable
       public static DataTable Getmemberdetails()
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
                   cmd.CommandText = "[member_sp]";

                   //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                   //of new system
                   cmd.Parameters.Add(new SqlParameter("@RESULT", "getmemberdetails"));

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

       #region GetStateDetailinCombo
       //Datatable represents one table memory data and GetStateDetailinCombo is method to retrive details from database in datatable
       public static DataTable GetStateDetailinCombo()
       {     //it represent table
           DataTable dt = new DataTable();
           try
           {   // Represents open conncetion to sql server to datatbase
               using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
               {
                   //It represents store procedure to execute against SQL server database
                   SqlCommand cmd = new SqlCommand();

                   //get or set the conncetion used by the instance of sql command
                   cmd.Connection = con;
                   cmd.CommandType = CommandType.StoredProcedure;

                   //get or set storeprocedure name to execute at datasource
                   cmd.CommandText = "[member_sp]";

                   //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                   //of new system
                   cmd.Parameters.Add(new SqlParameter("@RESULT", "FillStateCombo"));

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

       #region DELETEMEMBER
       //DELETEMEMBER method delete the memberdetails from Table member using MID
       public static int DELETEMEMBER(string memberID)
       {
           int noofRowsAffected = 0;

           // Represents open conncetion to sql server to datatbase
           using (SqlConnection connection = ConnectionManager.GetCRKSecurityConnection())
           {
               try
               {
                   //SqlCommand represents store procedure to execute against SQL server database and
                   ////get or set storeprocedure name to execute at datasource
                   SqlCommand command = new SqlCommand("member_sp", connection);
                   command.CommandType = CommandType.StoredProcedure;

                   //remove all objects from SQL Parameters collection
                   command.Parameters.Clear();

                   //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                   //of new system
                   command.Parameters.Add(new SqlParameter("@RESULT", "DELETEMEMBER"));
                   command.Parameters.Add(new SqlParameter("@MID", memberID));
                   //Executes the query, and returns the first column of the first row in the result set returned by the query. Additional columns or rows are ignored.
                   noofRowsAffected = Convert.ToInt32(command.ExecuteNonQuery());
                   noofRowsAffected = 1;
               }
               catch (Exception ex)
               {
                   if (connection != null)
                       //close connction
                       connection.Close();
               }
           }
           return noofRowsAffected;
       }
       #endregion

       #region getEditMemberDetails
       // getEditMemberDetails method is to get details of member from database based on ID 
       public static SqlDataReader getEditMemberDetails(string MemberID)
       {
           SqlDataReader dr = null;
           try
           {
               // Represents open conncetion to sql server to datatbase
               SqlConnection con = ConnectionManager.GetCRKSecurityConnection();

               //SqlCommand represents store procedure to execute against SQL server database and
               ////get or set storeprocedure name to execute at datasource
               SqlCommand cmd = new SqlCommand();

               //get or set the conncetion used by the instance of sql command
               cmd.Connection = con;
               cmd.CommandType = CommandType.StoredProcedure;

               //get or set storeprocedure name to execute at datasource
               cmd.CommandText = "[member_sp]";

               //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
               //of new system
               cmd.Parameters.Add(new SqlParameter("@Result", "EDITMEMBERDETAILS"));
               cmd.Parameters.Add(new SqlParameter("@MID", MemberID));
               dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

           }
           catch (Exception ex)
           {
              
           }
           return dr;

       }
       #endregion

       #region insertIntoMember
       //Insertion of details of member using insertIntoMember method into database 
       public static int insertIntoMember(string Firstname, string Lastname, string Address, string City, string State, string Zipcode, string Envelopenumber)
       {
           int noOfRowsAffected = 0;

           //Represents a Transact-SQL transaction to be made in a SQL Server database. This class cannot be inherited
           SqlTransaction transation = null;
           try
           {
               // Represents open conncetion to sql server to datatbase
               using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
               {
                   transation = con.BeginTransaction(); //BeginTransaction commands start database transaction

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
                   cmd.CommandText = "[member_sp]";
                   //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                   //of new system
                   cmd.Parameters.Add(new SqlParameter("@RESULT", "InsertintoMember"));
                   cmd.Parameters.Add(new SqlParameter("@FirstName", Firstname));
                   cmd.Parameters.Add(new SqlParameter("@LastName", Lastname));
                   cmd.Parameters.Add(new SqlParameter("@address", Address));
                   cmd.Parameters.Add(new SqlParameter("@City", City));
                   cmd.Parameters.Add(new SqlParameter("@State", State));
                   cmd.Parameters.Add(new SqlParameter("@Zipcode", Zipcode));
                   cmd.Parameters.Add(new SqlParameter("@evID", Envelopenumber));

                   //Executes the query, and returns the first column of the first row in the result set returned by the query. Additional columns or rows are ignored.
                   cmd.ExecuteNonQuery();

                   //get the count of rows that afftected
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
       #endregion

       #region updatememberdetails
       //updatememberdetails method is update the details of member in database
       public static int updatememberdetails(string Firstname, string Lastname, string Address, string City, string State, string Zipcode, string Envelopenumber,string mid)
       {
           int noOfRowsAffected = 0;
           //Represents a Transact-SQL transaction to be made in a SQL Server database. This class cannot be inherited
            SqlTransaction transation = null;
           try
           {
               // Represents open conncetion to sql server to datatbase
               using (SqlConnection con = ConnectionManager.GetCRKSecurityConnection())
               {
                   //BeginTransaction commands start database transaction
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
                   cmd.CommandText = "[member_sp]";
                   //get the sql parameter conncetion using sqlcommand and initializes new instance of sql parametername and the value 
                   //of new system
                   cmd.Parameters.Add(new SqlParameter("@RESULT", "UpdateMemberDetails"));
                   cmd.Parameters.Add(new SqlParameter("@FirstName", Firstname));
                   cmd.Parameters.Add(new SqlParameter("@LastName", Lastname));
                   cmd.Parameters.Add(new SqlParameter("@address", Address));
                   cmd.Parameters.Add(new SqlParameter("@City", City));
                   cmd.Parameters.Add(new SqlParameter("@State", State));
                   cmd.Parameters.Add(new SqlParameter("@Zipcode", Zipcode));
                   cmd.Parameters.Add(new SqlParameter("@evID", Envelopenumber));
                   cmd.Parameters.Add(new SqlParameter("@MID", mid));
                   //Executes the query, and returns the first column of the first row in the result set returned by the query. Additional columns or rows are ignored.
                 
                   cmd.ExecuteNonQuery();

                   //get the count of rows that afftected
                   noOfRowsAffected = Convert.ToInt32(returnValue.Value);

                   if (noOfRowsAffected != -1 && noOfRowsAffected != 0)
                   {
                       //rollback transaction from pending state
                       transation.Rollback();
                   }
                   else
                   {
                       //commit database transaction
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
       #endregion

   }
}
