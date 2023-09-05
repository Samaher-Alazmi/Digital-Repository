<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminEditFreelancer.aspx.cs" Inherits="DigitalRepository.EditFreelancerAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/StyleForEdit.css" rel="stylesheet" />
    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/Products.css" rel="stylesheet" />
    <link href="css/popup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="line">
        <a class="textB" href="AdminHomepage.aspx"> لوحة التحكم </a>
        <label class ="textB">&lt</label>
        <a class="textC">تعديل معلومات صاحب العمل الحر</a>
        <i class="fa-solid fa-pen-to-square icon" ></i>
    </div>

    <table style="margin-left:22%">
        
    <tr>
        <td>
            <textarea id="TextArea1" cols="20" rows="5">
              
            </textarea>
        </td>
        <td>
    <div class="section">
            <div class="auto-style3" style="margin-right: 0px;"> 
<label style="color: #000000; font-weight:bolder;"> تعديل معلومات صاحب العمل الحر </label><br />
                

                        <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <label style="color: #000000; font-weight:normal;">: الاسم الأول</label><br />

                 <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight:normal;">: الاسم الأخير</label><br />

                 <input type="text" class="content" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight:normal;">: تاريخ الميلاد</label><br />
                
                <label style="color: #000000; font-weight:normal;">: الجنس</label>

                
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="166px" TextAlign="Left" CssClass="auto-style2">
                    <asp:ListItem value="ذكر"></asp:ListItem>
                    <asp:ListItem Value="أنثى"></asp:ListItem>
                        </asp:RadioButtonList><br />
                
                

                 <input type="text" class="input" required style="; margin-left: 0px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight:normal;">: رقم الجوال</label><br />

                 <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight:normal;">: االبريد الالكتروني</label><br />

                 <input type="text" class="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label style="color: #000000; font-weight:normal;">: العنوان</label><br />

                <br />
                <asp:DropDownList ID="DropDownList2" runat="server">
                     <asp:ListItem>زائر</asp:ListItem>
                    <asp:ListItem>صاحب عمل حر</asp:ListItem>
                    <asp:ListItem>مسؤول موارد</asp:ListItem>
                    <asp:ListItem>مسؤول نظام</asp:ListItem>
                </asp:DropDownList>
                        <label style="color: #000000; font-weight:normal;">: تعديل صلاحية المستخدم</label><br />
                <br />
                <asp:Button ID="Button3" Class="btn2" runat="server" Text="إلغاء" style="margin-left: 0px" Width="148px" />
                <asp:Button ID="Button4" Class="btn1" runat="server" Text="تعديل المستخدم" style="margin-left: 0px" Width="148px" OnClientClick="openPopup()" />
                   
           </div>
        </div>
</td>
        </tr>
        </table>

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
