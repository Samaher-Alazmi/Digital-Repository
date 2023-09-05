using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace DigitalRepository
{
    public partial class SignupForm : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("error");
                Session["id"] = email.Value;
                ValidPhone.Visible = false;
                EmailExist.Visible = false;
            }
        }

        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            string uname = name.Value;
            string uname2 = name2.Value;
            string uphone = phone.Value;
            string uemail = email.Value.ToLower();
            string upass = password.Value;
            string udate = date.Value;
            string uaddress = address.Value;
            string brief = Brief.Value;

            Session["id"] = uemail;

            con = new SqlConnection(getConStr());
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from [TempUser] where Email='" + uemail + "'", con);

            SqlDataReader reader;
            reader = cmd.ExecuteReader();

            if (IsDigitsOnly(uphone) == false || uphone.StartsWith("05") == false || uphone.Length != 10)
            {
                ValidPhone.Visible = true;
                Response.Write(ValidPhone.Text = "* الرجاء ادخال الرقم بشكل صحيح");

            }
            else if (reader.Read())
            {
                string email = reader.GetString(4).ToLower();

                if (email == uemail)
                {
                    ValidPhone.Visible = false;
                    EmailExist.Visible = true;
                    Response.Write(EmailExist.Text = "* الإيميل مستخدم مسبقا!");
                    Session["id"] = email;
                    reader.Close();
                }

            }
            else
            {

                reader.Close();

                string sessionmail = uemail;

                StringBuilder body = new StringBuilder();

                try
                {
                    using (MailMessage mail = new MailMessage())
                    {

                        mail.From = new MailAddress("digitalrepository.kau@gmail.com");
                        mail.To.Add(sessionmail);
                        mail.Subject = "شكرا لتسجيلك معنا!";
                        body.AppendLine("<h1> تم رفع طلبك للعمل كصاحب عمل حر في موقعنا بنجاح <br> يرجى انتظار قبول طلبك من فريق العمل <br> شكرًا.</h1>");
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
                catch (Exception ex)
                {
                    //    Label1.Text = ex.Message;

                }

                cmd = new SqlCommand("insert into [TempUser] (FirstName,LastName,Password,Email,Role,PhoneNum,BirthDate,Address,Brief) values (@FirstName,@LastName,@Password,@Email,@Role,@PhoneNum,@BirthDate,@Address,@Brief)", con);

                cmd.Parameters.AddWithValue("@FirstName", uname);
                cmd.Parameters.AddWithValue("@LastName", uname2);
                cmd.Parameters.AddWithValue("@Password", upass);
                cmd.Parameters.AddWithValue("@Email", uemail);
                cmd.Parameters.AddWithValue("@Role", 3);
                cmd.Parameters.AddWithValue("@PhoneNum", uphone);
                cmd.Parameters.AddWithValue("@BirthDate", udate);
                cmd.Parameters.AddWithValue("@Address", uaddress);
                cmd.Parameters.AddWithValue("@Brief", brief);
                cmd.ExecuteNonQuery();

                Response.Redirect("Index.aspx");
                Session["id"] = uemail;

                con.Close();
            }

        }

        private bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }
            return true;
        }

    }
}