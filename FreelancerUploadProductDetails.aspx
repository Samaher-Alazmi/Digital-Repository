<%@ Page Title="" Language="C#" MasterPageFile="~/FreelancerMaster.Master" AutoEventWireup="true" CodeBehind="FreelancerUploadProductDetails.aspx.cs" Inherits="DigitalRepository.FreelancerUploadProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Page for freelancer to upload their product -->

    <link href="css/Products.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />
    <link href="css/Amal.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="FreelanceProfile.aspx"> الملف الشخصي </a>
        <label class ="textB">&lt</label>
        <a class="textC" href="FreelancerUploadProductDetails.aspx">رفع منتج جديد</a>
        <i class="fa-solid fa-arrow-up-from-bracket icon" ></i>
    </div>

    <div>
      <p style="text-align:center; font-size:50px; color:darkslategrey; margin-left: 6%;">تفاصيل المنتج</p>
    </div>    

    <div class="navstructor" dir="rtl" style="margin-bottom:10px;">
        <a class="linkbtn" href="FreelancerProfile.aspx" target="_self">الملف الشخصي</a>
        <a class="linkbtn" href="FreelancerProducts.aspx" target="_self">منتجاتي</a>
        <a class="linkbtn" href="FreelancerUploadProductDetails.aspx" target="_self">رفع منتج جديد</a>
        <a class="linkbtn" href="FreelancerOrderTracking.aspx" target="_self">تتبع الطلبات</a>
    </div>

    <div class="profile-container" style="height: 700px;padding: 0px;padding-top: 1%; margin-top: -1%;">
        <div style="margin-left:50%; height:fit-content;">
            
            <p style="color:darkslategray; margin-right:15%; margin-top: 1%; direction:rtl; font-weight: bold; font-size:30px;">اسم المنتج:</p>
            <asp:TextBox style="margin-right:20%;" ID="namep" runat="server"> </asp:TextBox>
            
            <p style="color:darkslategray; margin-right:15%; margin-top: 1%; direction:rtl; font-weight: bold; font-size:30px;"">السعر:</p>
            <asp:TextBox style="margin-right:20%;" ID="price" runat="server"> </asp:TextBox>
            
            <p style="color:darkslategray; margin-right:15%; margin-top: 1%; direction:rtl; font-weight: bold; font-size:30px;">الوصف:</p>
            <asp:TextBox style="margin-right:20%;" ID="desc" runat="server" TextMode="MultiLine" ></asp:TextBox> 

            <p style="color:darkslategray; margin-right:15%; margin-top: 1%; direction:rtl; font-weight: bold; font-size:30px;">المؤلف:</p>
            <asp:TextBox style="margin-right:20%;" ID="author" runat="server"> </asp:TextBox> 

            <p style="color:darkslategray; margin-right:15%; margin-top: 1%; direction:rtl; font-weight: bold; font-size:30px;"">رابط المنتج:</p>
            <asp:TextBox style="margin-right:20%;" ID="link" runat="server"> </asp:TextBox>
           
            <p style="color:darkslategray; margin-right:15%; margin-top: 1%; direction:rtl; font-weight: bold; font-size:30px;"">التصنيف:</p>
            <div style="margin-right:20%">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="200px" CssClass="auto-style21">
                <asp:ListItem>التصنيف</asp:ListItem>
                <asp:ListItem>عروض تقديمية</asp:ListItem>
                <asp:ListItem>تصاميم شهادات</asp:ListItem>
                <asp:ListItem>بروشورات وكتيبات</asp:ListItem>
                <asp:ListItem>مقاطع فيديو</asp:ListItem>
                <asp:ListItem>مجلات تعليمية</asp:ListItem>
                <asp:ListItem>بطاقات بريدية</asp:ListItem>
                </asp:DropDownList> 
            </div>
                           <br />
                           <br />
                           <br />
                           <br />
                           <br />
                           <br />
            <!-- Display Image -->
            <div style="margin-top: -630px;width: 100%;margin-inline: -65%;display: inline-flex;float: left;">
                <asp:Image ID="Image1" runat="server"  Height="250px" />
            </div>
        </div>

        <div style="margin-top: -15%;margin-right: 40%; margin-bottom:50%;">
                        
            <asp:Button ID="b1" runat="server" Class="btn1" Text="رفع" OnClick=" Save_Click" />
            <asp:FileUpload ID="imageproduct" runat="server"/>
            <br />
            <asp:Label ID="Resultpro" runat="server" style="margin-right: 47%;"></asp:Label>

            <div class="Popup" id="PopupSignUp">
                <div class="bg">
                    <img src="Images/tick.jpeg" />
                    <h2>تم التعديل بنجاح</h2>
                    <!--اذا بضيف برجراف-->
                    <!--- <p></p>-->
                    <button type="button" class="button11" onclick="closePopup()">تم</button>

                </div>
            </div>
        </div>
    </div>

    <div style="margin-right:80%;margin-top: -5.6%;">
        <asp:Button ID="Button1" runat="server" class="btn2" Text="رجوع" onclick="Back_Click"/>
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