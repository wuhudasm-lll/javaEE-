<%--
  Created by IntelliJ IDEA.
  User: 余
  Date: 2021/5/31
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <style type="text/css">
        div img {
            position:absolute;
            left:0;
            right:0;
            bottom:0;
            margin:auto;
            width:100%;
            height:100%;
            z-index:-1;
        }
        h4{
            padding-top:280px;
            font-family: "宋体";
            font-size: 70px;
            margin-bottom: 0;
        }
        h2{
            font-family: "宋体";
        }
        div h3{
            font-family: "宋体";
            width: 150px;
            border: 1px solid #0E0D0D;
            border-radius: 5px;
            font-size: 30px;
        }
        a:link{ text-decoration: none;}
        div h3:hover{
            font-family: "宋体";
            width: 150px;
            border: 1px solid #0E0D0D;
            border-radius: 5px;
            font-size: 31px; }
    </style>
</head>
<body>
<div align="center">
    <h4  align="center" style="color:#000000">登录失败</h4>
    <h2  align="center" style="color:#343030">账号或密码错误</h2>
    <p ><img src="bg_xnet_wps.jpg" alt="null"></p>
    <a href="login.jsp"><h3 style="color: #221F20" >重新登录</h3></a>
</div>

</body>
</html>

