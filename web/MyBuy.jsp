<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.company.Mysql.DButil" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Demo</title>
    <link rel="icon" href="favicons/1.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
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
        .btn1{-webkit-border-radius:3px;-moz-border-radius:3px;-ms-border-radius:3px;-o-border-radius:3px;border-radius:3px;
            background-color: #ff8400;color: #fff;display: inline-block;height: 28px;line-height: 28px;text-align: center;
            width: 72px;transition: background-color 0.2s linear 0s;border:none;cursor:pointer;}
        .btn1:hover{background-color: #e95a00;text-decoration: none}
    </style>
</head>
<body>
<%
    //此进行连接数据库
    String url="jdbc:mysql://localhost:3306/movie?useSSL=false"; //test为数据库名称
    String dbuser="root"; //数据库账户
    String dbpwd=""; //数据库密码
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); //加载驱动 JspStudy
    }
    catch (ClassNotFoundException e)
    {
        e.printStackTrace();
    }
%>
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
                <a href="My.jsp" class="login" style="font-size: 25px;position: fixed;right: 445px;top: 23px;">${sessionScope.username}</a>
                <a href="My.jsp" class="login"><img src="Touxiang.jpeg" class="round_icon" alt=""></a>
            </div>
        </div>
        <ul class="header-subNav">
            <li><a href="index1.jsp">首页</a></li>
            <li><a href="#">电影</a></li>
            <li><a href="#">放映厅</a></li>
            <li><a href="#">排行榜</a></li>
            <li><a href="MyBuy.jsp" class="subNav-cur">我的订单</a></li>
            <li><a href="My.jsp">我的</a></li>
        </ul>
    </div>
    <table id="tb1" class="table1" style="width:700px; min-height:250px; margin:5px auto 0 auto; border:2px solid #d3d3d3; background:#fff; -moz-border-radius:6px;-khtml-border-radius: 5px;-webkit-border-radius: 5px; border-radius:5px;">
        <tbody id="show_body">
        <%
            //取得数据库连接conn
            Connection conn= DriverManager.getConnection(url, dbuser, dbpwd);;
            PreparedStatement ps=null;
            ResultSet rs=null;
            //声明数据库字段
            int id=0;
            String moviename="";
            String seat="";
            String num="";
            String totle="";
            ResultSet tableRS = null;
            HttpSession session1 = request.getSession();
            String getuser = (String) session1.getAttribute("username1");
            try
            {
                conn = DButil.getConnection();
                DatabaseMetaData dbmd=conn.getMetaData();
                tableRS = dbmd.getTables(null, null,  getuser, null );
                if (tableRS.next()){
                    String sql="select * from "+getuser+" ";
                    ps = (PreparedStatement) conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while(rs.next())
                    {
                        id = id+1;
                        moviename=rs.getString("moviename");
                        seat=rs.getString("seat");
                        num=rs.getString("num");
                        totle=rs.getString("totle");
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<img src=\"abominable.png\">");
                        out.println("</td>");
                        out.println("<td style=\"position:relative;top:-100px;left: -10px;font-size: 25px\" id=\"Tk\" >电影:"+moviename+"</td>");
                        out.println("<td>");
                        out.println("<p style=\"position:relative;top:10px;left: -252px;font-size: 22px\">时间:06月5日 22:15</p>");
                        out.println("<p style=\"position:relative;top:25px;left: -252px;font-size: 22px\">座位:"+seat+"</p>");
                        out.println("<p style=\"position:relative;top:35px;left: -252px;font-size: 22px\">票数:"+num+"张</p>");
                        out.println("<p style=\"position:relative;top:45px;left: -252px;font-size: 22px\">总价:"+totle+"元</p>");
                        out.println("<a id= \"remove\" class=\"remove\" ><input type=\"button\" value=\"取消订单\"style=\"width: 120px;height: 40px;position:relative;top:10px;right: -100px\" class=\"btn1\"></a>");
                        out.println("<a id= \"back\" class=\"back\"><input type=\"button\" value=\"再次预定\"style=\"width: 120px;height: 40px;position:relative;top:30px;right: -100px\" class=\"btn1\"> </a>");
                        out.println("</td>");

                        out.println("</tr>");
                    }
                }
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            finally
            {
                try
                {
                    if(rs!=null)
                        rs.close();
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                }
                finally
                {
                    try
                    {
                        if(ps!=null)
                            ps.close();
                    }
                    catch (SQLException e)
                    {
                        e.printStackTrace();
                    }
                    finally
                    {
                        try
                        {
                            if(conn!=null)
                                conn.close();
                        }
                        catch (SQLException e)
                        {
                            e.printStackTrace();
                        }
                    }
                }
            }

        %>
        </tbody>
    </table>
</header>
<script>
    var getState = sessionStorage.getItem('test1');
    var getnum = sessionStorage.getItem('test');
    var getname = sessionStorage.getItem('moviename');
    var getprice = sessionStorage.getItem('movieprice');
    var num = parseInt(getprice);
    console.log(getnum);
    console.log(getState);
    var totle = getnum*num;
    $(function () {
        $('#moviename').html(getname);
        $('#tick').html(getState);
        $('#number').html(getnum);
        $('#totle').html(totle);
    });
</script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/script.js"></script>
<script>
    $('#tb1').on('click', '.remove', function () {//失去焦点事件
        var getuser = sessionStorage.getItem('username111');
        var seats = sessionStorage.getItem('seats1');
        //发送ajax
        trIndex = $('.remove', '#show_body').index($(this));
        var tar = $('#show_body tr').eq(trIndex);
        $(this).parents('tr').remove();
        $.ajax({
            url:"${pageContext.request.contextPath}/DelTkServlet",
            type:"POST",
            data:{"moviename":tar.children('td').eq(1).html(),"username":getuser,'seats':seats,'getseats':tar.children('td').children('p').eq(1).html()},
            dataType:"text",
            success:function (data) {

            }
        });
    });
</script>
<script >
    $('#tb1').on('click', '.back', function () {//失去焦点事件
        window.location.href='BuyTk.jsp';
    });
</script>
</body>
</html>