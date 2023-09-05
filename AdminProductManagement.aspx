<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminProductManagement.aspx.cs" Inherits="DigitalRepository.AdminProductManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Products.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx"> لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textC">ادارة المنتجات</a>
        <i class="fa-solid fa-pen-to-square icon" ></i>
    </div>

    <table border="0" width="700" height="130" style="margin-left:auto; margin-right:auto;">
        <tr>
            <td align="center"><asp:Button ID="Button1" runat="server" class="buttons" onclick="ProductManagement" Text="تعديل المنتجات" /></td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="Button2" runat="server" class="buttons" onclick="OrderManagement" Text="اعتماد رفع طلب منتج جديد" /></td>
        </tr>
    </table>

</asp:Content>
