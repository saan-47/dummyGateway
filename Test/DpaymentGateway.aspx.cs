using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class DpaymentGateway : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string guid()
        {
            string NewGuid = System.Guid.NewGuid().ToString();
            return NewGuid.Trim();
        }
        //onclick button function
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //calling database
                using (var db = new DataClasses1DataContext())
                {
                    //object of database class
                    User user = new User()
                    {
                        AccountNumber = TextBox5.Text.Trim(),
                        BankName = DropDownList1.SelectedValue.Trim(),
                        Amount = TextBox2.Text.Trim(),
                        Email = TextBox3.Text.Trim(),
                        CellNumber = TextBox4.Text.Trim(),
                        Address = TextBox6.Text.Trim(),
                        TransactionID = guid(),
                        Date = DateTime.Now.ToString(),
                        CNIC = TextBox1.Text.Trim()
                    };
                    db.Users.InsertOnSubmit(user);
                    db.SubmitChanges();
                    Label9.Text = "Form Submitted successfully";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox4.Text = "";
                    TextBox2.Text = "";
                    TextBox1.Text = "";
                    TextBox3.Text = "";
                }
            }
            else
            {
                Label9.Text = "Please Try again with currect credentials";
            }
        }
    }
    }
