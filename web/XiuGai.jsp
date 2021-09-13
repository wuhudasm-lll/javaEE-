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

    <title>密码找回</title>
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

<h1>修改密码</h1>
<div class="login-form">
    <a href="login.jsp"><div class="close" > </div></a>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar"><img src="images/avtar.png" /></div>
    <form action="rebackServlet" method="post">
        <input type="text" required="required"  class="text" name="username" placeholder="账号名"  >
        <div class="key"><input type="password" required="required" name="password" placeholder="设置新的密码" ></div>
        <div class="signin"><input type="submit" value="修改" ></div>
    </form>
</div>
<div class="copy-rights">
    <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.php.cn/">php中文网</a></p>
</div>

</body>
</html>
