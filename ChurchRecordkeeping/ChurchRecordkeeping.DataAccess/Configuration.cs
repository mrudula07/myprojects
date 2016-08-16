using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace ChurchRecordkeeping.DataAccess
{
   public abstract class  Configuration
    {
       public static String CRKConnectionString
       {
           get
           {   //Provides access to the configuration files for client applications.Using this we can
               //access connectionstring which is written in WEB.config
               return ConfigurationManager.ConnectionStrings["CRKSecurityString"].ConnectionString;
           }
       }
    }
}
