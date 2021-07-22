using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Donation.Models
{
    public class DBConnect
    {
        public static SqlConnection myCon = null;

        public static SqlConnection CreateConnection()
        {
            //Get connection string from web.config file  
            string strcon = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            myCon = new SqlConnection(strcon);
            return myCon;
        }
    }
}