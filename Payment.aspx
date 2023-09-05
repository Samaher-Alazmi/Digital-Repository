<%@ Page Title="" Language="C#" MasterPageFile="~/VisitorMaster.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DigitalRepository.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/PageIndicator.css" rel="stylesheet" />
    <link href="css/Payment.css" rel="stylesheet" />
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="line"  dir="rtl" style="display:inline-block; display: flex;">
       <i class="fa fa-home icon"></i>
        <a class="textB" href="Index.aspx">الصفحة الرئيسية </a>
        <label class="textB">&gt</label>
        <a class="textB">السلة</a>
        <label class="textB">&gt</label>
        <a class="textC">الدفع</a>
    </div>
     
    
    
    <div class="container" dir="rtl">

        <div style="font-size: 20px; color: rgb(62, 62, 62); ">
            <img src="Images/pay.jpg" style="width: 10%; height:10%;" />طريقة الدفع 
        </div>
        <div class="bolder">

        <div class="alinImages" runat="server">
            <div class="iimage" style="float:right;" runat="server">
                <asp:ImageButton ID="madaBtn2" ImageUrl="~/Images/Mada_Logo.png" runat="server" class="payBtn" onclick="Mada_Click"/>
        </div>

        <div class="iimage2" style="float:right" runat="server">
            <asp:ImageButton ID="StcBtn2" ImageUrl="~/Images/Stc_pay.png" runat="server" class="payBtn" onclick="Stc_Click"/> 
        </div>
        </div>
            
         <div ID="StcInfo" runat="server">
          <label for="Phonenum">رقم الجوال</label>
          <input type="text" id="Phonenum" name="cardnumber" placeholder="+966" required/>
          
      </div>

            <div ID="madaInfo" runat="server">
        <label for="ccnum">رقم البطاقة</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="XXXX XXXX XXXX XXXX" required/>
            <label for="expmonth">الشهر/السنة</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="YY/MM" required/>

            <label for="cvv">رمز التحقق</label>
            <input type="text" id="cvv" name="cvv" placeholder="XXX" required/>
   
        
</div>
            
  </div>
        
        <div class="position2">
        <asp:Button ID="Pay" runat="server" class="Btn CheckoutB" onclick="Save_order" Text="إكمال الدفع"/>
    </div>
        
  </div>

</asp:Content>