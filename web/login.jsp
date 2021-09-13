<%--
  Created by IntelliJ IDEA.
  User: 余
  Date: 2021/5/31
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>电影院购票</title>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />

    <link href="css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery.min.js"></script>

</head>
<body>
<script>$(document).ready(function(c) {
    $('.close').on('click', function(c){
        $('.login-form').fadeOut('slow', function(c){
            $('.login-form').remove();
        });
    });
});
</script>

<h1>进入前请先登录</h1>
<div class="login-form">
    <a href="index.jsp"><div class="close" > </div></a>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar"><a href="master.jsp"><img src="images/avtar.png" /></a></div>
    <form action="UserServlet" method="post">
        <input type="text" required="required" id="username" class="text" name="username" placeholder="请输入账号名">
        <div class="key"><input type="password" required="required" name="password" placeholder="请输入密码"  ></div>
        <div class="signin"><input type="submit" id="login" value="Login" ></div>
    </form>
</div>
<div align="center">
    <a href="register.jsp" style="display:inline-block;color:aliceblue;font-size: 18px;">注册账号&nbsp;&gt;</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="reback.jsp" style="display:inline-block;color:aliceblue;font-size: 18px;">找回密码&nbsp;&gt;</a>
</div>
<script>
    $('#login').click(function () {
        sessionStorage.setItem("username111", $("#username").val());
    });
</script>
</body>
</html>
