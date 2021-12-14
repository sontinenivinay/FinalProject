<!DOCTYPE html>
<html>
    <head>
        <title>Login - Home Builders</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="display:flex;justify-content:center;box-style:border-box;align-items:center;background-image:url(./img/Background-Illustrations.jpg)!important;background-repeat:no-repeat!important;background-size:cover!important">

        <div class="card col-md-7 p-5 border-0" style="margin-top:10%;display:flex;justify-content:center;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)">
            <%@include file="components/message.jsp" %>
            <div class="row">
                <!--Side Image-->
                <div class="col-md-6 mt-2 text-center">
                    <img src="./img/HomeDecorLogo.png" class="img-fluid" alt="Logo" style="width:70px;">
                    <h3 class="mt-3" style="font-weight:bold">We are Home Builders</h3><br/>
                    <p style="font-weight:bold;color:grey">Explore the world and discover yourself<br/>  with people all around the world</p>
                    <img src="./img/LogIn-Page-Chair-Img.jpg" class="img-fluid" alt="" style="width:170px">
                </div>
                <!--Action side-->
                <div class="col-md-6 mx-auto mt-4 px-5">
                    <div class="card border-0">
                        <div class="card-body">
                            <div class="row">
                                <div class="col mb-4">
                                    <h6 class="card-title mb-3" style="font-weight:bold">Login</h6>
                                    <h3 style="font-weight: bold;letter-spacing:1.2px">Welcome Back</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <form action="LoginServlet" method="post">                            
                                        <div class="form-group">
                                            <label style="font-size:14px; font-weight:540" for="">Email Address</label>
                                            <!--<input type="text" name="user_login_email" id="" class="form-control shadow-none" placeholder="example@example.com" style="border:0;border-bottom:1px solid grey">-->
                                            <input type="email" name="email" class="form-control shadow-none" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example@example.com" style="border:0;border-bottom:1px solid grey">
                                            <p style="color: red; font-size:small;" id="EmailError"></p>
                                        </div>
                                        <div class="form-group">
                                            <label for="" style="font-size:14px; font-weight:540">Password</label>
                                            <!--<input type="password" class="form-control shadow-none" placeholder="Password" name="user_pass_signin" style="border:0;border-bottom:1px solid grey" id="user_pass_signin">-->
                                            <input  name="password" type="password" class="form-control shadow-none" id="exampleInputPassword1" placeholder="Password" style="border:0;border-bottom:1px solid grey">
                                            <p style="color: red; font-size:small;" id="PassError" ></p>
                                        </div>
                                        <p style="color: red; font-size:medium;" id="Error" ></p>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-block w-100 shadow-none border mt-2 mb-2" style="background-color:#00000f;color:white" >Log In</button>
                                        </div>
                                        <p>Don't have an account? <a href="register.jsp" style="font-size:small; font-weight:bold; color:blue;">Sign Up</a> <p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--    </form>-->


        <!--</div>-->
        <%@include file="components/common_js.jsp" %>
    </body>
</html>
