<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminEditProductDetails.aspx.cs" Inherits="DigitalRepository.AdminEditProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Page for the admin to edit a products details -->

    <link href="css/Products.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/btns.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomePage.aspx">لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textB" href="AdminProductManagement.aspx">ادارة المنتجات</a>
        <label class ="textB">&lt</label>
        <a class="textB" href="AdminEditProducts.aspx">تعديل المنتجات</a>
        <label class="textB">&lt</label>
        <a class="textC">تعديل تفاصيل المنتج</a>
        <i class="fa fa-home icon"></i>
    </div>

    <div style="margin-left: 6%">
        <label class="title">تعديل تفاصيل المنتج</label>
    </div>

    <div style=" width: 1250px; height: 666px; margin-left:8%; background-color:#C8D4D3; border:solid 1px; border-color:black; border-radius:15px;">
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
            <div style="margin-top: -630px; width: 100%; margin-inline: -65%; display: inline-flex; float: left;">
                <asp:Image ID="Image1" runat="server"  Height="250px" />
            </div>
        </div>

        <div style="margin-top: -20%; margin-right: 42%; margin-bottom:50%;">
                        
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

    <div style="margin-right:80%;margin-top: -7.1%;">
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