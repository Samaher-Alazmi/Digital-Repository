<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="EmptyCart.aspx.cs" Inherits="DigitalRepository.EmptyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Cart.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&lt</label>
        <a class="textC">السلة</a>
        <i class="fa fa-home icon"></i>
    </div>

    <div>
        <div><img class="ECart" src="Images/empty_cart.png"/></div>
        <div class="text">السلة فارغة</div>
        <%--<div class="position"><button class="Btn backB">العودة للمتجر</button></div>--%>
        <div class="position"><asp:Button ID="Button1" runat="server" class="Btn backB" Text="العودة للمتجر" onclick="back_click"/></div>
    </div>

</asp:Content>
