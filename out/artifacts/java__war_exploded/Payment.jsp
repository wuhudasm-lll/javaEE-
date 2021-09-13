<%--
  Created by IntelliJ IDEA.
  User: 余
  Date: 2021/6/5
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付</title>
    <link rel="stylesheet" type="text/css" href="css/jq22.css" />
    <style type="text/css">
        .booking_area p{line-height:40px; font-size:20px; color:#999}
        .booking_area p span{color:#666}
        #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
    </style>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<script>
    var getState = sessionStorage.getItem('test1');
    var getnum = sessionStorage.getItem('test');
    var getname = sessionStorage.getItem('moviename');
    var getprice = sessionStorage.getItem('movieprice');

    var num = parseInt(getprice);
    var totle = getnum*num;
    $(function () {
        $('#moviename').html(getname);
        $('#tick').html(getState);
        $('#number').html(getnum);
        $('#totle').html(totle);
    });
</script>
<div class="container">
    <h2 class="title" style="text-align: center"><a href="http://www.jq22.com/jquery-info2692">电影馆出品</a></h2>
    <div style="margin-top:0px" align="center">
        <img src="abominable.jpg" alt="">
    </div>
    <div class="booking_area" style="padding-left: 150px;padding-top: 10px">
        <p>电影：<span id="moviename"></span></p>
        <p>时间：06月5日 22:15</p>
        <p>座位：</p>
        <span id="tick" style="font-size: 25px"></span>
        <p>票数：<span id="number">0</span>&nbsp;&nbsp;张</p>
        <p>总价：<b>￥<span id="totle">0</span></b></p>
        <a href="MyBuy.jsp"><input id="Buy_tk" type="button" style="width: 120px;height: 40px;" class="btn" value="确定购买"/></a>
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
        <a href="BuyTk.jsp"><input type="button" style="width: 120px;height: 40px;" class="btn" value="取消购买"/></a>
    </div>
</div>
<script>
    $('#Buy_tk').click(function (){
        var seats = sessionStorage.getItem('seats');
        var getuser = sessionStorage.getItem('username111');
        $.ajax({
            url:"${pageContext.request.contextPath}/buyTkServlet",
            type:"POST",
            dataType:"text",
            data:{ 'moviename':getname,'seat':getState,'num':getnum,'totle':totle,'username':getuser},
            success:function (data) {
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/ChangeSeatsServlet",
            type:"POST",
            dataType:"text",
            data:{ 'seats':seats,'getseats':getState},
            success:function (data) {
            }
        });
   });
</script>

</body>
</html>
