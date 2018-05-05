<%--
  Created by IntelliJ IDEA.
  User: tienb
  Date: 05/05/2018
  Time: 2:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAE REGISTER</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
<div class="register-photo" style="height:650px;">
    <div class="form-container">
        <div class="image-holder"></div>
        <form method="post" action="/user/register">
            <h2 class="text-center"><strong>Create</strong> an Account</h2>
            <div class="form-group"><input class="form-control" type="username" name="username" placeholder="Username"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <div class="form-group"><input class="form-control" type="password" name="password-repeat" placeholder="Password (repeat)"></div>
            <div class="form-group"><input class="form-control" type="fullname" name="fullname" placeholder="Full Name"></div>
            <div class="form-group"><input class="form-control" type="address" name="address" placeholder="Address"></div>
            <div class="form-group"><input class="form-control" type="avatar" name="avatar" placeholder="Avatar"></div>
            <div class="form-group">
                <div class="form-check"><label class="form-check-label"><input class="form-check-input" type="checkbox">I agree to the license terms.</label></div>
            </div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Sign Up</button></div><a href="#" class="already">You already have an entity.account? Login here.</a></form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
