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
    public partial class AdminOrderManagement : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
            }
        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrderManagment.aspx");
        }
        void FillGrid()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(getConStr()))
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM [Order]", con);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "لا يوجد بيانات متاحة";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }



        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "UPDATE [Order] SET order_status=@status WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@status", (GridView1.Rows[e.RowIndex].FindControl("txtstatus") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    FillGrid();
                    lblSuccessMsg.Text = "تم تعديل الطلب بنجاح";
                    lblErrorMsg.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void UsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillGrid();
        }

        protected void UsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillGrid();
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "DELETE FROM [Order] WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    FillGrid();
                    lblSuccessMsg.Text = "تم حذف الطلب بنجاح";
                    lblErrorMsg.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}