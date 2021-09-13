        <%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.*" %>
        <%@ page import="java.util.ArrayList" %>

        <!DOCTYPE html>
<html lang="en">
<head>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <title>首页</title>
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
    .login{
      font-family: 宋体;
    }
  </style>
</head>
<body>
<%
  //此进行连接数据库
  String url = "jdbc:mysql://localhost:3306/movie?useSSL=false"; //test为数据库名称
  String dbuser = "root"; //数据库账户
  String dbpwd = ""; //数据库密码
  try {
    Class.forName("com.mysql.jdbc.Driver"); //加载驱动 JspStudy
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
%>
<header class="header">
  <div class="header-container">
    <div class="header-top">
      <a href="#" class="logo"></a>
      <nav class="header-nav">
        <ul>
          <li><a href="#" class="header-nav__cur">电影馆</a></li>
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
            <span class="title">战狼</span>
            <span class="num">3.4万</span>
          </a>
          <a href="#" class="result-item">
            <span class="rank">2</span>
            <span class="title">复仇者联盟</span>
            <span class="num">3.4万</span>
          </a>
          <a href="#" class="result-item">
            <span class="rank">3</span>
            <span class="title">流浪地球</span>
            <span class="num">3.4万</span>
          </a>
          <a href="#" class="result-item">
            <span class="rank">4</span>
            <span class="title">动物世界</span>
            <span class="num">3.4万</span>
          </a>
          <a href="#" class="result-item">
            <span class="rank">5</span>
            <span class="title">头号玩家</span>
            <span class="num">3.4万</span>
          </a>
          <div class="history">
            <span>搜索历史</span>
            <i class="icon-sprite"></i>
          </div>
        </div>
      </div>
      <div class="header-login">
        <a id="username" href="My.jsp" class="login" style="font-size: 25px;position: fixed;right: 445px;top: 23px;">${sessionScope.username}</a>
        <a href="My.jsp" class="login"><img src="Touxiang.jpeg" class="round_icon" alt=""></a>
      </div>
    </div>
    <ul class="header-subNav">
      <li><a href="#" class="subNav-cur">首页</a></li>
      <li><a href="#">电影</a></li>
      <li><a href="#">放映厅</a></li>
      <li><a href="#">排行榜</a></li>
      <li><a href="MyBuy.jsp">我的订单</a></li>
      <li><a href="My.jsp">我的</a></li>
    </ul>
  </div>
</header>

<!-- 新歌首发 -->
<div class="main" id="newSong">
  <div class="main-inner">
    <div class="main-title">
      <span class="line line-left"></span>
      <span class="line line-right"></span>
      <h1 style="color:snow;font-size: 50px; position: fixed;right: 750px;top: 220px;">电影首发</h1>
    </div>

    <a href="#" class="readAll">全部<i class="icon-sprite"></i></a>
    <div class="main-tab tab-title">
      <a href="javascript:;" class="item item-cur">全部</a>
      <a href="javascript:;" class="item">华语</a>
      <a href="javascript:;" class="item">欧美</a>
      <a href="javascript:;" class="item">韩国</a>
      <a href="javascript:;" class="item">日本</a>
    </div>
    <%
      //取得数据库连接conn
      Connection conn = DriverManager.getConnection(url, dbuser, dbpwd);
      PreparedStatement ps = null;
      ResultSet rs = null;
      ArrayList<String> list =new ArrayList<>();
      ArrayList<String> listpr =new ArrayList<>();
      //声明数据库字段
      try {
        String sql = "select * from getmovie where onto = '是'";
        ps = (PreparedStatement) conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
          list.add(rs.getString("moviename"));
          listpr.add(rs.getString("price"));
        }
      } catch (SQLException e) {
        e.printStackTrace();
      } finally {
        try {
          if (rs != null)
            rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        } finally {
          try {
            if (ps != null)
              ps.close();
          } catch (SQLException e) {
            e.printStackTrace();
          } finally {
            try {
              if (conn != null)
                conn.close();
            } catch (SQLException e) {
              e.printStackTrace();
            }
          }
        }
      }

    %>
    <div class="main-slider tab-cont" id="show_body">
      <ul class="slider-wrapper">
        <li>
          <a href="BuyTk.jsp" onclick="img1()" class="img">
            <img  src="images/cont/slider_img1.jpg" alt="#">
            <span id="img" class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info" >
            <div class="title">
              <%
                out.println("<a onclick=\"name1()\" href=\"BuyTk.jsp\" id=\"name1\" name=\"movie\">" + list.get(0) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price1()\" href=\"BuyTk.jsp\" id=\"movieprice1\" class=\"author\">" + listpr.get(0) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img2()" class="img">
            <img src="images/cont/slider_img2.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name2()\" href=\"BuyTk.jsp\" id=\"name2\">" + list.get(1) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price2()\" href=\"BuyTk.jsp\" id=\"movieprice2\" class=\"author\" >" + listpr.get(1) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img3()" class="img">
            <img src="images/cont/slider_img3.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name3()\" href=\"BuyTk.jsp\" id=\"name3\">" + list.get(2) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price3()\" href=\"BuyTk.jsp\" id=\"movieprice3\"  class=\"author\">" + listpr.get(2) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img4()" class="img">
            <img src="images/cont/slider_img4.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name4()\"  href=\"BuyTk.jsp\" id=\"name4\">" + list.get(3) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price4()\" href=\"BuyTk.jsp\" id=\"movieprice4\"  class=\"author\">" + listpr.get(3) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img5()" class="img">
            <img src="images/cont/slider_img1.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name5()\" href=\"BuyTk.jsp\" id=\"name5\">" + list.get(4) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price5()\" href=\"BuyTk.jsp\" id=\"movieprice5\" class=\"author\">" + listpr.get(4) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img6()" class="img">
            <img src="images/cont/slider_img2.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name6()\" href=\"BuyTk.jsp\" id=\"name6\">" + list.get(5) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price6()\" href=\"BuyTk.jsp\" id=\"movieprice6\" class=\"author\">" + listpr.get(5) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img7()" class="img">
            <img src="images/cont/slider_img3.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name7()\" href=\"BuyTk.jsp\" id=\"name7\">" + list.get(6) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price7()\" href=\"BuyTk.jsp\" id=\"movieprice7\" class=\"author\">" + listpr.get(6) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img8()" class="img">
            <img src="images/cont/slider_img4.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name8()\" href=\"BuyTk.jsp\" id=\"name8\">" + list.get(7) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price8()\" href=\"BuyTk.jsp\" id=\"movieprice8\" class=\"author\">" + listpr.get(7) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img9()" class="img">
            <img src="images/cont/slider_img1.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name9()\" href=\"BuyTk.jsp\" id=\"name9\">" + list.get(8) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price9()\" href=\"BuyTk.jsp\" id=\"movieprice9\" class=\"author\">" + listpr.get(8) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img10()" class="img">
            <img src="images/cont/slider_img2.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name10()\" href=\"BuyTk.jsp\" id=\"name10\">" + list.get(9) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price10()\" href=\"BuyTk.jsp\" id=\"movieprice10\" class=\"author\">" + listpr.get(9) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img11()" class="img">
            <img src="images/cont/slider_img3.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name11()\" href=\"BuyTk.jsp\" id=\"name11\">" + list.get(10) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price11()\"  href=\"BuyTk.jsp\" id=\"movieprice11\" class=\"author\">" + listpr.get(10) + "元/张</a>");
            %>
          </div>
        </li>
        <li>
          <a href="BuyTk.jsp" onclick="img12()" class="img">
            <img src="images/cont/slider_img4.jpg" alt="#">
            <span class="mask"></span>
            <i class="icon-play"></i>
          </a>
          <div class="info">
            <div class="title">
              <%
                out.println("<a onclick=\"name12()\" href=\"BuyTk.jsp\" id=\"name12\">" + list.get(11) + "</a>");
              %>
              <i class="icon-sprite"></i>
            </div>
            <%
              out.println("<a onclick=\"price12()\" href=\"BuyTk.jsp\" id=\"movieprice12\" class=\"author\">" + listpr.get(11) + "元/张</a>");
            %>
          </div>
        </li>
      </ul>
      <div class="slider-btns">
        <span class="cur"><i></i></span>
        <span><i></i></span>
        <span><i></i></span>
      </div>
    </div>
  </div>
  <div class="main-operate">
    <a href="javascript:;" class="slider-prev"><i class="icon-sprite"></i></a>
    <a href="javascript:;" class="slider-next"><i class="icon-sprite"></i></a>
  </div>
