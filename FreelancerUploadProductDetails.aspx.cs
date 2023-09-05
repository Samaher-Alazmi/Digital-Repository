using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;

namespace DigitalRepository
{
    public partial class FreelancerUploadProductDetails : System.Web.UI.Page
    {
        SqlConnection con;
        string email;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from [User] where Email='" + Session["id"] + "'", con);
            SqlDataReader DR1 = cmd.ExecuteReader();

            if (DR1.Read())
            {
                email = DR1.GetValue(4).ToString();
            }
        }

        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        public void Save_Click(object sender, EventArgs e)
        {
            string ImageFilePath = string.Empty;
            if (imageproduct.HasFile)
            {
                imageproduct.SaveAs(Server.MapPath("~/Images/" + imageproduct.FileName));
                ImageFilePath = "~/Images/" + imageproduct.FileName;
            }
            Image1.ImageUrl = ImageFilePath;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into [Products_temp] (p_price, p_description, p_author, p_name, p_type,p_picture, p_link, Email) values (@pricep,@descp,@authorp,@namep,@typep,@picp,@link,@email)";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@pricep", price.Text);
            cmd.Parameters.AddWithValue("@descp", desc.Text);
            cmd.Parameters.AddWithValue("@authorp", author.Text);
            cmd.Parameters.AddWithValue("@namep", namep.Text);
            cmd.Parameters.AddWithValue("@typep", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@picp", ImageFilePath);
            cmd.Parameters.AddWithValue("@link", link.Text);
            cmd.Parameters.AddWithValue("@email", Session["id"].ToString());


            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Resultpro.Text = "تم اضافة المنتج بنجاح";
                //Resultpro.ForeColor = Color.Green;
                Response.Redirect("FreelancerAfterUpload.aspx");
            }


            con.Close();

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("FreelancerProducts.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}