using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalRepository
{
    public partial class Cart : System.Web.UI.Page
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
            decimal price = 0;
            if (Session["id"] == null)
            {
                Response.Redirect("LoginForm.aspx");
            }
            else
            {
                //if ()
                //{
                //    Response.Redirect("VisitorEmptyCart.aspx");
                //}
                //else {
                foreach (GridViewRow item in GridView1.Rows)
                {
                    price = price + Convert.ToDecimal(item.Cells[1].Text);
                }

                //}
                Result.Text = price.ToString();
                if (price == 0)
                {
                    Response.Redirect("EmptyCart.aspx");
                }

            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Payment_click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void deldetP(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}