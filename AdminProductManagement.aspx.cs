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
    public partial class AdminProductManagement : System.Web.UI.Page
    {
        //SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void ProductManagement(object sender, EventArgs e)
        {
            Response.Redirect("AdminEditProducts.aspx");
        }
        protected void OrderManagement(object sender, EventArgs e)
        {
            Response.Redirect("AdminUploadProductApproval.aspx");
        }
    }
}