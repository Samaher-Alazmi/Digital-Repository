using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.html;
using iTextSharp.text.pdf.parser;
using System.Text;
using Org.BouncyCastle.Asn1.X509;
using System.Security.Policy;
using System.Web.Helpers;
//using DocumentFormat.OpenXml.Bibliography;

namespace DigitalRepository
{
    public partial class ReportsPage : System.Web.UI.Page
    {
        SqlConnection con;
        public string getConStr()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conStr;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Count the total price of all the products
                decimal price = 0;
                int count = 0;
                //foreach (GridViewRow item in GridView1.Rows)
                //{
                //    price = price + Convert.ToDecimal(item.Cells[1].Text);
                //    count++; 
                //}
                //Result.Text = price.ToString();
                //NumOfItems.Text = count.ToString();

                con = new SqlConnection(getConStr());
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from [Order]", con);
                SqlDataReader DR1 = cmd.ExecuteReader();

                if (DR1.HasRows)
                {
                    while (DR1.Read())
                    {
                        price += Convert.ToDecimal(DR1[5]);
                        count++;
                    }
                }

                Result.Text = price.ToString();
                NumOfItems.Text = count.ToString();
                con.Close();
            }
        }

        //private void BindGridViewData()
        //{
        //string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(CS))

        //string str = getConStr();
        //con = new SqlConnection(str);
        //con.Open();

        //{
        //SqlDataAdapter da = new SqlDataAdapter("SELECT P_name, Email, Order_date, P_price, Id FROM [Order]", con);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    GridView1.DataSource = ds;
        //    GridView1.DataBind();
        //}
        //}

        //protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    this.BindGrid();
        //}

        [Obsolete]
        protected void Button1_Click(object sender, EventArgs e)
        {
            //string fontpath = Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\arabtype.ttf";
            string fontpath = Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\tahoma.ttf";
            BaseFont basefont = BaseFont.CreateFont(fontpath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            //Font arabicFont = new Font(basefont, 10f, Font.NORMAL);
            Font tahomaFont = new Font(basefont, 10, Font.NORMAL, BaseColor.RED);


            //string fontpath = Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\times.ttf";
            //BaseFont basefont = BaseFont.CreateFont(fontpath, BaseFont.IDENTITY_H, true);
            //iTextSharp.text.Font arabicFont = new iTextSharp.text.Font(basefont, 24, iTextSharp.text.Font.NORMAL, iTextSharp.text.Color.BLUE);
            //var el = new Chunk();
            //iTextSharp.text.Font f2 = new iTextSharp.text.Font(basefont, el.Font.Size,
            //el.Font.Style, el.Font.Color);
            //el.Font = f2;

            GridView1.AllowPaging = false;

            int columnsCount = GridView1.HeaderRow.Cells.Count;
            // Create the PDF Table specifying the number of columns
            PdfPTable pdfTable = new PdfPTable(columnsCount);

            BaseColor bg = WebColors.GetRGBColor("#1A645C");
            BaseColor fontColor = WebColors.GetRGBColor("#1A645C");
            BaseColor headerColor = WebColors.GetRGBColor("#FFFFFF");

            // Create the Font Object for PDF document
            Font font = new Font();
            // Set the font color to GridView header row font color
            font.Color = fontColor;

            Font arabicFont = tahomaFont;
            arabicFont.Color = fontColor;

            Font headerFont = tahomaFont;
            headerFont.Color = headerColor;

            PdfPCell header = new PdfPCell(new Phrase("تقرير المبيعات  ", headerFont));
            header.HorizontalAlignment = Element.ALIGN_CENTER;
            header.VerticalAlignment = Element.ALIGN_MIDDLE;
            header.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor);
            header.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            header.Border = Rectangle.NO_BORDER;
            header.Border = Rectangle.BOTTOM_BORDER;
            header.Colspan = 5;
            header.MinimumHeight = 50;
            pdfTable.AddCell(header);


            string totalstr = "إجمالي الأرباح: " + Result.Text;
            PdfPCell total = new PdfPCell(new Phrase(totalstr, arabicFont));
            total.HorizontalAlignment = Element.ALIGN_CENTER;
            total.VerticalAlignment = Element.ALIGN_MIDDLE;
            total.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor); ;
            total.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            total.Border = Rectangle.NO_BORDER;
            total.Colspan = 3;
            total.MinimumHeight = 40;
            pdfTable.AddCell(total);

            string numstr = "مجموع عدد المنتجات: " + NumOfItems.Text;
            PdfPCell num = new PdfPCell(new Phrase(numstr, arabicFont));
            num.HorizontalAlignment = Element.ALIGN_CENTER;
            num.VerticalAlignment = Element.ALIGN_MIDDLE;
            num.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor); ;
            num.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            num.Border = Rectangle.NO_BORDER;
            num.Colspan = 2;
            num.MinimumHeight = 40;
            pdfTable.AddCell(num);


            PdfPCell Date = new PdfPCell(new Phrase(" تاريخ الطلب", headerFont));
            Date.HorizontalAlignment = Element.ALIGN_CENTER;
            Date.VerticalAlignment = Element.ALIGN_MIDDLE;
            Date.BackgroundColor = bg;
            Date.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            Date.MinimumHeight = 25;
            pdfTable.AddCell(Date);


            PdfPCell Price = new PdfPCell(new Phrase("السعر ", headerFont));
            Price.HorizontalAlignment = Element.ALIGN_CENTER;
            Price.VerticalAlignment = Element.ALIGN_MIDDLE;
            Price.BackgroundColor = bg;
            Price.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            Price.MinimumHeight = 25;
            pdfTable.AddCell(Price);

            PdfPCell ProductName = new PdfPCell(new Phrase("اسم المنتج", headerFont));
            ProductName.HorizontalAlignment = Element.ALIGN_CENTER;
            ProductName.VerticalAlignment = Element.ALIGN_MIDDLE;
            ProductName.BackgroundColor = bg;
            ProductName.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            ProductName.MinimumHeight = 25;
            pdfTable.AddCell(ProductName);

            PdfPCell Email = new PdfPCell(new Phrase("البريد الالكتروني ", headerFont));
            Email.HorizontalAlignment = Element.ALIGN_CENTER;
            Email.VerticalAlignment = Element.ALIGN_MIDDLE;
            Email.BackgroundColor = bg;
            Email.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            Email.MinimumHeight = 25;
            pdfTable.AddCell(Email);

            PdfPCell Order = new PdfPCell(new Phrase("الرقم التسلسلي", headerFont));
            Order.HorizontalAlignment = Element.ALIGN_CENTER;
            Order.VerticalAlignment = Element.ALIGN_MIDDLE;
            Order.BackgroundColor = bg;
            Order.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
            Order.MinimumHeight = 25;
            pdfTable.AddCell(Order);

            //// Loop thru each cell in GrdiView header row
            //foreach (TableCell gridViewHeaderCell in GridView1.HeaderRow.Cells)
            //{
            //    headerFont.Color = new BaseColor(GridView1.HeaderStyle.ForeColor);

            //    // Create the PDF cell, specifying the text and font
            //    PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text, headerFont));

            //    pdfCell.RunDirection = PdfWriter.RUN_DIRECTION_RTL;

            //    // Set the PDF cell backgroundcolor to GridView header row BackgroundColor color
            //    pdfCell.BackgroundColor = new BaseColor(GridView1.HeaderStyle.BackColor);

            //    pdfCell.MinimumHeight = 20;

            //    pdfCell.HorizontalAlignment = Element.ALIGN_CENTER;

            //    pdfCell.VerticalAlignment = Element.ALIGN_MIDDLE;

            //    pdfTable.AddCell(pdfCell);
            //}

            // Loop through each datarow in GrdiView
            foreach (GridViewRow gridViewRow in GridView1.Rows)
            {
                if (gridViewRow.RowType == DataControlRowType.DataRow)
                {
                    
                    // Loop through each cell in GrdiView data row
                    foreach (TableCell gridViewCell in gridViewRow.Cells)
                    {
                        arabicFont.Color = new BaseColor(GridView1.RowStyle.ForeColor);

                        PdfPCell cell = new PdfPCell(new Phrase(gridViewCell.Text, arabicFont));

                        cell.RunDirection = PdfWriter.RUN_DIRECTION_RTL;

                        cell.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor);

                        cell.HorizontalAlignment = Element.ALIGN_CENTER;

                        cell.VerticalAlignment = Element.ALIGN_MIDDLE;

                        pdfTable.AddCell(cell);
                           
                    }
                }
                
            }

            GridView1.AllowPaging = true;

            // Create the PDF document specifying page size and margins

            Document pdfDocument = new Document(PageSize.A4, 10f, 10f, 10f, 10f);

            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            pdfDocument.Open();
            pdfDocument.Add(pdfTable);
            pdfDocument.Close();

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition",
                "attachment;filename=تقرير المبيعات.pdf");
            Response.Write(pdfDocument);
            Response.HeaderEncoding = Encoding.UTF8;
            Response.Flush();
            Response.End();


        }

    }
}