<%@ page import="entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: tienb
  Date: 05/05/2018
  Time: 3:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) request.getAttribute("account");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Bạn đã đăng ký thành công với tài khoản </h1>
<h2>Username : <%= account.getUsername()%></h2>
<br><h2>Password : <%= account.getPassword()%></h2>
<br><h2>Full Name : <%= account.getFullname()%></h2>
<br><h2>Address : <%= account.getAddress()%></h2>
</body>
</html>

