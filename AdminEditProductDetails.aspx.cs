using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalRepository
{
    public partial class AdminEditProductDetails : System.Web.UI.Page
    {
        SqlConnection con;
        private int userid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            userid = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (!IsPostBack)
            {
                SetImageUrl();
                BindControlvalues();
            }

        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetImageUrl();
        }

        private void SetImageUrl()
        {
            Random ran = new Random();
            int i = ran.Next(1, 5);
            Image1.ImageUrl = "~/images/" + i.ToString() + ".jpg";
        }


        protected void BindControlvalues()
        {
            string str = getConStr();
            con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Product where Id=" + userid, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            namep.Text = ds.Tables[0].Rows[0][4].ToString();
            price.Text = ds.Tables[0].Rows[0][1].ToString();
            DropDownList1.Text = ds.Tables[0].Rows[0][5].ToString();
            desc.Text = ds.Tables[0].Rows[0][2].ToString();
            author.Text = ds.Tables[0].Rows[0][3].ToString();   
            Image1.ImageUrl = ds.Tables[0].Rows[0][6].ToString();
            link.Text = ds.Tables[0].Rows[0][7].ToString();
            cmd.ExecuteNonQuery();
            con.Close();

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string ImageFilePath = string.Empty;
            if (imageproduct.HasFile)
            {
                imageproduct.SaveAs(Server.MapPath("~/Images/" + imageproduct.FileName));
                ImageFilePath = "~/Images/" + imageproduct.FileName;
                Image1.ImageUrl = ImageFilePath;
            }

            string str = getConStr();
            con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("update Product set p_name=@name, p_price=@price, p_type=@type, p_description=@description, p_author=@author, p_picture=@picture, p_link=@link where Id=" + userid, con);
            cmd.Parameters.AddWithValue("@name", namep.Text);
            cmd.Parameters.AddWithValue("@price", price.Text);
            cmd.Parameters.AddWithValue("@type", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@description", desc.Text);
            cmd.Parameters.AddWithValue("@author", author.Text);
            cmd.Parameters.AddWithValue("@picture", Image1.ImageUrl);
            cmd.Parameters.AddWithValue("@link", link.Text);
            cmd.ExecuteNonQuery();
            
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Resultpro.Text = "تم اضافة المنتج بنجاح";
                Resultpro.ForeColor = Color.Green;
            }
            con.Close();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminEditProducts.aspx");
        }
    }
}