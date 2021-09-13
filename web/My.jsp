<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>我的</title>
    <link rel="icon" href="favicons/1.png">

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
    <style>
        .round_icon{
            width: 50px;
            height: 50px;
            display: flex;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: fixed;
            right: 400px;
            top: 20px;
        }
        .round_icon1{
            width: 190px;
            height: 190px;
            display: flex;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: fixed;
            left: 250px;
            top: 140px;
        }
        .login{
            font-family: 宋体;
        }
    </style>
</head>
<body>

<header class="header">
    <div class="header-container">
        <div class="header-top">
            <a href="#" class="logo"></a>
            <nav class="header-nav">
                <ul>
                    <li><a href="index1.jsp" class="header-nav__cur">电影馆</a></li>
                    <li><a href="#">我的电影</a></li>
                    <li><a href="#">下载客户端</a></li>
                    <li><a href="#">VIP</a></li>
                </ul>
            </nav>
            <div class="header-search">
                <input type="text" class="text" placeholder="here...">
                <div class="btn"><i class="icon-sprite"></i></div>
                <div class="result">
                    <a href="#" class="result-item">
                        <span class="rank">1</span>
                        <span class="title">默</span>
                        <span class="num">3.4万</span>
                    </a>
                    <a href="#" class="result-item">
                        <span class="rank">2</span>
                        <span class="title">侧田</span>
                        <span class="num">3.4万</span>
                    </a>
                    <a href="#" class="result-item">
                        <span class="rank">3</span>
                        <span class="title">让我留在你身边</span>
                        <span class="num">3.4万</span>
                    </a>
                    <a href="#" class="result-item">
                        <span class="rank">4</span>
                        <span class="title">皮皮虾我们走</span>
                        <span class="num">3.4万</span>
                    </a>
                    <a href="#" class="result-item">
                        <span class="rank">5</span>
                        <span class="title">欢乐好声音</span>
                        <span class="num">3.4万</span>
                    </a>
                    <div class="history">
                        <span>搜索历史</span>
                        <i class="icon-sprite"></i>
                    </div>
                </div>
            </div>
            <div class="header-login">
                <a href="#" class="login" style="font-size: 25px;position: fixed;right: 445px;top: 23px;">${sessionScope.username}</a>
                <a href="#" class="login"><img src="Touxiang.jpeg" class="round_icon" alt=""></a>
            </div>
        </div>
        <ul class="header-subNav">
            <li><a href="index1.jsp">首页</a></li>
            <li><a href="#">电影</a></li>
            <li><a href="#">放映厅</a></li>
            <li><a href="#">排行榜</a></li>
            <li><a href="MyBuy.jsp">我的订单</a></li>
            <li><a href="My.jsp" class="subNav-cur">我的</a></li>
        </ul>
    </div>
    <div>
        <a href="#" class="login"><img src="Touxiang.jpeg" class="round_icon1" alt=""></a>
        <a href="My.jsp" class="login" style="font-size: 40px;font-family:宋体;position: fixed;left: 320px;top: 330px;">${sessionScope.username}</a>
    </div>
    <div>
        <a href="#" style="position: fixed;left: 295px;top: 395px;font-size: 20px">我的电影史</a>
        <div style="border:1px solid #CCC;width: 95px;position: fixed;left: 299px;top: 430px;"></div>
        <a href="#" style="position: fixed;left: 304px;top: 445px;font-size: 20px">我的预购</a>
        <div style="border:1px solid #CCC;width: 95px;position: fixed;left: 299px;top: 480px;"></div>
        <a href="XiuGai.jsp" style="position: fixed;left: 304px;top: 495px;font-size: 20px">修改密码</a>
        <div style="border:1px solid #CCC;width: 95px;position: fixed;left: 299px;top: 530px;"></div>
        <a href="login.jsp" style="position: fixed;left: 304px;top: 545px;font-size: 20px">退出登录</a>
    </div>
</header>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/script.js"></script>

</body>
</html>