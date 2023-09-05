using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalRepository
{
    public partial class FreelancerProfile : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con = new SqlConnection(getConStr());
                con.Open();

                save.Visible = false;

                SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + Session["id"] + "'", con);
                SqlDataReader DR1 = cmd.ExecuteReader();

                if (DR1.Read())
                {
                    Fname.Value = DR1.GetValue(1).ToString(); //Place_name
                    Lname.Value = DR1.GetValue(2).ToString();
                    Email.Value = DR1.GetValue(4).ToString(); //Place_email  
                    Phone.Value = DR1.GetValue(6).ToString(); //Place_collage
                    Birth.Value = DR1.GetValue(7).ToString();
                    Address.Value = DR1.GetValue(8).ToString();
                    con.Close();
                    con.Dispose();
                }
            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void profile_Click(object sender, EventArgs e)
        {
            String user = Convert.ToString(Session["id"]);
            string str = getConStr();
            con = new SqlConnection(str);
            con.Open();

            SqlCommand cmd = new SqlCommand("update [User] SET FirstName=@Fname,LastName=@Lname,Email=@Email,PhoneNum=@Phone,BirthDate=@BirthDate,Address=@Address where Email='" + Session["id"] + "'", con);
            cmd.Parameters.AddWithValue("@Fname", Fname.Value);
            cmd.Parameters.AddWithValue("@Lname", Lname.Value);
            cmd.Parameters.AddWithValue("@Email", Email.Value);
            cmd.Parameters.AddWithValue("@Phone", Phone.Value);
            cmd.Parameters.AddWithValue("@BirthDate", Birth.Value);
            cmd.Parameters.AddWithValue("@Address", Address.Value);
            cmd.ExecuteNonQuery();

            //Response.Redirect("~/FreelancerProfile.aspx");

            save.Visible = true;

            con.Close();
        }

    }
}
