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
    public partial class VisitorMaster : System.Web.UI.MasterPage
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

                string welcome = "أهلا،";

                if (DR1.Read())
                {
                    welcome += DR1.GetValue(1).ToString();
                }
                userName.InnerText = welcome;
            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginForm.aspx");
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var SearchText = Server.UrlEncode(txtSearchMaster.Text);
            if (SearchText.Contains("عرض") || SearchText.Contains("تقديم") || SearchText.Contains("بوربوينت") || SearchText.Contains("عروض") || SearchText.Contains("powerpoint"))
            {
                Response.Redirect("ProductsPresentations.aspx");
            }

            else if (SearchText.Contains("فيديو") || SearchText.Contains("فيديوهات") || SearchText.Contains("video") || SearchText.Contains("vid"))
            {
                Response.Redirect("ProductsVideos.aspx");
            }

            else if (SearchText.Contains("شهادة") || SearchText.Contains("شهادات") || SearchText.Contains("تميز") || SearchText.Contains("تخرج") || SearchText.Contains("certificate"))
            {
                Response.Redirect("ProductsCertificates.aspx");
            }

            else if (SearchText.Contains("كتيب") || SearchText.Contains("كتيبات") || SearchText.Contains("بروشور") || SearchText.Contains("بروشورات") || SearchText.Contains("book") || SearchText.Contains("كتاب"))
            {
                Response.Redirect("ProductsBooklets.aspx");

            }
            else if (SearchText.Contains("بطاقة ") || SearchText.Contains("بريدية") || SearchText.Contains("بطاقات") || SearchText.Contains("card") || SearchText.Contains("cards"))
            {
                Response.Redirect("ProductsCards.aspx");

            }
            else if (SearchText.Contains("مجلة ") || SearchText.Contains("مجلات") || SearchText.Contains("تعليمية") || SearchText.Contains("magazine") || SearchText.Contains("magazines"))
            {
                Response.Redirect("ProductsMagazines.aspx");

            }
        }

    }
}