using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Drawing;
using Org.BouncyCastle.Asn1.X509;
using System.Security.Cryptography;
using System.Web.Helpers;

namespace DigitalRepository
{
    public partial class AdminFreelancerManagement : System.Web.UI.Page
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
            Response.Redirect("AdminAddUser.aspx");
        }
        void FillGrid()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(getConStr()))
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM [TempUser]", con);
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

        protected void UsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UsersGridView.EditIndex = e.NewEditIndex;
            FillGrid();
        }

        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from[TempUser] where Id=@Id", con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
            SqlDataReader DR2;



            DR2 = cmd.ExecuteReader();

            string sessionmail = "";

            if (DR2.Read())
            {
                sessionmail = DR2[4].ToString();
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

                        body.AppendLine("<h1>شكرًا لانتظارك, لقد تم قبول طلبك للعمل كصاحب عمل حر في موقعنا. <br> يمكنك الان الدخول على حسابك وبدء عملية البيع والشراء ! </h1>");

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
                using (con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "INSERT INTO [User] (FirstName, LastName, Password, Email, Role, PhoneNum, BirthDate, Address) VALUES (@FirstName, @LastName, @Password, @Email, @Role, @PhoneNum, @BirthDate, @Address)";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (UsersGridView.Rows[e.RowIndex].FindControl("txtFirstName") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (UsersGridView.Rows[e.RowIndex].FindControl("txtLastName") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", (UsersGridView.Rows[e.RowIndex].FindControl("txtPassword") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (UsersGridView.Rows[e.RowIndex].FindControl("txtEmail") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Role", (UsersGridView.Rows[e.RowIndex].FindControl("txtRole") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@PhoneNum", (UsersGridView.Rows[e.RowIndex].FindControl("txtPhoneNum") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@BirthDate", (UsersGridView.Rows[e.RowIndex].FindControl("txtBirthDate") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Address", (UsersGridView.Rows[e.RowIndex].FindControl("txtAddress") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    UsersGridView.EditIndex = -1;

                    FillGrid();
                    lblSuccessMsg.Text = "تم قبول المستخدم بنجاح";
                    lblErrorMsg.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
        
    

        protected void UsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            con = new SqlConnection(getConStr());
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from[TempUser] where Id=@Id", con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
            SqlDataReader DR2;


            DR2 = cmd.ExecuteReader();

            string sessionmail = "";

            if (DR2.Read())
            {
                sessionmail=DR2[4].ToString();
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

                        body.AppendLine("<h1> شكرّا لاهتمامك بالانضمام الى فريق عملنا ولكن يؤسفنا اعلامك بانه تم رفض طلبك بسبب عدم توافق الخبرات مع متطلبات الانضمام. </h1>");

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
                    string query = "DELETE FROM [TempUser] WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    FillGrid();
                    lblSuccessMsg.Text = "تم رفض المستخدم بنجاح";
                    lblErrorMsg.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
            //UsersGridView.EditIndex = -1;
            //FillGrid();
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "DELETE FROM [TempUser] WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    FillGrid();
                    lblSuccessMsg.Text = "تم حذف المستخدم بنجاح";
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
