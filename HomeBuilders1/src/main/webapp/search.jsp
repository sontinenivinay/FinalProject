<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="components/header.jsp" %>



<style>
    body{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    .filter-section{
        display: none;
    }
    #mobileProductFilter{
        display: none;
    }
    #mobileProductSort{
        display: none;
    }
    @media screen and (max-width: 1080px){
        .burger,.logo,#icon-link{
            display: none;
        }
        .searchHomeRedirect{
            display: flex!important;
        }
        .icon-links{
            margin: auto;
            /* border: 2px solid green; */
        }
        /* .icon-links::before{
          content: '<';
          margin: 0 1rem;
        } */
        .search{
            /* margin: 0 auto; */
            width: 86vw;
            display: flex;
        }
        .searchIcon{
            margin: 0rem;
        }
        #searchFilter{
            display: none;
        }
        .imgBox1{
            height: 270px;
        }
        .filter-section{
            position: fixed;
            bottom: 0;
            display: flex;
            width: 100%;
            /* display: none; */
        }

        .filterCards{
            background-color: #f8f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 3.5rem!important;
            width: 100%;
        }
        .mobileProductFilter{
            display: none!important;
            bottom: 30rem!important;
        }


        .mobileProductFilter .visible{
            display: block;
        }

        .hi{
            display: block!important;
            bottom: 0rem!important;
            /* transition: 10s ease-in-out!important; */
        }
        .hello{
            display: block!important;
            top: 29rem!important;
            /* transition: 10s ease-in-out!important; */
        }

    }
</style>
<!-- Product display section starts -->

<div class="container-fluid">
    <div class="row">


        <div class="col-2 mt-3 bg-light" id="searchFilter">    
            <form action="" method="post">                

                <div class="list-group">
                    <h3>Categories</h3>

                    <% String cat = request.getParameter("category");
                        //out.println(cat);

                        ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                        List<Product> list = null;

                        if (cat == null || cat.trim().equals("all")) {
                            list = dao.getAllProducts();

                        } else {

                            int cid = Integer.parseInt(cat.trim());
                            list = dao.getAllProductsById(cid);

                        }

                        CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                        List<Category> clist = cdao.getCategories();

                    %>
                    <div class="list-group-item checkbox">
                        <label><a href="search.jsp?category=all" name="filt_subcat[]" style="color: black;" class="productDetail subcat" value="All" > All</label>
                    </div>
                    <% for (Category c : clist) {
                    %>

                    <div class="list-group-item checkbox">
                        <label><a href="search.jsp?category=<%= c.getCategoryId()%>" name="filt_subcat[]" style="color: black;" class="productDetail subcat" value="<%= c.getCategoryId()%>" > <%= c.getCategoryTitle()%></label>
                    </div>
                    <%    }
                    %>
                </div>
            </form>
        </div>
        <!-- <input type="text" name=""> -->
        <div class="col-lg-12 col-xl-10 col-md-12 col-12">
            <div class="row dhumm" id="dhumm">

                <%
                    for (Product p : list) {

                %>


                <div class="col-xl-2 col-lg-3 col-md-4 col-6" style="display: flex; justify-content: center; padding:1px!important;">
                    <div class="card1 my-2">
                        <a href='productDesc.jsp?prodId=<%= p.getpId()%>' style="text-decoration: none!important">
                            <div class="imgBox1">
                                <img src="./img/products/<%= p.getpPhoto()%>" alt="" class="img-fluid">
                            </div>
                            <div class="cardBody1">
                                <div class="top1"><span class="title"><%= p.getpName()%></span><br>
                                    <p style="white-space:nowrap;word-wrap:break-word;overflow:hidden;text-overflow:ellipsis; width:160px;">
                                        <%= p.getpDesc()%>
                                    </p></div>
                                <div class="priceSection"><span class="price">USD <%= p.getPriceAfterApplyingDiscount()%></span>&nbsp;&nbsp;<span class="strikedPrice"><small><s>USD <%= p.getpPrice()%></s></small></span>
                                    <span class="discount"><small>(<%= p.getpDiscount()%>% off)</small></span></div>
                            </div>
                        </a>
                    </div>
                </div>

                <%}

                    if (list.size() == 0) {
                        out.println("<h3>We don't have any products yet!!</h3>");
                    }


                %>                                


            </div>

        </div>


    </div>

</div>
<script>

</script>
<!-- Product display section ends -->   
<%@include file="components/common_modals.jsp" %>
<%@include file="components/footer.jsp" %>