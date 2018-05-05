<%@ page import="entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: tienb
  Date: 05/05/2018
  Time: 9:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account acc = (Account) request.getAttribute("acc");
%>
<html>
<head>
    <title>LOGIN SUCCESS</title>
</head>
<body>
    <h1>ĐĂNG NHẬP THÀNH CÔNG!</h1>
    <br><h2>ID        : <%= acc.getId()%></h2>
    <br><h2>USERNAME  : <%= acc.getUsername()%></h2>
    <br><h2>PASSWORD  : <%= acc.getPassword()%></h2>
    <br><h2>FULL NAME : <%= acc.getFullname()%></h2>
    <br><h2>ADDRESS   : <%= acc.getAddress()%></h2>
    <br><h2>AVATAR    : <%= acc.getAvatar()%></h2>
</body>
</html>
