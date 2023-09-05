<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminAddUser.aspx.cs" Inherits="DigitalRepository.AdminAddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/AddUser.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx">لوحة التحكم </a>
        <label class="textB">&lt</label>
        <a class="textB">ادارة المستخدمين</a>
        <label class="textB">&lt</label>
        <a class="textC">إضافة مستخدم جديد</a>
        <i class="fa-solid fa-pen-to-square icon"></i>
    </div>

    <div class="div-label">
        <label>إضافة مستخدم جديد</label>
    </div>

    <div class="div-table">
        <table class="table-style" dir="rtl">
            <tr class="table-row ">
                <td class="table-data">الاسم الأول:</td>
                <td><asp:TextBox ID="fname" runat="server" class="input-box"></asp:TextBox></td>
            </tr>

            <tr class="table-row ">
                <td class="table-data">الاسم الأخير:</td>
                <td><asp:TextBox ID="lname" runat="server" class="input-box"></asp:TextBox></td>
            </tr>

            <tr class="table-row ">
                <td class="table-data"> تاريخ الميلاد:</td>
                <td><input type="date" id="date" runat="server" class="input-box" placeholder="mm/dd/yyyy"/></td>
                <%--<td><asp:TextBox ID="TextBox3" runat="server" class="input-box"></asp:TextBox></td>--%>
            </tr>

            <tr class="table-row ">
                <td class="table-data">رقم الجوال:</td>
                <td><asp:TextBox ID="phone" runat="server" class="input-box"></asp:TextBox></td>
            </tr>

            <tr class="table-row ">
                <td class="table-data">البريد الإلكتروني:</td>
                <td><asp:TextBox ID="email" runat="server" class="input-box"></asp:TextBox></td>
            </tr>

            <tr class="table-row ">
                <td class="table-data">الرقم السري:</td>
                <td><asp:TextBox ID="password" runat="server" class="input-box"></asp:TextBox></td>
            </tr>

            <tr class="table-row ">
                <td class="table-data">العنوان:</td>
                <td><asp:TextBox ID="address" runat="server" class="input-box"></asp:TextBox></td>
            </tr>

            <tr class="table-row ">
                <td class="table-data">صلاحية المستخدم:</td>
                <td><asp:DropDownList ID="rolelist" runat="server">
                        <asp:ListItem Value="visitor">زائر</asp:ListItem>
                        <asp:ListItem Value="freelancer">صاحب عمل حر</asp:ListItem>
                        <asp:ListItem Value="manager">مسؤول موارد</asp:ListItem>
                        <asp:ListItem Value="admin">مسؤول نظام</asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>

            <tr class="table-row ">
                <td class="table-data"><asp:Button ID="Button1" runat="server" CssClass="btn1" Text="إضافة" OnClick="add_Click" /></td>
                <td><asp:Button ID="Button2" runat="server" CssClass="btn2" Text="إلغاء" /></td>
            </tr>

        </table>
    </div>


</asp:Content>
