<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="DigitalRepository.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Login page for all users -->

    <link href="css/LoginStyle.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-wrapper">
        <div class="form-structor">
            <div class="login">
                <h2 class="form-title" id="login">تسجيل الدخول</h2>
                    <div class="form-holder" dir="rtl">
                        <input type="text" runat="server" id="email" class="input" placeholder="الايميل" required="required" />
                        <input type="password" runat="server" id="password" class="input" placeholder="كلمة المرور" required="required" />
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="تسجيل دخول" class="submit-btn" OnClick="login_Click" />
                <label class="signup-link">ليس لديك حساب؟ <a style="color: #3354d5;" href="SignupFormVisitor.aspx">سجل هنا</a></label> <br />
                <label class="signup-link">هل ترغب بالانضمام كصاحب عمل حر؟ <a style="color: #3354d5;" href="SignupFormFreelancer.aspx">سجل هنا</a></label>
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
