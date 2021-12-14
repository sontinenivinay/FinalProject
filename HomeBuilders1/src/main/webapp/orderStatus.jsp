<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
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
<%@include file="components/header.jsp" %>


<style>
    body{
        background-color: white!important;
    }
    a{
        text-decoration: none!important;
    }
    .similarProduct::-webkit-scrollbar {
        width: 20px!important;
    }


    .radio-tile-group .input-container {
        position: relative;
        height:  3.4rem;
        width:  3.4rem;
        margin: 0 0.35rem;
    }   

    .radio-tile-group .input-container .radio-button {
        opacity: 0;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        margin: 0;
        cursor: pointer;
    }

    .radio-tile-group .radio-tile {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 100%;
        height: 100%;
        border: 2px solid lightgray;
        border-radius: 50%;
        padding: 1rem;
        transition: transform 300ms ease;
    }

    .radio-tile-group .icon svg {
        fill: blue;
        width: 3rem;
        height: 3rem;
    }

    .radio-tile-group .radio-tile-label {
        text-align: center;
        font-size: 1rem;
        font-weight: 600; 
        text-transform: uppercase;
        /* letter-spacing: 1px; */
        color: black;
    }

    .radio-tile-group .radio-button:checked + .radio-tile {
        /* background-color: blue; */
        border: 2px solid orangered;
        color: white;
        transform: scale(1.1, 1.1);
    }

    .radio-tile-group {
        display: flex;
        flex-wrap: wrap;
    }

    .shake{
        display: flex;
        animation: shake 0.3s;
        animation-iteration-count: 2;
    }

    .redthis{
        border: 1px solid red;
    }

    .productViewCarousel{
        height: 350px;
    }

    @keyframes shake {
        0% { transform: translate(1px, 0px) rotate(0deg); }
        10% { transform: translate(-1px, 0px) rotate(0deg); }
        20% { transform: translate(-3px, 0px) rotate(0deg); }
        30% { transform: translate(3px,0px) rotate(0deg); }
        40% { transform: translate(1px, 0px) rotate(0deg); }
        50% { transform: translate(-1px, 0px) rotate(0deg); }
        60% { transform: translate(-3px, 0px) rotate(0deg); }
        70% { transform: translate(3px, 0px) rotate(0deg); }
        80% { transform: translate(-1px, 0px) rotate(0deg); }
        90% { transform: translate(1px, 0px) rotate(0deg); }
        100% { transform: translate(1px, 0px) rotate(0deg); }
    }

</style>
<script>
    function shake() {
        event.stopPropagation();
        var u = document.getElementById("radioShake");
        if (u.classList.contains("shake")) {
            u.classList.remove("shake");
        }
        u.classList.add('shake');
        setTimeout(function () {
            u.classList.remove('shake');
        }, 500);
    }
</script>

<%
    CartDao cartDao = new CartDao(FactoryProvider.getFactory());
    List<Cart> clist = cartDao.getOrdersProductsByUserId(globalUserId);
    ProductDao prodDao = new ProductDao(FactoryProvider.getFactory());
%>

<%
    if (clist.isEmpty()) {
%>
<div class="container-fluid border d-flex justify-content-center" style="background-image:url(./img/Background-Illustrations.jpg)!important;background-repeat:no-repeat!important;background-size:cover!important">
    <div class="card col-md-6 p-5 border-0" style="margin-top:5%;margin-bottom: 10%;display:flex;justify-content:center!important; align-items: center;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)">
        <h4>Ohooo!!</h4><br/>
        <i class="fab fa-dropbox my-auto" style="font-size: 10rem; color:#ff4343"></i><br/>
        <h2>Orders list is empty!!</h2>
        <p style="text-align: center; color: grey" >Looks like you've not ordered anything lately. That's totally fine.<br/> Lets go shop something great for you!!.</p><br/>
        <a href="index.jsp" class="btn btn-block w-50 shadow-none border mt-2 mb-2" style="background-color:#00000f;color:white" >Continue Shopping</a>
    </div>
</div>
<%} else {
%>

<!-- Product display section starts -->
<h4 class="bookmark-title">Your Orders</h4>
<div class="container-fluid">
    <div class="row">
        <%
            for (Cart c : clist) {

                int price = c.getPrice();
                int qty = c.getQty();
                int total = price * qty;
                
                Product p = prodDao.getProductById(c.getProductId());
        %>


        <div class=" col-xl-2 col-lg-3 col-md-3 col-sm-6 my-1" style="display:flex; justify-content: center; align-items:center;">
            <div class="card1 border">
                <!--<a href="search.jsp?">-->
                <div class="imgBox1">
                    <img src="./img/products/<%= p.getpPhoto()%>" alt="" class="img-fluid">
                </div>
                <div class="cardBody1">
                    <div class="top1"><span class="title"><%= c.getProductName()%></span><br>

                        <p>
                            x <%= qty%>
                        </p>
                    </div>
                    <div class="priceSection"><span class="price">USD <%= price%></span>&nbsp;&nbsp;<span class="strikedPrice"><small><s>USD <?php echo $row['item_price']?></s></small></span>
                        <span class="discount"><small>(<%= p.getpDiscount() %>% off)</small></span></div>
                </div>
            </div>
        </div>



        <%
            }
        %>
    </div>
</div>
<!-- Order display section ends -->   


<%
    }%>


<%@include file="components/footer.jsp" %>