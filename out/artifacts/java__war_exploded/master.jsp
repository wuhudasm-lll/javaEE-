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
    <title>管理员登录</title>
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

<h1>管理员登录</h1>
<div class="login-form">
    <a href="index.jsp"><div class="close" > </div></a>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar"><a href="login.jsp"><img src="images/avtar.png" /></a></div>
    <form action="MasterServlet" method="post">
        <input type="text" class="text" name="username" required="required" placeholder="请输入管理员账号"  >
        <div class="key"><input type="password" name="password" placeholder="请输入管理员密码" ></div>
        <div class="signin"><input type="submit" value="Login" ></div>
    </form>
</div>

</body>
</html>
