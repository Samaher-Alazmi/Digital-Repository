using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace DigitalRepository
{
    public partial class Invoice : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();

        
        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(getConStr());
            con.Open();

            //cmd.CommandText = "select Email from [Order] where Email= @email";
            //cmd.Connection = con;
            //cmd.Parameters.AddWithValue("@email", Session["Id"].ToString());


            cmd.CommandText = "select * from [TempOrder] where (Email= @email1) order by Id desc";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@email1", Session["Id"].ToString());

            SqlDataReader DR1;
            SqlDataReader DR2;

            float price;

            DR1 = cmd.ExecuteReader();

            if (DR1.Read())
            {
                price = float.Parse(DR1["Total"].ToString());

                total.Text = price.ToString() + " : المجموع النهائي";

                InvoiceNum.Text = DR1["Id"].ToString();
                Date.Text = DR1["Order_Date"].ToString();
            }
            DR1.Close();

            string sessionmail;
            if (Session["id"].ToString() == null)
            {
                Response.Redirect("~/Login.aspx");

            }
            else
            {
                DR2 = cmd.ExecuteReader();

                sessionmail = Session["id"].ToString();

                StringBuilder body = new StringBuilder();

                try
                {
                    using (MailMessage mail = new MailMessage())
                    {

                        mail.From = new MailAddress("digitalrepository.kau@gmail.com");
                        mail.To.Add(sessionmail);
                        mail.Subject = "شكرا لشرائك من متجرنا!";
                        body.AppendLine("<h1>[المستودع الرقمي]</h1>");
                        body.AppendLine("<h3>عزيزي العميل تستطيع الان تحميل منتجاتك</h3>");
                        body.AppendLine("<h3>روابط المنتجات</h3>");

                        while (DR2.Read())
                        {
                            body.AppendLine("<h3>" + DR2[7] +"</h3>");
                        }

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
            }

        }

        protected void Delete_order(object sender, EventArgs e)
        {

            con = new SqlConnection(getConStr());
            con.Open();
            cmd.CommandText = "Delete from [TempOrder] where Email= @email2 ";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@email2", Session["id"].ToString());
            cmd.ExecuteNonQuery();


            //string sessionmail;
            //if (Session["id"].ToString() == null)
            //{
            //    Response.Redirect("~/Login.aspx");

            //}
            //else
            //{
            //    sessionmail = Session["id"].ToString();

            //    try
            //    {
            //        using (MailMessage mail = new MailMessage())
            //        {

            //            mail.From = new MailAddress("shahad.obaidi1@gmail.com");
            //            mail.To.Add(sessionmail);
            //            mail.Subject = "تجربة ارسال ايميل";
            //            mail.Body = "<h1>المجموعة الثالثة</h1>";
            //            mail.IsBodyHtml = true;

            //            using (var smtpClient = new SmtpClient("smtp.gmail.com", 587))
            //            {
            //                smtpClient.Credentials = new System.Net.NetworkCredential("digitalrepository.kau@gmail.com", "uhobogpxcxwelmkm");

            //                smtpClient.EnableSsl = true;
            //                smtpClient.Send(mail);
            //                //Label1.Text = "send successfuly";
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        //    Label1.Text = ex.Message;

            //    }
            //}

            Response.Redirect("Index.aspx");


        }
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
    }
}