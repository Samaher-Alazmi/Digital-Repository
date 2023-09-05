using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;

namespace DigitalRepository
{
    public partial class AdminHomepage : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con = new SqlConnection(getConStr());
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + Session["id"] + "'", con);
                SqlDataReader DR1 = cmd.ExecuteReader();

                string welcome = "أهلا بك،";

                if (DR1.Read())
                {
                    welcome += DR1.GetValue(1).ToString();
                }
                welc.InnerText = welcome;
            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void UserManagement(object sender, EventArgs e)
        {
            Response.Redirect("AdminUserManagement.aspx");
        }
        protected void FreelancerManagement(object sender, EventArgs e)
        {
            Response.Redirect("AdminFreelancerManagement.aspx");
        }
        protected void ProductManagement(object sender, EventArgs e)
        {
            Response.Redirect("AdminProductManagement.aspx");
        }
        protected void OrderManagement(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrderManagement.aspx");
        }
        protected void ReportsPage(object sender, EventArgs e)
        {
            Response.Redirect("AdminReportsPage.aspx");
        }
    }
}