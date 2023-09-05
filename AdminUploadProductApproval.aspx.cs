using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Text;


namespace DigitalRepository
{
    public partial class AdminUploadProductApproval : System.Web.UI.Page
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

        void FillGrid()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(getConStr()))
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM [Products_temp]", con);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                UsersGridView.DataSource = dtbl;
                UsersGridView.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                UsersGridView.DataSource = dtbl;
                UsersGridView.DataBind();
                UsersGridView.Rows[0].Cells.Clear();
                UsersGridView.Rows[0].Cells.Add(new TableCell());
                UsersGridView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                UsersGridView.Rows[0].Cells[0].Text = "لا يوجد بيانات متاحة";
                UsersGridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from[Products_temp] where Id=@Id", con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
            SqlDataReader DR2;



            DR2 = cmd.ExecuteReader();

            string sessionmail = "";
            string link = "";

            if (DR2.Read())
            {
                sessionmail = DR2[8].ToString();
                link = DR2[7].ToString();
            }


            StringBuilder body = new StringBuilder();

            try
            {
                using (con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    using (MailMessage mail = new MailMessage())
                    {

                        mail.From = new MailAddress("digitalrepository.kau@gmail.com");
                        mail.To.Add(sessionmail);
                        mail.Subject = "تم قبول طلبك";

                        body.AppendLine("<h1> تم قبول طلبك لرفع المنتج في موقعنا! يمكنك الان عرض منتجك وحذفه من الموقع من صفحة 'منتجاتي'</h1>");

                        mail.Body = body.ToString();
                        mail.IsBodyHtml = true;

                        using (var smtpClient = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient.Credentials = new System.Net.NetworkCredential("digitalrepository.kau@gmail.com", "uhobogpxcxwelmkm");

                            smtpClient.EnableSsl = true;
                            smtpClient.Send(mail);
                            //Label1.Text = "send successfuly";

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //    Label1.Text = ex.Message;

            }

            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "INSERT INTO [Product] (p_price, p_description, p_author, p_name, p_type, p_picture, p_link, Email) VALUES (@p_price, @p_description, @p_author, @p_name, @p_type, @p_picture, @link, @email)";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@p_price", (UsersGridView.Rows[e.RowIndex].FindControl("txtPrice") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@p_description", (UsersGridView.Rows[e.RowIndex].FindControl("txtDesc") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@p_author", (UsersGridView.Rows[e.RowIndex].FindControl("txtAuthor") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@p_type", (UsersGridView.Rows[e.RowIndex].FindControl("txtType") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@p_name", (UsersGridView.Rows[e.RowIndex].FindControl("txtName") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@p_picture", (UsersGridView.Rows[e.RowIndex].FindControl("txtPic") as Image).ToString());
                    sqlCmd.Parameters.AddWithValue("@link", link);
                    sqlCmd.Parameters.AddWithValue("@email", sessionmail);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    UsersGridView.EditIndex = -1;
                    FillGrid();
                    lblSuccessMsg.Text = "تم قبول المنتج بنجاح";
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
            UsersGridView.EditIndex = e.NewEditIndex;
            FillGrid();
        }

        protected void UsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from[Products_temp] where Id=@Id", con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
            SqlDataReader DR2;


            DR2 = cmd.ExecuteReader();

            string sessionmail = "";

            if (DR2.Read())
            {
                sessionmail = DR2[8].ToString();
            }


            StringBuilder body = new StringBuilder();

            try
            {
                using (con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    using (MailMessage mail = new MailMessage())
                    {

                        mail.From = new MailAddress("digitalrepository.kau@gmail.com");
                        mail.To.Add(sessionmail);
                        mail.Subject = "تم رفض طلبك";

                        body.AppendLine("<h1> شكرا لرفع منتج في موقعنا ولكن يؤسفنا بانه تم رفض طلبك لرفع منتج بسبب...... وشكرا.</h1>");

                        mail.Body = body.ToString();
                        mail.IsBodyHtml = true;

                        using (var smtpClient = new SmtpClient("smtp.gmail.com", 587))
                        {
                            smtpClient.Credentials = new System.Net.NetworkCredential("digitalrepository.kau@gmail.com", "uhobogpxcxwelmkm");

                            smtpClient.EnableSsl = true;
                            smtpClient.Send(mail);
                            //Label1.Text = "send successfuly";

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //    Label1.Text = ex.Message;

            }

            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "DELETE FROM [Products_temp] WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    FillGrid();
                    lblSuccessMsg.Text = "تم رفض الطلب بنجاح";
                    lblErrorMsg.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "DELETE FROM [Products_temp] WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    FillGrid();
                    lblSuccessMsg.Text = "تم حذف المنتج بنجاح";
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