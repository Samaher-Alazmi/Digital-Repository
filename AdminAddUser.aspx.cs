using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.Diagnostics;
using System.Linq.Expressions;

namespace DigitalRepository
{
    public partial class AdminAddUser : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void add_Click(object sender, EventArgs e)
        {
            string uname = fname.Text;
            string uname2 = lname.Text;
            string uphone = phone.Text;
            string uemail = email.Text.ToLower();
            string upass = password.Text;
            string udate = date.Value;
            string uaddress = address.Text;

            string role = rolelist.SelectedValue;
            int urole=0;

            switch (role)
            {
                case "visitor":
                    urole= 4;
                    break;

                case "freelancer":
                    urole = 3;
                    break;

                case "manager":
                    urole = 2;
                    break;

                case "admin":
                    urole = 1;
                    break;

                default:
                    break;
            }


            con = new SqlConnection(getConStr());
            con.Open();

            SqlCommand cmd = new SqlCommand("insert into [User] (FirstName,LastName,Password,Email,Role,PhoneNum,BirthDate,Address) values (@FirstName,@LastName,@Password,@Email,@Role,@PhoneNum,@BirthDate,@Address)", con);

            cmd.Parameters.AddWithValue("@FirstName", uname);
            cmd.Parameters.AddWithValue("@LastName", uname2);
            cmd.Parameters.AddWithValue("@Password", upass);
            cmd.Parameters.AddWithValue("@Email", uemail);
            cmd.Parameters.AddWithValue("@Role", urole);
            cmd.Parameters.AddWithValue("@PhoneNum", uphone);
            cmd.Parameters.AddWithValue("@BirthDate", udate);
            cmd.Parameters.AddWithValue("@Address", uaddress);
            cmd.ExecuteNonQuery();

            Response.Redirect("AdminAddUser.aspx");
            Session["id"] = uemail;

            con.Close();
        }
    }
}