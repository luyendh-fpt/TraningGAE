<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: tienb
  Date: 05/05/2018
  Time: 9:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    HashMap<String, String> errors;
    HashMap<String, String> valueFields;

    String errUsername = "", errPassword = "",errLogin = "";
    String valueUsername = "", valuePassword = "";

    try {
        valueFields = (HashMap<String, String>) request.getAttribute("valueField");
        valueUsername = valueFields.get("valueUsername");
        valuePassword = valueFields.get("valuePassword");
    }catch (Exception e){
        System.out.println("map rong");
    }
    try {
        errLogin = (String)request.getAttribute("errorLogin");
        if(errLogin == null){
            errLogin = "";
        }
    }catch (Exception e){
        System.out.println("Ko loi");
    }
    try {
        errors = (HashMap<String, String>) request.getAttribute("errors");
        errUsername = errors.get("username");
        errPassword = errors.get("password");

    }catch (Exception e){
        System.out.println("map rong");
    }
%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="/assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="/assets/css/cssLogin.css">
</head>

<body>
<div class="login-clean">
    <form method="post" action="/user/login">
        <h2 class="sr-only">Login Form</h2>
        <div class="illustration"><i class="icon ion-ios-navigate"></i></div>
        <div class="form-group"><input class="form-control" type="username" name="username" placeholder="Username" value="<%=valueUsername%>"></div>
        <div class="form-group"><p><%= errUsername%></p></div>
        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" value="<%=valuePassword%>"></div>
        <div class="form-group"><p><%= errPassword%></p></div>
        <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Log In</button></div>
        <div class="form-group"><p><%= errLogin%></p></div>
        <a style="margin-bottom: 10px" href="/user/register" class="forgot">You have'n account? Register now!</a>
        <a href="#" class="forgot">Forgot your email or password?</a></form>
</div>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>