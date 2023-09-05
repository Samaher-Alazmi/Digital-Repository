<%@ Page Title="" Language="C#" MasterPageFile="~/FreelancerMaster.Master" AutoEventWireup="true" CodeBehind="FreelancerProfile.aspx.cs" Inherits="DigitalRepository.FreelancerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />
    <link href="css/Amal.css" rel="stylesheet" />
    <link href="css/label.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&lt</label>
        <a class="textC">الملف الشخصي</a>
        <i class="fa fa-home icon"></i>
    </div>

    <div class="page-wrapper">
        <div class="navstructor" dir="rtl">
            <a class="linkbtn" href="FreelanceProfile.aspx" target="_self">الملف الشخصي</a>
            <a class="linkbtn" href="FreelancerProducts.aspx" target="_self">منتجاتي</a>
            <a class="linkbtn" href="FreelancerUploadProductDetails.aspx" target="_self">رفع منتج جديد</a>
            <a class="linkbtn" href="FreelancerOrderTracking.aspx" target="_self">تتبع الطلبات</a>
        </div>

        <div class="position">
                <div class="profile-container" dir="rtl">
                    <%--<div class="profile-holder">
                        <img style="height: 150px; width: 150px;" class="img" src="Images\profile.jpeg" id="img">
                        <br>
                        <input type="file" id="file">
                    </div>--%>
                    <div class="col-md-12" style="margin-right: 2%;">
                        <div class="form-group row">

                            <label for="Fname" class="col-md-2 control-label">الاسم الأول:</label>
                            <div class="col-md-4">
                                <input id="Fname" class="form-control" type="text" runat="server" />
                            </div>

                            <label for="Lname" class="col-md-2 control-label">الاسم الأخير:</label>
                            <div class="col-md-4">
                                <input id="Lname" class="form-control" type="text" runat="server" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Phone" class="col-md-2 control-label">رقم الجوال:</label>
                            <div class="col-md-4">
                                <input id="Phone" class="form-control" type="text" runat="server" />
                            </div>

                            <label for="Email" class="col-md-2 control-label">البريد الألكتروني:</label>
                            <div class="col-md-4">
                                <input id="Email" class="form-control" type="text" runat="server" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Birth" class="col-md-2 control-label">تاريخ الميلاد:</label>
                            <div class="col-md-4">
                                <input type="date" class="form-control" id="Birth" runat="server" placeholder="mm/dd/yyyy" style="color: #8c8c8c">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Address" class="col-md-2 control-label">العنوان:</label>
                            <div class="col-md-4">
                                <input id="Address" class="form-control" type="text" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="position3" style="margin-bottom: 10px">
                        <asp:Button ID="Button1" class="Btn saveBtn" runat="server" Text="حفظ" OnClick="profile_Click"/>
                        
                    </div>
                    <asp:Label ID="save" class="save-label" runat="server" Text="تم الحفظ بنجاح" style="margin-bottom: 40px"></asp:Label>
                </div>
            </div>
    </div>

    <div class="Popup" id="PopupSignUp">
        <div class="bg">
            <img src="Images/tick.jpeg" />
            <h2>تم التعديل بنجاح</h2>
            <!--اذا بضيف برجراف-->
            <!--- <p></p>-->
            <button type="button"  class="button11" onclick="closePopup()">تم</button>
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
