using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net.Mail;
using System.Text;

namespace DigitalRepository
{
    public partial class AdminUserManagement : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM [User]", con);
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

        protected void UsersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection con = new SqlConnection(getConStr()))
                    {
                        con.Open();
                        string query = "INSERT INTO [User] (FirstName, LastName, Password, Email, Role, PhoneNum, BirthDate, Address) VALUES (@FirstName, @LastName, @Password, @Email, @Role, @PhoneNum, @BirthDate, @Address)";
                        SqlCommand sqlCmd = new SqlCommand(query, con);
                        sqlCmd.Parameters.AddWithValue("@FirstName", (UsersGridView.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@LastName", (UsersGridView.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Password", (UsersGridView.FooterRow.FindControl("txtPasswordFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Email", (UsersGridView.FooterRow.FindControl("txtEmailFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Role", (UsersGridView.FooterRow.FindControl("txtRoleFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@PhoneNum", (UsersGridView.FooterRow.FindControl("txtPhoneNumFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@BirthDate", (UsersGridView.FooterRow.FindControl("txtBirthDateFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Address", (UsersGridView.FooterRow.FindControl("txtAddressFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        FillGrid();
                        lblSuccessMsg.Text = "تم اضافة المستخدم بنجاح";
                        lblErrorMsg.Text = "";

                    }

                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(getConStr()))
                {
                    con.Open();
                    string query = "UPDATE [User] SET FirstName=@FirstName, LastName=@LastName, Password=@Password, Email=@Email, Role=@Role, PhoneNum=@PhoneNum, BirthDate=@BirthDate, Address=@Address WHERE Id=@Id";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (UsersGridView.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (UsersGridView.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", (UsersGridView.Rows[e.RowIndex].FindControl("txtPassword") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (UsersGridView.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Role", (UsersGridView.Rows[e.RowIndex].FindControl("txtRole") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@PhoneNum", (UsersGridView.Rows[e.RowIndex].FindControl("txtPhoneNum") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@BirthDate", (UsersGridView.Rows[e.RowIndex].FindControl("txtBirthDate") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Address", (UsersGridView.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    UsersGridView.EditIndex = -1;
                    FillGrid();
                    lblSuccessMsg.Text = "تم تعديل المستخدم بنجاح";
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
            UsersGridView.EditIndex = -1;
            FillGrid();
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            con = new SqlConnection(getConStr());
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from[User] where Id=@Id", con);
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
                        mail.Subject = "تم حذف حسابك";

                        body.AppendLine("<h1> يؤسفنا بانه تم حذف حسابك من قبل مسؤول النظام بسبب......<br> نعتذر منك. </h1>");

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
                    string query = "DELETE FROM [User] WHERE Id=@Id";
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