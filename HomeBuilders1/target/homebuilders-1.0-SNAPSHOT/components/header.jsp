<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="common_css_js.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Builders</title>
        <!-- Tailwind css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css" integrity="sha512-jJ4q433srLv86rVtrIu5Tco3NLLZ81Y4kkgr7jqm19oZG7cutkYOSSVLqQJ0I4niSm/5X5B4BeEbnBRvFfhWLg==" crossorigin="anonymous" />
        <!-- Bootstrap css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <!-- GOOGLE ROBOTO FONT -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <!-- Owl carousel -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" />
        <!-- font awesome kit -->
        <script src="https://kit.fontawesome.com/f2fae123e6.js" crossorigin="anonymous"></script>

        <!-- For sidebar -->
        <link rel="stylesheet" href="style.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <style>
            body a{
                text-decoration: none!important;
            }
            .searchHomeRedirect{
                display: none!important;
            }
            @media screen and (min-width: 1080px){
                .smallImage{
                    display: none!important;
                }
                .smallPageCTA{
                    display: none!important;
                }
            }
            @media screen and (max-width: 1080px){
                
                .homeBuildersLogo{
                    font-size: 15px;
                }
                
                .logo{
                    width: 30px;
                    left: 1rem;
                    top: -0.25rem;
                }
                
                .cart-counter{
                    top: -10%!important;
                    right: 27%!important;
                }
                .smallImgae{
                    display: block!important;
                    border: 4px solid black!important;
                    margin-top: 0!important;
                }
                .bigImage{
                    display: none!important;
                }
                .smallPageCTA{
                    display: flex!important;
                }
                .largePageCTA{
                    display: none!important;
                }
            }
        </style>
    </head> 
    <body>
        <header>
            <nav style="position: fixed; top:0; width: 100%; z-index:6;">
                <div class="nav-list">
                    <!--<div style="display: flex; align-self: flex-start" class="border">-->
                    <div class="logo"><a href="index.jsp" class="homeBuildersLogo">HOME BUILDERS</a></div>
                    <div class="list-item">

                        <!-- ------------------------MEN--------------------- -->
                        <div class="dropdown">
                            <a href="search.jsp?category=1" style="color: black;" class="dropbtn">FURNITURE</a>
                        </div>
                        <!-- ------------------------MEN--------------------- -->


                        <!-- ------------------------WOMEN--------------------- -->

                        <div class="dropdown">
                            <a href="search.jsp?category=2" style="color: black;" class="dropbtn">DECOR</a>
                        </div>

                        <!-- ------------------------WOMEN--------------------- -->

                        <!-- ------------------------KIDS--------------------- -->

                        <div class="dropdown">
                            <a href="search.jsp?category=3" style="color: black;" class="dropbtn">BED</a>
                        </div>


                        <!-- ------------------------KIDS--------------------- -->

                        <!--<div>ESSENTIALS</div>-->
                        <!--                    <div>STORES</div>-->

                        <div class="dropdown">
                            <a href="search.jsp?category=4" style="color: black;" class="dropbtn">ESSENTIALS</a>
                        </div>
                        <div class="dropdown">
                            <a href="search.jsp?category=5" style="color: black;" class="dropbtn">UTENSILS</a>
                        </div>
                    </div> 
                    <!--</div>-->

                    <a href="index.jsp" style="text-decoration: none; color:black; display:flex; justify-content:center; align-items:center; padding: 0 1rem;" class="searchHomeRedirect"><i class="fas fa-chevron-left"></i></a>
                    <div class="icon-links">
                        <a href="search.jsp" class="i-links" id="icon-link"><i class="fas fa-search"></i></a>
                        <a href="cart.jsp" class="i-links" id="icon-link" name="cart"><i class="fas fa-shopping-bag"></i></a>
                        <a href="orderStatus.jsp" class="i-links" id="icon-link"><i class="fas fa-box-open"></i></a>
                        <a href="LogoutServlet" id="icon-link" class="i-links"><i class="fas fa-user"></i></a>
                    </div>

                </div>
            </nav>
        </header>

        <!-- header ends -->
        <!-- main starts -->
        <main style="margin-top:4rem; border:1px solid transparent;">
   <!-- It ends in child pages here -->