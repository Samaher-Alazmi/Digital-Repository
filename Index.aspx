<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DigitalRepository.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Homepage for the website -->

    <link href="css/vendors.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="header-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="height: 310px;">
                <img class="img-fluid" src="Images/page0.jpg" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 700px;">
                        <a href="#shopWus" class="btn btn-light py-2 px-3 ">تصفح المتجر</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <div name="banner" id="shopWus" style="background-color: #3BBAB1; height: 40px; width: 100%;">
            <p dir="rtl" style="text-align: center; margin: auto; font-size: 30px; color: white; font-weight: bold;">اقسام المتجر</p>
        </div>
        <br>
        <div class="row px-xl-5 pb-3 ">
            <!--ديف مسافة تعديل الاقسام-->
            <span>
                <div style="width: 50px;"></div>
            </span>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item  flex-column border mb-4" style="padding: 30px;">
                    <a href="ProductsPresentations.aspx" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="Images/page1.jpeg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">عروض تقديمية</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="ProductsBooklets.aspx" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="Images/page2.jpeg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">بروشورات وكتيبات</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="ProductsCertificates.aspx" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="Images/page3.jpeg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">تصاميم شهادات</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="ProductsVideos.aspx" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="Images/page4.jpeg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">مقاطع فيديو</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="ProductsCards.aspx" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid"  src="Images/cards.jpeg"  alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">بطاقات بريدية</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="ProductsMagazines.aspx" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid"  src="Images/magazines.jpeg"  alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">مجلات تعليمية</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Categories End -->




    <!-- Vendor Start -->

    <div name="banner" style="background-color: transparent; height: 40px; width: 100%;">
        <p dir="rtl" style="text-align: center; margin: auto; margin-top: 50px; font-size: 30px; color: black; font-weight: bold;">شركاء النجاح</p>
    </div>

    <div class="container-fluid py-5">
        <div class="vendor">
            <div class="vendorimg">
                <img src="Images/vendor1.jpeg" alt="">
                <img src="Images/vendor2.jpeg" alt="">
                <img src="Images/vendor1.jpeg" alt="">
                <img src="Images/vendor2.jpeg" alt="">
                <img src="Images/vendor1.jpeg" alt="">
                <img src="Images/vendor2.jpeg" alt="">
            </div>

        </div>
    </div>

    <!-- Vendor End -->

</asp:Content>
