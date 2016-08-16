using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace ChurchRecordkeeping.DataAccess
{
   public class ConnectionManager
    {
       //represents an open connection to SQL server Database
       public static SqlConnection GetCRKSecurityConnection()

       {    //It initiizes new instance of SqlConnection class when given string that contains connection string
           SqlConnection connection = new SqlConnection(Configuration.CRKConnectionString);

           //empties the conncetion pool that associated with the specified connection
           SqlConnection.ClearPool(connection);

           connection.Open();

           return connection;

       }
    }
}
