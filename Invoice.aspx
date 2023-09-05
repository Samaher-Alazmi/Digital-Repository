<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="DigitalRepository.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/InvoiceStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
       
        
     <div class="container2">

            <img src="Images/Logo.png" alt="Company logo" style="width: 50%; max-width: 200px; float:left;"align="left"; />
            <div class ="bill" style="float:right;" >

                الفاتورة

               

            </div>

            <div class ="bill2" >

                 رقم الفاتورة<br />
                <asp:Label ID="InvoiceNum"  runat="server" ></asp:Label> <br />
                التاريخ<br />
                <asp:Label ID="Date"  runat="server"  ></asp:Label>
       

            </div> 
            
           </div>

           <div class="cont3">
            <div class ="from" style="float:right;" >

                :الفاتورة من
               
              </div>
               <div class = "address"style="float:right;">
            
                المستودع الرقمي - KAU<br />
                جامعة الملك عبدالعزيز - عمادة القبول والتسجيل <br />
               جدة - ٢١٥٨٩<br />
               المملكة العربية السعودية                         
                             
            
            
               </div>
                  
           </div>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle" BackColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HorizontalAlign="Center" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="P_price" HeaderText="سعر المنتج" SortExpression="P_price" />
            <asp:BoundField DataField="P_name" HeaderText="اسم المنتج" SortExpression="P_name" />
        </Columns>

        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
    </asp:GridView>
    <div>
        <asp:Label ID="total" runat="server" ForeColor="#6F6E70" Style="text-align: center; "></asp:Label></div> <br /> 

        <asp:Label ID="Label1" runat="server" Text="سيتم ارسال منتجاتك إلى بريدك الإلكتروني. يرجى الضغط على تم."></asp:Label>
        
            <br />
    <asp:Button ID="submit" runat="server" class="billbtn" OnClick="Delete_order" Text="تم" style="margin-top: 6%;"/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [P_name], [P_price] FROM [TempOrder] WHERE ([Email] = @Email)">
        <SelectParameters>
            <asp:SessionParameter Name="Email" SessionField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>

    </form>
</body>
</html>
