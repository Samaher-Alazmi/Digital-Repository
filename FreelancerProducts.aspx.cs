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
    public partial class FreelancerProducts : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

            //    + "&p_type=" + gr.Cells[5].Text
            if (!IsPostBack)
            {
                BindGridview();
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



        protected void BindGridview()
        {
            string str = getConStr();
            con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Product WHERE Email='" + Session["id"] + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            DataSet ds = new DataSet();
            da.Fill(ds);
            // GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}