
<%@ page import="java.util.List" %>
<%@ page import="entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/5/2018
  Time: 8:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accounts</title>
</head>
<body>
<ul>
    <% for (Account acc:(List<Account>) request.getAttribute("accounts")) { %>
    <li>
        <%= acc.getId()%> -
        <%= acc.getUsername()%> -
        <%= acc.getPassword()%> -
        <%= acc.getFullname()%> -
        <%= acc.getAvatar()%>
    </li>
    <% } %>
</ul>

<div style="display: inline-block">
    <a <%= (int) request.getAttribute("page") != 1 ? "href=./accounts?page=" + ((int)request.getAttribute("page") - 1) + "&limit=" + request.getAttribute("limit") : ""%>> Previous</a>

    <% for (int i = 1; i <= (int) request.getAttribute("totalPage") ; i++) {
        if (i == (int) request.getAttribute("page")) {%>
            <span><%=i%></span>
    <%} else {%>
            <a href=<%= "./accounts?page=" + i + "&limit=" + request.getAttribute("limit")%>><%=i%></a>
    <%}}%>

    <a <%= (int)request.getAttribute("page") != (int) request.getAttribute("totalPage") ? "href=./accounts?page=" + ((int)request.getAttribute("page") + 1) + "&limit=" + request.getAttribute("limit") : ""%>> Next</a>
</div>

</body>
</html>
