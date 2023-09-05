using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalRepository
{
    public partial class ProductsMagazines : System.Web.UI.Page
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
            //if (Request.QueryString["Id"] == null)
            //{
            //    Response.Redirect("Index.aspx");
            //}
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewPrdDetail")
            {
                Response.Redirect("ProductDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }
        protected void AddToCart(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {


                con = new SqlConnection(getConStr());
                string Name = string.Empty;
                float pricelb = 0;
                //decimal quantity = Convert.ToDecimal(quantity.Text);
                decimal quantity = 1;
                Button btn = (Button)sender;
                DataListItem item = (DataListItem)btn.NamingContainer;
                Name += (item.FindControl("p_nameLabel") as Label).Text;
                Label price = (item.FindControl("p_priceLabel") as Label);
                pricelb = (float)(quantity * Convert.ToDecimal(price.Text));

                string link = (item.FindControl("link") as Label).Text;
                //foreach (DataListItem item in DataList1.Items)
                //{
                //    Label Namelb1 = DataList1.FindControl("p_nameLabel") as Label;
                //    Name = Namelb1.Text;
                //    Label price = DataList1.FindControl("p_priceLabel") as Label;
                //    pricelb = (float)(quantity * Convert.ToDecimal(price.Text));

                //}
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Insert into [cart](total_price,product_amount,Email,p_name)values(@Tprice,@amt,@email,@pName)";
                //,Email,product_id ,@email,@Pid
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Tprice", pricelb);
                cmd.Parameters.AddWithValue("@amt", quantity);
                cmd.Parameters.AddWithValue("@pName", Name);
                cmd.Parameters.AddWithValue("@email", Session["id"].ToString());
                cmd.Parameters.AddWithValue("@link", link);
                //cmd.Parameters.AddWithValue("@Pid", Request.QueryString["Id"]);
                int Result = cmd.ExecuteNonQuery();
                if (Result > 0)
                {
                    Response.Redirect("Cart.aspx");
                }
            }
            else
            {
                Response.Redirect("LoginForm.aspx");
            }
        }

        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}
