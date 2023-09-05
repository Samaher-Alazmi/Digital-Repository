using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace DigitalRepository
{
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("error");
                Session["id"] = email.Value;
            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void login_Click(object sender, EventArgs e)
        {

            string userEmail = email.Value.ToLower();
            string userPass = password.Value;
            Session["id"] = userEmail;

            con = new SqlConnection(getConStr());
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + userEmail + "'", con);

            SqlDataReader reader;
            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                string email = reader.GetString(4).ToLower();
                string password = reader.GetString(3);
                int role = reader.GetInt32(5);

                if (email == userEmail && password == userPass)
                {
                    if(role == 1)
                    {
                        Response.Redirect("AdminHomepage.aspx");
                        Session["id"] = email;
                    }

                    if(role == 2)
                    {
                        Response.Redirect("ResourceManagerUploadProductDetails.aspx");
                        Session["id"] = email;
                    }
                        
                    Response.Redirect("Index.aspx");
                    Session["id"] = email;
                }
            }
            con.Close();
        }
        
    }
}