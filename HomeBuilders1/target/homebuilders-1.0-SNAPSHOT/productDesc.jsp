<%@include file="components/globalVariable.jsp" %>
<%@page import="java.io.Console"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>

<% String prodId = request.getParameter("prodId");

    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
    List<Product> list = null;
    Product prod = null;

    if (prodId == null || prodId.trim().equals("all")) {
        list = dao.getAllProducts();

    } else {

        int pId = Integer.parseInt(prodId.trim());
        prod = dao.getProductById(pId);

    }

    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist = cdao.getCategories();

%>    

<section id="product" class="py-3">
    <div class="container-fluid d-flex justify-content-center" style="width: 97%;">
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-7 p-0">
                    <div class="owl-carousel owl-theme top-banner-div smallImage m-0">
                        <img src="./img/products/<%= prod.getpPhoto()%>" alt="" class="productViewCarousel">
                    </div>
                    <div class="row mx-0 bigImage d-flex justify-content-center">
                        <div class="col-6 p-1">
                            <img src="./img/products/<%= prod.getpPhoto()%>" class="img-fluid" alt="" style="width: 100%; height: 70vh;">
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 my-2 px-4">
                    <h3 class="my-0"><%= prod.getpName()%></h3>
                    <div class="mt-0" style="color: gray; font-size:1.4rem;font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;">
                    </div>
                 

                    <div style="display: flex; align-items: center; margin-top:1rem;">
                        <div style="font-size: x-large; font-weight: 600;">USD&nbsp;<span><%= prod.getPriceAfterApplyingDiscount()%></span></div>&nbsp;&nbsp;&nbsp;&nbsp;
                        <s style="font-size: large; font-weight:400; color:gray;">USD&nbsp;<%= prod.getpPrice()%></s>&nbsp;&nbsp;
                        <span style="font-weight: 600; font-size: larger; color: orange;">(<%= prod.getpDiscount()%>%&nbsp;off)</span>&nbsp;&nbsp;

                    </div>
                    <small style="color: gray; font-weight: bold; font-size: medium;">inclusive all taxes</small>

                    <div class="form-row pt-3 largePageCTA"> 
                        <div class="col">
                            <form action="CartServlet" method="post">
                                <%
                                    if (globalUserId == 0) {
                                %>

                                <a href="login.jsp" type="submit" class="btn shadow-none" name="hmmm" value="addToCart" id="" style="padding: 0.50rem 1.4rem; margin-top: 0.2rem; background-color: tomato;color: white; font-size: 20px;")">Easy Login</a>                                
                                <%
                                } else {
                                %>
                                
                                
                                <input type="hidden" value="<%= globalUserId %>" name="userId">
                                <input type="hidden" value="<%= prod.getpId()%>" name="prodId">
                                <input type="hidden" value="<%= prod.getpName()%>" name="prodName">
                                <input type="hidden" value="<%= prod.getPriceAfterApplyingDiscount()%>" name="price">
                                <input type="hidden" name="item_id" id="item_id" value="<?php echo $item_id; ?>">
                                <input type="hidden" name="shop_id" id="shop_id" value="<?php echo $row['shopId']; ?>">
                                
                                
                                <button type="submit" class="btn shadow-none" name="AddToCart" value="AddToCart" id="" style="padding: 0.50rem 1.4rem; margin-top: 0.2rem; background-color: #fc4a4a;color: white; font-size: 20px;" onclick="add_to_cart(<%= prod.getpId()%>, '<%= prod.getpName()%>',<%= prod.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>                                

                                <%
                                    }
                                %>
                            </form>
                        </div>
                    </div>


                    <!-- Product Price ends -->
                    <!-- policy starts -->
                    <div id="policy">
                        <div class="d-flex my-4">
                            <div class="return text-center mr-5">
                                <div class="my-2 mt-3">
                                    <span class="fas fa-retweet p-3 rounded-pill border"></span>
                                </div>
                                <p>10 Days <br>Replacement</p>
                            </div>
                            <div class="return text-center mr-5">
                                <div class="my-2">
                                    <span class="fas fa-truck p-3 rounded-pill border"></span>
                                </div>
                                <p>Fast <br>Delivery</p>
                            </div>
                            <div class="return text-center mr-5">
                                <div class="my-2">
                                    <span class="fas fa-check-double p-3 rounded-pill border"></span>
                                </div>
                                <p>Great <br>Quality</p>
                            </div>
                        </div>
                    </div>
                    <!-- policy ends -->
                    <hr>
                    <!-- order details starts -->
                    <div class="d-flex flex-column text-dark" id="order-details">
                        <small>Sold by - &nbsp;&nbsp;<%= prod.getpName() %>&nbsp;
                            (4.5 out of 5 | 18,198 ratings) </small>
                        <small style="margin-top: 10px;"><i class="fas fa-map-marker-alt color-primary">&nbsp;&nbsp;Deliver to - <% if(globalUserId == 0){%>You<%}else{%><%= user.getUserEmail() %><%} %></i></small>
                    </div>
                    <!-- order details ends -->

                </div>
            </div>
            <div class="col-12 mt-5">
                <h6>Product Description</h6>
                <hr>
                <p><%= prod.getpDesc()%></p>
            </div>
        </div>
    </div>
    <!--</form>-->
</section>
<!-- Product display ends -->


<%@include file="components/common_modals.jsp" %>
<%@include file="components/footer.jsp" %>