</div>
<script>
  function img1(){
    sessionStorage.setItem("moviename",document.getElementById("name1").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice1").innerText);
    sessionStorage.setItem("seats","seats");
    sessionStorage.setItem("seats1","seats");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats"},
      success:function (data) {
      }
    });
  };
  function name1(){
    sessionStorage.setItem("moviename",document.getElementById("name1").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice1").innerText);
    sessionStorage.setItem("seats","seats");
    sessionStorage.setItem("seats1","seats");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats"},
      success:function (data) {
      }
    });
  };
  function price1(){
    sessionStorage.setItem("moviename",document.getElementById("name1").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice1").innerText);
    sessionStorage.setItem("seats","seats");
    sessionStorage.setItem("seats1","seats");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats"},
      success:function (data) {
      }
    });
  };
  function img2(){
    sessionStorage.setItem("moviename",document.getElementById("name2").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice2").innerText);
    sessionStorage.setItem("seats","seats2");
    sessionStorage.setItem("seats1","seats2");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats2"},
      success:function (data) {
      }
    });
  };
  function name2(){
    sessionStorage.setItem("moviename",document.getElementById("name2").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice2").innerText);
    sessionStorage.setItem("seats","seats2");
    sessionStorage.setItem("seats1","seats2");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats2"},
      success:function (data) {
      }
    });
  };
  function price2(){
    sessionStorage.setItem("moviename",document.getElementById("name2").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice2").innerText);
    sessionStorage.setItem("seats","seats2");
    sessionStorage.setItem("seats1","seats2");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats2"},
      success:function (data) {
      }
    });
  };
  function img3(){
    sessionStorage.setItem("moviename",document.getElementById("name3").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice3").innerText);
    sessionStorage.setItem("seats","seats3");
    sessionStorage.setItem("seats1","seats3");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats3"},
      success:function (data) {
      }
    });
  };
  function name3(){
    sessionStorage.setItem("moviename",document.getElementById("name3").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice3").innerText);
    sessionStorage.setItem("seats","seats3");
    sessionStorage.setItem("seats1","seats3");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats3"},
      success:function (data) {
      }
    });
  };
  function price3(){
    sessionStorage.setItem("moviename",document.getElementById("name3").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice3").innerText);
    sessionStorage.setItem("seats","seats3");
    sessionStorage.setItem("seats1","seats3");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats3"},
      success:function (data) {
      }
    });
  };
  function img4(){
    sessionStorage.setItem("moviename",document.getElementById("name4").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice4").innerText);
    sessionStorage.setItem("seats","seats4");
    sessionStorage.setItem("seats1","seats4");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats4"},
      success:function (data) {
      }
    });
  };
  function name4(){
    sessionStorage.setItem("moviename",document.getElementById("name4").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice4").innerText);
    sessionStorage.setItem("seats","seats4");
    sessionStorage.setItem("seats1","seats4");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats4"},
      success:function (data) {
      }
    });
  };
  function price4(){
    sessionStorage.setItem("moviename",document.getElementById("name4").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice4").innerText);
    sessionStorage.setItem("seats","seats4");
    sessionStorage.setItem("seats1","seats4");
    $.ajax({
      url:"${pageContext.request.contextPath}/GetSeatsServlet",
      type:"POST",
      dataType:"text",
      data:{ 'getseats':"seats4"},
      success:function (data) {
      }
    });
  };
  function img5(){
    sessionStorage.setItem("moviename",document.getElementById("name5").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice5").innerText);
  };
  function name5(){
    sessionStorage.setItem("moviename",document.getElementById("name5").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice5").innerText);
  };
  function price5(){
    sessionStorage.setItem("moviename",document.getElementById("name5").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice5").innerText);
  };
  function img6(){
    sessionStorage.setItem("moviename",document.getElementById("name6").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice6").innerText);
  };
  function name6(){
    sessionStorage.setItem("moviename",document.getElementById("name6").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice6").innerText);
  };
  function price6(){
    sessionStorage.setItem("moviename",document.getElementById("name6").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice6").innerText);
  };
  function img7(){
    sessionStorage.setItem("moviename",document.getElementById("name7").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice7").innerText);
  };
  function name7(){
    sessionStorage.setItem("moviename",document.getElementById("name7").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice7").innerText);
  };
  function price7(){
    sessionStorage.setItem("moviename",document.getElementById("name7").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice7").innerText);
  };
  function img8(){
    sessionStorage.setItem("moviename",document.getElementById("name8").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice8").innerText);
  };
  function name8(){
    sessionStorage.setItem("moviename",document.getElementById("name8").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice8").innerText);
  };
  function price8(){
    sessionStorage.setItem("moviename",document.getElementById("name8").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice8").innerText);
  };
  function img9(){
    sessionStorage.setItem("moviename",document.getElementById("name9").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice9").innerText);
  };
  function name9(){
    sessionStorage.setItem("moviename",document.getElementById("name9").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice9").innerText);
  };
  function price9(){
    sessionStorage.setItem("moviename",document.getElementById("name9").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice9").innerText);
  };
  function img10(){
    sessionStorage.setItem("moviename",document.getElementById("name10").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice10").innerText);
  };
  function name10(){
    sessionStorage.setItem("moviename",document.getElementById("name10").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice10").innerText);
  };
  function price10(){
    sessionStorage.setItem("moviename",document.getElementById("name10").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice10").innerText);
  };
  function img11(){
    sessionStorage.setItem("moviename",document.getElementById("name11").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice11").innerText);
  };
  function name11(){
    sessionStorage.setItem("moviename",document.getElementById("name11").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice11").innerText);
  };
  function price11(){
    sessionStorage.setItem("moviename",document.getElementById("name11").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice11").innerText);
  };
  function img12(){
    sessionStorage.setItem("moviename",document.getElementById("name12").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice12").innerText);
  };
  function name12(){
    sessionStorage.setItem("moviename",document.getElementById("name12").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice12").innerText);
  };
  function price12(){
    sessionStorage.setItem("moviename",document.getElementById("name12").innerText);
    sessionStorage.setItem("movieprice",document.getElementById("movieprice12").innerText);
  };
</script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/script.js"></script>

</body>
</html>