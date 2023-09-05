﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignupFormFreelancer.aspx.cs" Inherits="DigitalRepository.SignupForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Sign up page for the Freelancer (can view, buy, and upload products) -->

    <link href="css/SignupFormStyle.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-wrapper">
        <div class="form-structor">
            <div class="signup">
                <h2 class="form-title" id="signup">تسجيل جديد</h2>
                <div class="form-holder" dir="rtl">
                    <input type="text" id="name" runat="server" class="input" placeholder="الاسم الأول" required />
                    <input type="text" id="name2" runat="server" class="input" placeholder="الاسم الأخير" required />
                    <input type="tel" id="phone" runat="server" class="input" placeholder="رقم الجوال" required />
                    <asp:Label runat="server" ID="ValidPhone" ForeColor="Red" Style="font-size: 14px;" BackColor="#FFFFFF" Height="5%" Width="100%"></asp:Label>
                    <input type="email" id="email" runat="server" class="input" placeholder="الايميل" required />
                    <asp:Label runat="server" ID="EmailExist" ForeColor="Red" Style="font-size: 14px;" BackColor="#FFFFFF" Height="5%" Width="100%"></asp:Label>
                    <input type="password" id="password" runat="server" class="input" placeholder="كلمةالمرور" required />
                    <input type="date" id="date" runat="server" class="input" placeholder="mm/dd/yyyy" required />
                    <input type="text" id="address" runat="server" class="input" placeholder="العنوان" required />
                </div>

                <%--<label style="font-size: 16px;" for="FL">ارغب بالانضمام كصاحب عمل حر</label>
                    <input type="checkbox" id="myCheck" name="FL" onclick="myFunction()">--%>
                <textarea dir="rtl" runat="server" id="Brief" name="Brief" placeholder="شاركنا نبذة عنك..." rows="4" cols="44" style="font-size: 16px; outline: none;" required></textarea>
                <%--<p id="CV" style="display: none" dir="rtl">--%>

                <%--<label style="color: #000000; font-size:16px; font-weight: bold;">ارفع سيرتك الذاتية</label>--%>
                <%--<label for="upload-cv" class="fileUpload-btn">ارفع سيرتك الذاتية </label>
                <input id="upload-cv" type="file" required>--%>
                <%--</p>--%>

                <label style="font-size: 16px;" dir="rtl" for="PA">أقر بعدم انتهاك حقوق الملكية&nbsp;<a dir="rtl" href="PrivacyPolicy.aspx" style="color: #3354d5; text-decoration: underline;">أنقر للعرض </a></label>
                <input type="checkbox" name="PA" required>

                <asp:Button ID="Button1" runat="server" class="submit-btn" Text="تسجيل" OnClick="signup_Click" />
                <%--<button  runat="server" class="submit-btn" onclick="signup_Click">تسجيل</button>--%>
            </div>
        </div>
    </div>

    <div class="Popup" id="PopupSignUp">
        <div class="bg">
            <img src="Images/tick.jpeg" />
            <h2>تم تسجيل بنجاح</h2>
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
