<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="DigitalRepository.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/style.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="us">

    <div name="banner" id="shopWus" style="background-color: white; height: 40px; width: 100%;">
        <p dir="rtl" style="text-align: center; margin: auto; font-size: 40px; color:#1A645C; ; font-weight: bolder;">&nbsp&nbsp&nbsp ماهو المستودع الرقمي  </p>/div>
      
        <p style="color:black; text-align: center; font-size:20px; width: 700px; margin: auto;" dir="rtl">نظام يتيح بيع الكائنات التعليمية أو المقررات الالكترونية التي يتم إنتاجها
            من قبل عمادة التعلم الإلكتروني والتعليم عن بعد بحيث يمكن لأي زائر من
            داخل او خارج جامعة الملك عبدالعزيز بشراء الموارد (تدريب, تعليم, جودة)
             بحيث تكون جاهزة للتنزيل على شكل قوالب مع شرح آلية استخدامها.</p></div>
             <br>
        <br />
        <br />
        <br />
        <br />
        <br />

             <div class="text-center mb-4">
                <h2  dir="rtl" style="text-align: center; margin: auto; font-size: 25px; color:#3EB18C;  font-weight: bold;"><span class="px-2">أهداف النظام و الفئة المستهدفة</span></h2>
                <br>
             <p style="color:black; text-align: right; font-size: 20px; width: 700px; margin-left: 20%;" dir="rtl">• توفير موارد تعليمية و رقمية من إنتاج عمادة التعلم الالكتروني و التعليم عن بعد 
               <br />
                • تبادل المهارات و المعرفة بين افراد المجتمع
                 <br />
                • و يكون استهداف النظام لأي زائر من داخل او خارج جامعة الملك عبدالعزيز </p>

    </div>
<!-- Page Header End -->"

<!-- Contact Start -->
<%--<div class="container-fluid pt-5">--%>
    <div class="text-center mb-4">
      <h2 style="color:#3EB18C; font-weight:bold;">للإستفسارات</h2>
    </div>
    <div class="row px-xl-5">
        <div class="col-lg-7 mb-5">
            <div class="contact-form">
                <div id="success"></div>
                <form name="sentMessage" id="contactForm" novalidate="novalidate">
                    <div class="control-group">
                        <input type="text" class="form-control" id="name" placeholder="الاسم"
                            required="required" data-validation-required-message="Please enter your name"  dir="rtl" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="email" class="form-control" id="email" placeholder="الايميل"
                            required="required" data-validation-required-message="Please enter your email" dir="rtl" />
                        <p class="help-block text-danger px-5"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" id="subject" placeholder="الموضوع"
                            required="required" data-validation-required-message="Please enter a subject" dir="rtl" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <textarea class="form-control" rows="6" id="message" placeholder="محتوى الرسالة"
                            required="required"
                            data-validation-required-message="Please enter your message" dir="rtl" ></textarea>
                        <p class="help-block text-danger"></p>
                    </div>

                    <div>
                        <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton" >إرسال</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-5 mb-5">
            <h5 class="font-weight-semi-bold mb-3" dir="rtl" >ابقى على تواصل</h5>
            <p dir="rtl" style="color:black;" >نحن نعمل باستمرار لجعل تجربتك من خلال الخدمات الحكومية أسهل, سنقوم بالرد على رسالتكم خلال 24 ساعة</p>
            <div class="d-flex flex-column mb-3">
                <h5 class="font-weight-semi-bold mb-3" dir="rtl" >التفاصيل</h5>
                <p style="color:black;" class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3" dir="rtl" ></i>جدة, المملكة العربية السعودية.</p>
                <p style="color:black;" class="mb-2"><i class="fa fa-envelope text-primary mr-3" dir="rtl" ></i>info@DigitalRepository.com</p>
                
            </div>
        </div>
    </div>
</div>
  
</asp:Content>