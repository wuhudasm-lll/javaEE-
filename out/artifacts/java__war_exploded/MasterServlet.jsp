<!doctype html>
<html lang="en">
<head>
    <title>电影馆管理系统</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- VENDOR CSS -->
    <link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/style1.css">
</head>

<body>
<div id="loading">
    <div></div>
    <div></div>
    <span></span>
</div>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand"> <a href="MasterServlet.jsp"><img src="img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a> </div>
        <div class="container-fluid">
            <div class="navbar-btn" style="padding: 0; padding-top: 10px;">
                <button type="button" class="btn-toggle-fullwidth btn-toggle-mx"><img src="img/left.png" height="40px" alt=""></button>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!--_________________________________________________________________________________________-->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="link/user/index.jsp" target="_blank" class="iframe_link active"><span>用户信息</span></a></li>
                    <li><a href="link/movie/index.jsp" target="_blank" class="iframe_link"><span>电影信息</span></a></li>
                    <li>
                        <a href="javascript:;" class="nav-togg"> <span>帮助</span> </a>
                        <div>
                            <ul>
                                <li><a href="#" ><span>关于我们</span></a></li>
                                <a href="master.jsp" ><li><span>退出登录</span></a></li></a>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="main">
        <div class="main-content" style="height: 100%;">
            <iframe src="link/user/index.jsp" class="iframe_mx uicss-cn"></iframe>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/klorofil-common.js" ></script>

</body>
</html>