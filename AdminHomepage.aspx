<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHomepage.aspx.cs" Inherits="DigitalRepository.AdminHomepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Products.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <div class="welcome" dir="rtl">
        <TextBox id="welc" runat="server"></TextBox>
    </div>

    <table border="0" width="700" height="300" style="margin-left:auto; margin-right:auto;">
        <tr>
            <td align="center"><asp:Button ID="Button1" runat="server" class="buttons" onclick="UserManagement" Text="ادارة المستخدمين" /></td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="Button2" runat="server" class="buttons" onclick="FreelancerManagement" Text="ادارة أصحاب العمل الحر" /></td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="Button3" runat="server" class="buttons" onclick="ProductManagement" Text="ادارة المنتجات" /></td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="Button4" runat="server" class="buttons" onclick="OrderManagement" Text="ادارة الطلبات الواردة من الزوار" /></td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="Button5" runat="server" class="buttons" onclick="ReportsPage" Text="طباعة التقارير" /></td>
        </tr>
    </table>

</asp:Content>
