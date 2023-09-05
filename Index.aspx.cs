using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DigitalRepository
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con;
        string email;
        //Based on the role of the user that logged in, we specify the appropriate master page before page load.
        protected void Page_PreInit(object sender, EventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + Session["id"] + "'", con);
            SqlDataReader DR1 = cmd.ExecuteReader();

            string role = "";

            if (DR1.Read())
            {
                role = DR1.GetValue(5).ToString();
                email = DR1.GetValue(4).ToString();
            }

            if (role == "1")
                this.Page.MasterPageFile = "~/AdminMaster.Master";
            else if (role == "2")
                this.Page.MasterPageFile = "~/ProductManagerMaster.Master";
            else if (role == "3")
                this.Page.MasterPageFile = "~/FreelancerMaster.Master";
            else if (role == "4")
                this.Page.MasterPageFile = "~/VisitorMaster.Master";
            else
                this.Page.MasterPageFile = "~/MasterPage.Master";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
    }
}