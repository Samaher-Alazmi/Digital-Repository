using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalRepository
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection con;
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
            }
            //string role = Session["userRole"].ToString();

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
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("Index.aspx");
                }

            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}