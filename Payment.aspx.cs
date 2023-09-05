using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalRepository
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        static int OrderId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Pay.Visible = false;
            StcInfo.Visible = false;
            madaInfo.Visible = false;
        }

        protected void Mada_Click(object sender, EventArgs e)
        {
            StcInfo.Visible = false;
            madaInfo.Visible = true;
            Pay.Visible = true;
        }
        protected void Stc_Click(object sender, EventArgs e)
        {
            madaInfo.Visible = false;
            StcInfo.Visible = true;
            Pay.Visible = true;
        }

        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }

        protected void Save_order(object sender, EventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();

            cmd.CommandText = "select * from [Cart] where Email= @email";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@email", Session["id"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            InsertRowToOrder(ds.Tables[0]);

            Response.Redirect("Invoice.aspx");

        }

        private void InsertRowToOrder(DataTable dataTable)
        {
            con.Close();
            con = new SqlConnection(getConStr());
            int id = 0;
            string name = "";
            float price = 0;
            string link = "";
            con.Open();
            SqlDataReader DR1;
            cmd.CommandText = "Select sum(total_price) from [Cart] where Email=@email4";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@email4", Session["id"].ToString());

            float total = float.Parse(cmd.ExecuteScalar().ToString());

            cmd.CommandText = "Select * from [Cart] where Email=@email1";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@email1", Session["id"].ToString());
            DR1 = cmd.ExecuteReader();

            if (DR1.Read())
            {
                price = float.Parse(DR1["total_price"].ToString());
                id = int.Parse(DR1["Id"].ToString());
                name = DR1.GetValue(6).ToString();
            }
            DR1.Close();

            cmd.CommandText = "Select count(*) from [Order] ";


            int test = int.Parse(cmd.ExecuteScalar().ToString());

            if (test == 0)
            {
                OrderId = 1;
            }
            else
            {

                cmd.CommandText = "Select Id from [Order] order by Id desc";
                cmd.Connection = con;
                OrderId = int.Parse(cmd.ExecuteScalar().ToString());
                OrderId++;
            }


            foreach (DataRow dr in dataTable.Rows)
            {

                cmd.CommandText = "Select * from [Cart] where Email=@email6";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@email6", Session["id"].ToString());
                DR1 = cmd.ExecuteReader();
                if (DR1.Read())
                {
                    price = float.Parse(DR1["total_price"].ToString());
                    id = int.Parse(DR1["Id"].ToString());
                    name = DR1.GetValue(6).ToString();
                    link = DR1.GetValue(7).ToString();
                }
                DR1.Close();

                cmd.CommandText = "INSERT INTO [TempOrder] (Id,P_name,Email,Total,Order_Date,P_price,Order_Status,p_link) VALUES (@order_id,@product_name,@email3,@total2,@order_date,@product_price,@order_status,@link)";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@product_name", name);
                cmd.Parameters.AddWithValue("@order_id", OrderId);
                cmd.Parameters.AddWithValue("@email3", Session["id"].ToString());
                cmd.Parameters.AddWithValue("@total2", total);
                cmd.Parameters.AddWithValue("@order_date", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@product_price", price);
                cmd.Parameters.AddWithValue("@order_status", "تم التنفيذ");
                cmd.Parameters.AddWithValue("@link", link);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();

                cmd.CommandText = "INSERT INTO [Order] (Id,P_name,Email,Total,Order_Date,P_price,Order_Status,p_link) VALUES (@order_id,@product_name,@email3,@total2,@order_date,@product_price,@order_status,@link)";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@product_name", name);
                cmd.Parameters.AddWithValue("@order_id", OrderId);
                cmd.Parameters.AddWithValue("@email3", Session["id"].ToString());
                cmd.Parameters.AddWithValue("@total2", total);
                cmd.Parameters.AddWithValue("@order_date", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@product_price", price);
                cmd.Parameters.AddWithValue("@order_status", "تم التنفيذ");
                cmd.Parameters.AddWithValue("@link", link);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                DeleteFromCart(id);


            }

            con.Close();
        }


        private void DeleteFromCart(int id)
        {
            con = new SqlConnection(getConStr());
            con.Open();
            cmd.CommandText = "Delete from [Cart] where Email= @email2 and Id =" + id;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@email2", Session["id"].ToString());
            cmd.ExecuteNonQuery();

        }
    }
}