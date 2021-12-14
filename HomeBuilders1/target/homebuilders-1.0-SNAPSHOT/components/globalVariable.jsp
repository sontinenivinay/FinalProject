<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    int globalUserId=0;
    if(user == null){
        globalUserId = 0;
    }else{
        globalUserId =  (int)user.getUserId();
    }
%>