<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminReportsPage.aspx.cs" Inherits="DigitalRepository.ReportsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/tableOt.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/btn_edit.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx">لوحة التحكم </a>
        <label class="textB">&lt</label>
        <a class="textC">طباعة التقارير</a>
        <i class="fa-solid fa-pen-to-square icon"></i>
    </div>

    <div>
        <p style="color: white; text-align: center; font-size: 30px; background-color: #1A645C;">استخراج تقارير المبيعات</p>
        <br>

        <table width="100%" id="pnlGridView" runat="server" align="center" style="border: none;">
            

            <tr>
                <td colspan="2">

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" Height="5px" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" ShowHeader="true">
                        <Columns>
                            <asp:BoundField DataField="Order_date" HeaderText="تاريخ الطلب" SortExpression="Order_date" />
                            <asp:BoundField DataField="P_price" HeaderText="السعر" SortExpression="P_price" />
                            <asp:BoundField DataField="P_name" HeaderText="اسم المنتج" SortExpression="P_name" />
                            <asp:BoundField DataField="Email" HeaderText="المستخدم" SortExpression="Email" />
                            <asp:BoundField DataField="Id" HeaderText="الرقم التسلسلي" ReadOnly="True" SortExpression="Id" />
                        </Columns>
                        <EditRowStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#1A645C" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [P_name], [Email], [Order_date], [P_price], [Id] FROM [Order]"></asp:SqlDataSource>


                </td>
            </tr>

            <tr style="height: 50px;">

            </tr>

            <tr dir="rtl" style="border: 1px silver solid; height: 50px; display: inline-table;">
                <td style="display: flex; justify-content: flex-end; margin-top: 9px;">
                    <asp:Label ID="Label2" runat="server" Text="مجموع عدد المنتجات: " ForeColor="#000066" ></asp:Label>
                </td>
                <td style="padding-right: 1%;">
                    <asp:Label ID="NumOfItems" runat="server"  ForeColor="#000066" ></asp:Label>
                </td>
                <td style="display: flex; justify-content: flex-end; margin-top: 9px; width: max-content;">
                    <asp:Label ID="Label1" runat="server" Text="إجمالي الأرباح: " ForeColor="#000066" ></asp:Label>
                </td>
                <td style="padding-right: 1%;">
                    <asp:Label ID="Result" runat="server"  ForeColor="#000066" ></asp:Label>
                </td>
            </tr>

            <%--<tr dir="rtl" style="border: 1px silver solid; height: 50px;">
                <td style="align-content: center; display: inline-flex; padding-top: 10px; justify-content: center; padding-right: 5%;">
                    <div><asp:Label ID="Label2" runat="server" Text="مجموع عدد المنتجات: " ForeColor="#000066" ></asp:Label></div>
                    <div style="margin-right: 2%"><asp:Label ID="NumOfItems" runat="server"  ForeColor="#000066" ></asp:Label></div>
                </td>
                <td style="align-content: center; display: inline-flex; padding-top: 10px; justify-content: center; padding-right: 5%;">
                    <div><asp:Label ID="Label1" runat="server" Text="مجموع سعر المنتجات: " ForeColor="#000066" ></asp:Label></div>
                    <div style="margin-right: 2%"><asp:Label ID="Result" runat="server"  ForeColor="#000066" ></asp:Label></div>
                </td>
            </tr>--%>
            

            <tr style="height: 150px;">
                <td align="center">
                    <asp:Button ID="Button1" class="btn-pdf" dir="rtl" runat="server" Text="تصدير إلى ملف PDF" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
