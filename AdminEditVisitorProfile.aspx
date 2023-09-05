<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminEditVisitorProfile.aspx.cs" Inherits="DigitalRepository.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/StyleForEdit.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="section">


            <div class="content" style="width: 1003px">

                <label style="color: #000000; font-weight:bolder;"> تعديل معلومات زائر </label><br />


                <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <label style="color: #000000; font-weight: normal;">: الاسم الأول</label><br />

                <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight: normal;">: الاسم الأخير</label><br />


                <input type="text" class="content" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight: normal;">: تاريخ الميلاد</label><br />

                <label style="color: #000000; font-weight: normal;">: الجنس</label>

                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="auto-style1" TextAlign="Left">
                    <asp:ListItem>ذكر</asp:ListItem>
                    <asp:ListItem>انثى</asp:ListItem>


                </asp:RadioButtonList>

                <br />


                <input type="text" class="input" required style=" margin-left: 0px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight: normal;">: رقم الجوال</label><br />

                <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight: normal;">: االبريد الالكتروني</label><br />

                <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight: normal;">: العنوان</label><br />

                <br />
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>زائر</asp:ListItem>
                    <asp:ListItem>صاحب عمل حر</asp:ListItem>
                    <asp:ListItem>مسؤول موارد</asp:ListItem>
                    <asp:ListItem>مسؤول نظام</asp:ListItem>
                </asp:DropDownList>
                <label style="color: #000000; font-weight: normal;">: تعديل صلاحية المستخدم</label><br />

                <br />
                <asp:Button ID="Button3" Class="btn2" runat="server" Text="إلغاء" Style="margin-left: 0px" Width="148px" />
                <asp:Button ID="Button4" Class="btn1" runat="server" Text="تعديل المستخدم" Style="margin-left: 0px" Width="148px" OnClientClick="openPopup()" />

            </div>
        </div>

    <div class="Popup" id="PopupSignUp">
        <div class="bg">
            <img src="Images/tick.jpeg" />
            <h2>تم التعديل بنجاح</h2>
            <!--اذا بضيف برجراف-->
            <!--- <p></p>-->
            <button type="button" class="button11" onclick="closePopup()">تم</button>
        </div>
    </div>

    <script>
        let Popup = document.getElementById("PopupSignUp");
        function openPopup() {
            Popup.classList.add("open-Popup");

        }
        function closePopup() {
            Popup.classList.remove("open-Popup");

        }
    </script>

</asp:Content>
