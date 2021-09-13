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
    <title>账号注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <meta name="keywords"
          content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>
<script>$(document).ready(function (c) {
    $('.close').on('click', function (c) {
        $('.login-form').fadeOut('slow', function (c) {
            $('.login-form').remove();
        });
    });
});
</script>
<script>
    $(function () {
         $("#username").blur(function () {//失去焦点事件
             //发送ajax

             $.ajax({
                 url:"${pageContext.request.contextPath}/servletJqAjax",
                 type:"POST",
                 data:{"username":$("#username").val()},
                 dataType:"json",
                 success:function (data) {
                     if (data != true) {
                         $("span").html("!");
                         alert("用户名已存在");
                         $("#button_id").attr('disabled', true);
                     }else {
                         $("#button_id").attr('disabled', false);
                         $("span").html("");
                     }
                 }
             });
         });
    });
</script>


<h1>账号注册</h1>
<div class="login-form">
    <a href="login.jsp">
        <div class="close"></div>
    </a>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"></div>
    <div class="avtar"><img src="images/avtar.png"/></div>
    <form action="registServlet" method="post">
        <div class="key1"><input type="text" required="required" class="text" id="username" name="username" placeholder="设置账号名"><span style="color: red;font-size: 28px;"></span></div>
        <div class="key"><input type="password" required="required" name="password" placeholder="设置密码"><span style="color:  #2b2b36;font-size: 28px;">.</span></div>
        <div class="signin"><input id="button_id" type="submit" value="注册"></div>
    </form>
</div>

</body>
</html>
