

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%@include file="components/header.jsp" %>


<%--<%@include file="components/main_banners.jsp" %>--%>

<div class="w-100 mt-4" style="padding-left: 2rem;display: flex;align-items: center;justify-content: space-around">
    <div  style="width: 40%; display: flex;justify-content: space-around;align-items: center">
        <p style="font-family: fantasy;letter-spacing: 1.5px;font-size: 30px;color: #00002f">Awsome Beds </p>
        <p style="font-family: fantasy;letter-spacing: 1.5px;font-size: 30px;color: #00002f">/ </p>
        <h5 style="font-family:serif ;font-size: 25px;color:#002f3f; font-weight: bold; ">Make yourself comfortable</h5>
    </div>
</div>

<div class="owl-carousel owl-theme top-banner-div">
    <a href="search.jsp?category=3"> <div class="top-banner mt-2" style="background-image: url(img/bedSalesMain4.jpg)"></div></a>
    <a href="search.jsp?category=3"> <div class="top-banner mt-2" style="background-image: url(img/bedSalesMain1.jpg)"></div></a>
    <a href="search.jsp?category=3"> <div class="top-banner mt-2" style="background-image: url(img/bedSalesMain3.jpg)"></div></a>
    <a href="search.jsp?category=3"> <div class="top-banner mt-2" style="background-image: url(img/bedSalesMain2.jpg)"></div></a>
</div>

    <div id="discountbanner1" class="discount-banner mt-2">Get Flat 50% Off On Your First Order!!</div>
<!--<div class="owl-carousel owl-theme discount-banner-div">
    <div id="discountbanner2" class="discount-banner mt-2"></div>
    <div id="discountbanner3" class="discount-banner mt-2"></div>
    <div id="discountbanner4" class="discount-banner mt-2"></div>
</div>-->

<div class="w-100 d-flex justify-content-center"><div class="w-75"><hr style="background-color: gray;" /></div></div>


<div class="w-100 mt-8" style="padding-left: 2rem;display: flex;align-items: center;justify-content: space-around">
    <div  style="width: 40%; display: flex;justify-content: space-around;align-items: center">
        <p style="font-family: fantasy;letter-spacing: 1.5px;font-size: 30px;color: #00002f">Best Sofas</p>
        <p style="font-family: fantasy;letter-spacing: 1.5px;font-size: 30px;color: #00002f">/ </p>
        <h5 style="font-family:serif ;font-size: 25px;color:#002f3f; font-weight: bold; ">Just melt in</h5>
    </div>
</div>

<div class="owl-carousel owl-theme top-banner-div">
    <a href="search.jsp?category=1"> <div class="top-banner mt-2" style="background-image: url(img/sofaSalesMain1.jpg)"></div></a>
    <a href="search.jsp?category=1"> <div class="top-banner mt-2" style="background-image: url(img/sofaSalesMain2.png)"></div></a>
    <a href="search.jsp?category=1"> <div class="top-banner mt-2" style="background-image: url(img/sofaSalesMain3.jpg)"></div></a>
    <a href="search.jsp?category=1"> <div class="top-banner mt-2" style="background-image: url(img/sofaSalesMain4.jpg)"></div></a>
</div>

<div id="discountbanner3" class="discount-banner mt-2">Great Discount Upto 60% On Sofas!!</div>

<div class="w-100 d-flex justify-content-center"><div class="w-75"><hr style="background-color: gray;" /></div></div><!-- comment -->



<div class="w-100 mt-8" style="padding-left: 2rem;display: flex;align-items: center;justify-content: space-around">
    <div  style="width: 40%; display: flex;justify-content: space-around;align-items: center">
        <p style="font-family: fantasy;letter-spacing: 1.5px;font-size: 30px;color: #00002f">Beautiful Decors</p>
        <p style="font-family: fantasy;letter-spacing: 1.5px;font-size: 30px;color: #00002f">/ </p>
        <h5 style="font-family:serif ;font-size: 25px;color:#002f3f; font-weight: bold; ">Make your home elite</h5>
    </div>
</div>

<div class="owl-carousel owl-theme top-banner-div">
    <a href="search.jsp?category=2"> <div class="top-banner mt-2" style="background-image: url(img/homeDecorMain2.jpg)"></div></a>
    <a href="search.jsp?category=2"> <div class="top-banner mt-2" style="background-image: url(img/homeDecorMain1.jpg)"></div></a>
    <a href="search.jsp?category=2"> <div class="top-banner mt-2" style="background-image: url(img/homeDecorMain3.jpg)"></div></a>
    <a href="search.jsp?category=2"> <div class="top-banner mt-2" style="background-image: url(img/homeDecorMain4.jpg)"></div></a>
</div>

<%@include file="components/footer.jsp" %>
