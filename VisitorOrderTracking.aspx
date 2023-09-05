<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="VisitorOrderTracking.aspx.cs" Inherits="DigitalRepository.UserOrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Amal.css" rel="stylesheet" />
    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&lt</label>
        <a class="textB" href="VisitorProfile.aspx">الملف الشخصي</a>
        <label class="textB">&lt</label>
        <a class="textC">تتبع الطلبات</a>
        <i class="fa fa-home icon"></i>
    </div>

    <div class="page-wrapper">
        <div class="navstructor" dir="rtl">
            <a class="linkbtn" href="VisitorProfile.aspx" target="_self">الملف الشخصي</a>
            <a class="linkbtn" href="VisitorOrderTracking.aspx" target="_self">تتبع الطلبات</a>
        </div>

        <div class="position">
            <div class="profile-container" dir="rtl" style="padding-bottom:100px; padding-top:80px;">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" HeaderStyle-BackColor="#1A645C" ForeColor="Black" AlternatingRowStyle-BackColor="#C0EFD9" HeaderStyle-ForeColor="White" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle" BackColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderColor="Silver" ShowHeaderWhenEmpty="True">
                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#C0EFD9"></AlternatingRowStyle>
                    
                    <Columns>
                        <asp:BoundField DataField="P_name" HeaderText="الطلب" SortExpression="P_name">
                            <HeaderStyle ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Id" HeaderText="رقم الطلب" InsertVisible="False" ReadOnly="True" SortExpression="Id">
                            <HeaderStyle ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Order_Status" HeaderText="حالة الطلب" SortExpression="Order_Status">
                            <HeaderStyle ForeColor="White" />
                        </asp:BoundField>
                    </Columns>

                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#1A645C" ForeColor="White"></HeaderStyle>

                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                </asp:GridView>

            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [P_name], [Id], [Order_Status] FROM [Order] WHERE ([Email] = @Email)">
        <SelectParameters>
            <asp:SessionParameter Name="Email" SessionField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>