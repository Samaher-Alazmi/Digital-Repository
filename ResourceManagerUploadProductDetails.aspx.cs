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
    public partial class UploadProductDetails : System.Web.UI.Page
    {


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
            cmd.CommandText = "insert into [Product] (p_price, p_description, p_author, p_name, p_type,p_picture,p_link) values (@pricep,@descp,@authorp,@namep,@typep,@picp,@link)";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@pricep", price.Text);
            cmd.Parameters.AddWithValue("@descp", desc.Text);
            cmd.Parameters.AddWithValue("@authorp", author.Text);
            cmd.Parameters.AddWithValue("@namep", namep.Text);
            cmd.Parameters.AddWithValue("@typep", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@picp", ImageFilePath);
            cmd.Parameters.AddWithValue("@link", link.Text);

            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Resultpro.Text = "تم اضافة المنتج بنجاح";
                Resultpro.ForeColor = Color.Green;
            }


            con.Close();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}