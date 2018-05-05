<%@ page import="java.util.HashMap" %>
<%@ page import="entity.Account" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: tienb
  Date: 05/05/2018
  Time: 2:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    HashMap<String, String> errs;
    HashMap<String, String> valueField;

    String errUsername = "", errPassword = "", errFullname = "", errAddress = "";
    String valueUsername = "", valuePassword = "", valueFullname = "", valueAddress = "";

    try {
        errs = (HashMap<String, String>) request.getAttribute("maperr");
        valueField = (HashMap<String, String>) request.getAttribute("valuefields");
        errUsername = errs.get("username");
        errPassword = errs.get("password");
        errFullname = errs.get("fullname");
        errAddress = errs.get("address");
        valueUsername = valueField.get("usernameValue");
        valuePassword = valueField.get("passwordValue");
        valueFullname = valueField.get("fullnameValue");
        valueAddress = valueField.get("addressValue");

    } catch (Exception e) {
        System.out.println("map rong");
    }

%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAE REGISTER</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/cssRegister.css">
</head>

<body>
<div class="register-photo" style="height:650px;">
    <div class="form-container">
        <div class="image-holder" id="avatar-demo"></div>
        <form method="post" action="/user/register" name="registerForm">
            <h2 class="text-center"><strong>Create</strong> an Account</h2>

            <div class="form-group"><input class="form-control" type="username" name="username" placeholder="Username" value="<%=valueUsername%>">
            </div>
            <div class="form-group"><p><%= errUsername%>
            </p></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" value="<%=valuePassword%>">
            </div>
            <div class="form-group"><p><%= errPassword%>
            </p></div>
            <div class="form-group"><input class="form-control" type="password" name="password-repeat"
                                           placeholder="Password (repeat)"></div>
            <div class="form-group"><input class="form-control" type="fullname" name="fullname" placeholder="Full Name" value="<%=valueFullname%>">
            </div>
            <div class="form-group"><p><%= errFullname%>
            </p></div>
            <div class="form-group"><input class="form-control" type="address" name="address" placeholder="Address" value="<%=valueAddress%>">
            </div>
            <div class="form-group"><p><%= errAddress%>
            </p></div>

            <div class="form-group">
                <input class="form-control" type="avatar" name="avatar" placeholder="Avatar" style="display: none;">
            </div>
            <div class="form-group">
              <input class="form-control" type="file" id="img-file">
            </div>
            <div class="form-group">
                <div class="form-check"><label class="form-check-label"><input class="form-check-input" type="checkbox">I
                    agree to the license terms.</label></div>
            </div>

            <div class="form-group">
              <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
            </div>
            <a href="/user/login" class="already">You already have an entity.account? Login here.</a>
      </form>

    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
<script>

    var UPLOAD_IMG_URL = "";
    function getUploadImgUrl() {
        const req = new XMLHttpRequest();
        req.open("GET", "../upload/imgs");
        req.onload = function (ev) {
            UPLOAD_IMG_URL = ev.currentTarget.responseText;
        };
        req.onerror = function (ev) {
            console.log(ev);
        };
        req.send();
    }

    getUploadImgUrl();
    
    document.getElementById("img-file").onchange = function (ev) {
       var form = new FormData();
       form.append("myImg", ev.target.files[0]);

       if (UPLOAD_IMG_URL != "")  {
           const req = new XMLHttpRequest();
           console.log(UPLOAD_IMG_URL);
           req.open("POST", UPLOAD_IMG_URL);
           req.onload = function (res) {
               document.forms["registerForm"]["avatar"].value = res.currentTarget.responseText;
               document.getElementById("avatar-demo").style.backgroundImage = "url(" + res.currentTarget.responseText + ")";
               document.getElementById("img-file").setAttribute("disabled", "disabled");
           };
           req.onerror = function (res) {
               console.log(res);
               alert("Error! Please check log!")
           };

           req.send(form);
       }
       else {
           alert("Can not upload img! Because the url is invalid!")
       }

    };

</script>
</body>

</html>
