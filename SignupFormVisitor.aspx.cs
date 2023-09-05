using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Helpers;
using System.Xml.Linq;

namespace DigitalRepository
{
    public partial class SignupFormVisitor : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("error");
                Session["id"] = email.Value;

                ValidPhone.Visible = false;
                EmailExist.Visible = false;
            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void signup_Click(object sender, EventArgs e)
        {

            string uname = name.Value;
            string uname2 = name2.Value;
            string uphone = phone.Value;
            string uemail = email.Value.ToLower();
            string upass = password.Value;
            string udate = date.Value;
            string uaddress = address.Value;

            Session["id"] = uemail;

            con = new SqlConnection(getConStr());
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + uemail + "'", con);

            SqlDataReader reader;
            reader = cmd.ExecuteReader();

            if (IsDigitsOnly(uphone) == false || uphone.StartsWith("05") == false || uphone.Length != 10)
            {
                ValidPhone.Visible = true;
                Response.Write(ValidPhone.Text = "* الرجاء ادخال الرقم بشكل صحيح");

            }

            else if (reader.Read())
            {
                string email = reader.GetString(4).ToLower();


                if (email == uemail)
                {
                    ValidPhone.Visible = false;
                    EmailExist.Visible = true;
                    Response.Write(EmailExist.Text = "* الإيميل مستخدم مسبقا!");
                    Session["id"] = email;
                    reader.Close();
                }

            }


            else
            {

                reader.Close();

                cmd = new SqlCommand("insert into [User] (FirstName,LastName,Password,Email,Role,PhoneNum,BirthDate,Address) values (@FirstName,@LastName,@Password,@Email,@Role,@PhoneNum,@BirthDate,@Address)", con);

                cmd.Parameters.AddWithValue("@FirstName", uname);
                cmd.Parameters.AddWithValue("@LastName", uname2);
                cmd.Parameters.AddWithValue("@Password", upass);
                cmd.Parameters.AddWithValue("@Email", uemail);
                cmd.Parameters.AddWithValue("@Role", 4);
                cmd.Parameters.AddWithValue("@PhoneNum", uphone);
                cmd.Parameters.AddWithValue("@BirthDate", udate);
                cmd.Parameters.AddWithValue("@Address", uaddress);
                cmd.ExecuteNonQuery();

                Response.Redirect("Index.aspx");
                Session["id"] = uemail;

                con.Close();
            }


        }

        private bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }
            return true;
        }


    }
}
