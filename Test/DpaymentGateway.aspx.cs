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

        public void getSecuredData(string mobilenumber, string transID)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            DataClasses1DataContext db = new DataClasses1DataContext();
            //var userData = from usertable in db.Users
            //               select new
            var userData = from usertable in db.Users
                    where usertable.TransactionID == TextBox7.Text.Trim()
                    && usertable.CellNumber == TextBox8.Text.Trim()
                    select new
                    {
                        usertable.Id,
                               usertable.AccountNumber,
                               usertable.BankName,
                               usertable.Amount,
                               usertable.Email,
                               usertable.CellNumber,
                               usertable.Date,
                               usertable.Address,
                               usertable.CNIC,
                               usertable.TransactionID,
                           };
            GridView1.DataSource = userData;
            GridView1.DataBind();
        }

        //public bool isvalid(string tID, string Mnumber)
        //{
        //DataClasses1DataContext db = new DataClasses1DataContext();
        //var q = from p in db.Users
        //        where p.TransactionID == TextBox7.Text.Trim()
        //        && p.CellNumber == TextBox8.Text.Trim()
        //        select p;
        //if (q.Any())
        //{
        //    return true;
        //}
        //else
        //{
        //    return false;
        //}

        //}
        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    if(isvalid(TextBox7.Text, TextBox8.Text))
        //    {
        //        DataClasses1DataContext db = new DataClasses1DataContext();
        //        var data = from user in db.Users
        //                   where user.TransactionID == TextBox7.Text
        //                   && user.CellNumber == TextBox8.Text
        //                   select user;
        //        if (data.Any())
        //        {

        //        }
        //    }
        //    else
        //    {
        //        Label11.Text = "wrong again";
        //    }

        //}
    }
    }
