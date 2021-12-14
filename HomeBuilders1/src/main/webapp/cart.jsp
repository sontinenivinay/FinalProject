<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@include file="components/globalVariable.jsp" %>

<%    if (globalUserId == 0) {
        session.setAttribute("message", "Please Login first!!");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page import="com.learn.mycart.entities.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CartDao"%>
<%@page import="com.learn.mycart.entities.User"%>





<%@include file="components/header.jsp" %>

<style>
    body{
        background-color: white!important;
    }
    .main-container{
        width: 75%;
    }
    .cart-img{
        max-height: 150px;
    }
    .cart-product-card{
        width: 80%;
    }
    .noti{
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: gray;
        color: white;
        font-size: large;
        border-radius: 5px;
        border: 2px solid green;
        height: 2.5rem;
        padding: 0.5rem;
        /* width: 0rem; */
        /* display: none; */
        position: absolute;
        right: 10%;
        top: -15%;
        transition: ease-in-out 3s;
    }
    .show{
        /* display: flex; */
        top: 5%;
    }
    .cta{
        border-top: 1px solid lightgray;
    }
    @media screen and (max-width: 1080px){
        .main-container{
            width: 100%;
        }
        .cart-img{
            max-height: 130px;
        }
        .cart-product-card{
            width: 100%;
        }
        .cart-price-section{
            display: flex;
        }
        .cta{
            border: none;
            margin-top: 2rem;
        }
    }
</style>
<%
    CartDao cartDao = new CartDao(FactoryProvider.getFactory());
    ProductDao prodDao = new ProductDao(FactoryProvider.getFactory());
    List<Cart> clist = cartDao.getCartProductsByUserId(globalUserId);
%>

<%
    if (clist.isEmpty()) {
%>

<div class="container-fluid border d-flex justify-content-center" style="background-image:url(./img/Background-Illustrations.jpg)!important;background-repeat:no-repeat!important;background-size:cover!important">
    <div class="card col-md-6 p-5 border-0" style="margin-top:5%;margin-bottom: 10%;display:flex;justify-content:center!important; align-items: center;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)">
        <h4>Ohooo!!</h4><br/>
        <i class="fab fa-dropbox my-auto" style="font-size: 10rem; color:#ff4343"></i><br/>
        <h2>Your Cart is empty!!</h2>
        <p style="text-align: center; color: grey" >Looks like you've not added anything to your cart lately.<br/> Let's go shop something great for you!!.</p><br/>
        <a href="index.jsp" class="btn btn-block w-50 shadow-none border mt-2 mb-2" style="background-color:#00000f;color:white" >Continue Shopping</a>
    </div>
</div>
<%
} else {
%>


<div class="container-fluid mt-5 main-container">
    <div class="row p-0">
        <div class="col-sm-7 border-right border-top " id="">


            <%
                int cartTotal = 0;
                for (Cart c : clist) {
                    cartTotal += c.getPrice();
                    Product p = prodDao.getProductById(c.getProductId());

            %>





            <form action="CartServlet" method="post">

                <input type="hidden" name="cartId" value="<%= c.getCartId()%>"/>
                <div>
                    <div class="row py-3 mt-3 mx-auto cart-product-card p-0" style="border-left:1px solid lightgray; border-right:1px solid lightgray; border-top:1px solid lightgray; border-radius: 5px 5px 0 0;">

                        <div class="col-xl-3 col-lg-2 col-md-4 col-sm-4 col-4">
                            <img src="./img/products/<%= p.getpPhoto()%>" class="img-fluid cart-img" alt="">
                        </div>

                        <div class="col-xl-6 col-lg-7 col-md-8 col-sm-8 col-8 p-1" style="display: flex; flex-direction: column;justify-content: center;">
                            <h5><%= c.getProductName()%></h5>
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                    <!--<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">-->
                                    <div class="qty d-flex pt-2 text-center"  style="display: flex; align-items: center; padding: 3px;">
                                        <h6>Qty: </h6>&nbsp;&nbsp;&nbsp;
                                        <div class="d-flex text-center">
                                            <button type="submit" name="qtyUp" class="qty_up" style="border: 1px solid black; padding: 5px; height: 1.2rem; display:flex; align-items:center;" ><i class="fas fa-angle-up"></i></button>
                                            <input type="text" id="" name="" style="border: 1px solid black; height: 1.2rem; text-align: center; width: 30px;" class="qty_input mx-1" value="<%= c.getQty()%>" readonly>
                                            <button type="submit" name="qtyDown" class="qty_down" style="border: 1px solid black; padding: 5px; height: 1.2rem; display:flex; align-items:center;"><i class="fas fa-angle-down"></i></button>                                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%

                            int prodDiscount = p.getpDiscount();;
                            int prodPrice = c.getPrice();
                            int inc = (prodPrice * prodDiscount) / 100;
                            int mrp = prodPrice + inc;
                        %>
                        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 text-right " style="display: flex; flex-direction: column; justify-content:center; align-items:center;">
                            <div class="">
                                <div class="cart-price-section">
                                    <span style="font-weight: bold;color: tomato">Price</span>
                                    <br/><span class="mx-1" style="font-weight: 700;">USD</span> <span id="" value="58" style="font-weight: 700; font-size:medium"><%= c.getPrice()%></span>&nbsp;&nbsp;
                                    <div class="d-flex"><s style="color: grey;">USD<span class="strikedPrice" style="font-size: small;" id="" value="60"><%= mrp%></span></s>&nbsp;&nbsp;
                                        <span style="color: tomato;">5%off</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mx-auto pt-1 cart-product-card" style="border-left:1px solid lightgray; border-right:1px solid lightgray; border-bottom:1px solid lightgray; border-radius: 0 0 5px 5px;">
                        <div class="col-12 text-center mb-2 border-top p-0">
                            <button type="submit"name="removeCartProduct" class=" btn px-3 shadow-none" style="width: 100%; height:100%; font-size:1.05rem; font-weight: 600; color:#6e6e6e;">REMOVE</button>
                        </div>
                    </div>
                </div>           
            </form>



            <% }%>


            <!--Product display ends--> 
            <div style="color: black;"><div class="cart-product-card border mx-auto mt-3 py-3 px-3" style="display: flex;">
                    <p style="font-size: 1.5rem; margin: 0px; padding: 0px!important;">=</p>&nbsp;&nbsp;<span style="font-weight: 500; padding: 0.4rem 0;">Grand Total</span>
                    <span class="ml-auto" style="padding: 0.4rem 0;font-weight: 600"> = USD <%= cartTotal%></span>
                </div>
            </div>

        </div>
        <div class="col-md-4 cta px-4 pt-3" style="">
            <form action="CartServlet" method="post">
                <input type="hidden" name="userId" value="<%= globalUserId%>">

                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>




                <div class="form-group">
                    <label for="exampleFormControlTextarea1" >Your shipping address</label>
                    <textarea name="userAddress" class="form-control" id="" placeholder="Enter your address" rows="3"><%= user.getUserAddress()%></textarea>
                </div>


                <button type="submit" class="btn btn-block my-2 shadow-none"  name="buyNow" value="buyNow" id="buy" style="font-weight: 600; color: white; background-color: tomato;">BUY NOW</button>
            </form>
        </div>
        <!--subtotal section ends--> 


    </div>

</div>
</div>

<%
    }
%>


<%@include file="components/footer.jsp" %>