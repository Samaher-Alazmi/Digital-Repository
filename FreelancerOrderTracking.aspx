<%@ Page Title="" Language="C#" MasterPageFile="~/FreelancerMaster.Master" AutoEventWireup="true" CodeBehind="FreelancerOrderTracking.aspx.cs" Inherits="DigitalRepository.FreelancerOrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Page for freelancer to track the products that a freelancer has ordered -->

    <link href="css/Amal.css" rel="stylesheet" />
    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&lt</label>
        <a class="textB" href="FreelancerProfile.aspx">الملف الشخصي</a>
        <label class="textB">&lt</label>
        <a class="textC">تتبع الطلبات</a>
        <i class="fa fa-home icon"></i>
    </div>

    <div class="page-wrapper">
        <div class="navstructor" dir="rtl">
            <a class="linkbtn" href="FreelancerProfile.aspx" target="_self">الملف الشخصي</a>
            <a class="linkbtn" href="FreelancerProducts.aspx" target="_self">منتجاتي</a>
            <a class="linkbtn" href="FreelancerUploadProductDetails.aspx" target="_self">رفع منتج جديد</a>
            <a class="linkbtn" href="FreelancerOrderTracking.aspx" target="_self">تتبع الطلبات</a>
        </div>

        <div class="position">
            <div class="profile-container" dir="rtl" style="padding-bottom:100px; padding-top:80px;">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" BackColor="White" DataKeyNames="Id" ForeColor="Black" HorizontalAlign="Center" ShowHeaderWhenEmpty="True">
                    <AlternatingRowStyle BackColor="#C0EFD9" HorizontalAlign="Center" VerticalAlign="Middle" />
                    
                    <Columns>
                        <asp:BoundField DataField="P_name" HeaderText="الطلب" SortExpression="P_name" />
                        <asp:BoundField DataField="Id" HeaderText="رقم الطلب" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Order_Status" HeaderText="حالة الطلب" SortExpression="Order_Status" />
                    </Columns>

                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#1A645C" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [Id], [P_name], [Order_Status] FROM [Order] WHERE ([Email] = @Email)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Email" SessionField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

</asp:Content>
