using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
namespace Test
{
    /// <summary>
    /// Summary description for userWebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class userWebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public void getUsers()
        {
            string query = "select Date, Email from User";
            List<User> users = new List<User>();
            string cs = ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    User user = new User();
                    user.Id = Convert.ToInt32(rdr["Id"]);
                    user.AccountNumber = rdr["AccountNumber"].ToString();
                    user.BankName= rdr["BankName"].ToString();
                    user.Amount= rdr["Amount"].ToString();
                    user.CellNumber= rdr["CellNumber"].ToString();
                    user.Address= rdr["Address"].ToString();
                    user.CNIC= rdr["CNIC"].ToString();
                    user.Date = rdr["Date"].ToString();
                    user.Email = rdr["Email"].ToString();
                    users.Add(user);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(users));
        }
    }
}
