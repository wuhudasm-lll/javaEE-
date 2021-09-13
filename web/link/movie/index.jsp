<%@ page import="com.company.Movie.MovieDao" %>
<%@ page import="com.company.Movie.MovieDaoimpl" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>电影信息管理</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" />
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootbox.min.js"></script>
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
<div class="box">
    <div class="title">电影信息管理</div>
    <div class="content">
        <!--搜索输入框及查询、重置按钮-->
        <div class="container content_width">
            <div class="person_search">
                <div class="search_input">
                    <div class="input-group mb-3">
                        <span>电影名称：</span>
                        <input id="Ktext" type="text" class="form-control" placeholder="请输入名称">
                    </div>
                </div>
                <div class="search_input">
                    <div class="input-group mb-3" hidden>
                        <span>上映时间：</span>
                        <input id="job_num" type="text" class="form-control" placeholder="请输入时间">
                    </div>
                </div>
                <div class="search_input">
                    <button class="btn btn-primary search_btn" type="button" id="search_btn">查询</button>
                    <button class="btn btn-primary search_btn" type="button" id="back_btn">重置</button>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <button class="btn btn-primary search_btn" type="button" id="clearseat1">清空1厅</button>
                    <button class="btn btn-primary search_btn" type="button" id="clearseat2">清空2厅</button>
                    <button class="btn btn-primary search_btn" type="button" id="clearseat3">清空3厅</button>
                    <button class="btn btn-primary search_btn" type="button" id="clearseat4">清空4厅</button>
                </div>
            </div>
            <div class="line"></div>
        </div>
        <!--添加按钮及bootstrap的模态框-->
        <div class="export">
            <button id="new_add" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#renyuan">
                <img src="img/add_two.png"/>
                <span>添加</span>
            </button>
            <div class="modal fade" id="renyuan">
                <div class="modal-dialog modal-lg modal_position">
                    <form action="/movieServlet" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">添加</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <table id="xztb" class="table">
                                <!--新修改弹窗的样式-->
                                <tbody>
                                <tr>
                                    <td class="tb_bg"><label ><font style="font-size: 14px; color: red;">*</font>电影名称</label>
                                    </td>
                                    <td ><input id="moviename" name="moviename" class="userName1" type="text" placeholder="请输入名称"/></td>
                                    <td class="tb_bg"><label for=><font style="font-size: 14px; color: red;">*</font>上映时间</label>
                                    </td>
                                    <td><input class="jobNum1" id="time" name="time" type="text" placeholder="请输入时间"/></td>
                                </tr>
                                <tr>
                                    <td class="tb_bg"><label for=><font style="font-size: 14px; color: red;">*</font>票价</label>
                                    </td>
                                    <td><input class="phoneNum1" id="price" name="price" type="text" placeholder="请输入票价"/></td>
                                    <td class="tb_bg"><label for=>出品国家</label></td>
                                    <td><input type="text" name="country" id="country" placeholder="请输入出品国家"/></td>
                                </tr>
                                <tr>
                                    <td class="tb_bg"><label for=>电影类型</label></td>
                                    <td>
                                        <select id="style" class="form-control select_down" style="font-size: 13px; color: #666;">
                                            <option>喜剧</option>
                                            <option>爱情</option>
                                            <option>动作</option>
                                        </select>
                                    </td>
                                    <td class="tb_bg"><label for=>电影效果</label></td>
                                    <td>
                                        <select id="effect" class="form-control select_down" style="font-size: 13px; color: #666;">
                                            <option>3D</option>
                                            <option>2D</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tb_bg"><label for=>是否上封面</label></td>
                                    <td>
                                        <select id="on" class="form-control select_down" style="font-size: 13px; color: #666;">
                                            <option>是</option>
                                            <option>否</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" type="button" class="btn btn-secondary">确定</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>电影名称</th>
                <th>上映时间</th>
                <th>票价</th>
                <th>出品国家</th>
                <th>电影类型</th>
                <th>电影效果</th>
                <th>是否上封面</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="show_tbody">
                <%
                    //取得数据库连接conn
                    Connection conn= DriverManager.getConnection(url, dbuser, dbpwd);;

                    PreparedStatement ps=null;
                    ResultSet rs=null;
                    //声明数据库字段
                    String moviename="";
                    String time="";
                    String price="";
                    String country="";
                    String style="";
                    String effect="";
                    String on="";
                    try
                    {
                        String sql="select * from getmovie";
                        ps = conn.prepareStatement(sql);
                        rs = ps.executeQuery();
                        while(rs.next())
                        {
                            moviename=rs.getString("moviename");
                            time=rs.getString("time");
                            price=rs.getString("price");
                            country=rs.getString("country");
                            style=rs.getString("style");
                            effect=rs.getString("effect");
                            on=rs.getString("onto");
                            out.println("<tr>");
                            out.println("<td id=\"moviename1\">"+moviename+"</td>");
                            out.println("<td>"+time+"</td>");
                            out.println("<td>"+price+"</td>");
                            out.println("<td>"+country+"</td>");
                            out.println("<td>"+style+"</td>");
                            out.println("<td>"+effect+"</td>");
                            out.println("<td>"+on+"</td>");
                            out.println("<td>");
                            out.println("<a href=\"#\" class=\"edit\">编辑</a>");
                            out.println("<a href=\"#\" id =\"del\" class=\"del\">删除</a>");
                            out.println("</td>");
                            out.println("</tr>");
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
    </div>
</div>
<script>
    trIndex = $('.del', '#show_tbody').index($(this));
    var tar = $('#show_tbody tr').eq(trIndex);
        var addEnter = true,
            noRepeat = true,
            jobArr = [],
            phoneArr = [],
            usernameArr = [],
            tdStr = '',
            trIndex,
            hasNullMes = false,
            tarInp = $('#xztb input'),
            tarSel = $('#xztb select');
        $('#add_btn').click(function () {
        hasNullMes = false;
        if ($('.userName').val()==='') {
            bootbox.alert({
                title: "来自火星的提示",
                message: "名称为必选项，请填写",
                closeButton:false
            })
            hasNullMes = true;
            return
        }
        if ($('.jobNum').val()==='') {
            bootbox.alert({
                title: "来自火星的提示",
                message: "上映时间为必选项，请填写",
                closeButton:false
            })
            hasNullMes = true;
            return
        }
        if ($('.phoneNum').val()==='') {
            bootbox.alert({
                title: "来自火星的提示",
                message: "票价为必选项，请填写",
                closeButton:false
            })
            hasNullMes = true;
            return
        }
        if (hasNullMes) {
            return;
        }
        if (addEnter) {
        jobArr = [], phoneArr = [];
        for (var i = 0; i<$('#show_tbody tr:not(".has_case")').length;i++) {
            var par = '#show_tbody tr:not(".has_case"):eq(' + i + ')';
            var  c = $('td:eq(0)', par).html().trim(),
                a = $('td:eq(1)', par).html().trim(),
                b = $('td:eq(2)', par).html().trim();
            jobArr.push(a);
            phoneArr.push(b);
            usernameArr.push(c);
        }
        var username = $('.userName').val();
        if (jobArr.indexOf(username)>-1) {
            noRepeat = false;
            bootbox.alert({
                title: "来自火星的提示",
                message: "电影名重复了，请重新输入",
                closeButton:false
            })
            return;
        }
        noRepeat = true;
        if (noRepeat) {
            //发送ajax
            $.ajax({
                url:"${pageContext.request.contextPath}/movieServlet",
                type:"POST",
                data:{"moviename":$("#moviename").val(),"time":$("#time").val(),"price":$("#price").val(),"country":$("#country").val(),"style":$("#style").val(),"effect":$("#effect").val(),"on":$("#on").val()},
                dataType:"text",
                success:function (data) {
                }
            });
            tdStr = '';
            for (var a=0; a<tarInp.length; a++) {
                tdStr+= '<td>' + tarInp.eq(a).val() + '</td>'
            }
            for (var b=0; b<tarSel.length; b++) {
                tdStr+= '<td>' + tarSel.eq(b).val() + '</td>'
            }
            tdStr+= '<td><a href="#" class="edit">编辑</a> <a href="#" class="del">删除</a></td>';
            $('#show_tbody').append('<tr>' + tdStr + '</tr>');
            $('#renyuan').modal('hide');
        }
        }else {
            tdStr = '';
            var tar = $('#show_tbody tr').eq(trIndex);
            for (var a=0; a<tarInp.length; a++) {
                tdStr+= '<td>' + tarInp.eq(a).val() + '</td>'
            }
            for (var b=0; b<tarSel.length; b++) {
                tdStr+= '<td>' + tarSel.eq(b).val() + '</td>'
            }
            tdStr+= '<td><a href="#" class="edit">编辑</a> <a href="#" class="del">删除</a></td>';
            $.ajax({
                url:"${pageContext.request.contextPath}/updateServlet",
                type:"POST",
                dataType:"text",
                data:{ 'moviename':tar.children('td').eq(0).html(),'time':tarInp.eq(1).val(),'price':tarInp.eq(2).val(),'country':tarInp.eq(3).val(),'style':tar.children('td').eq(4).html(),'effect':tar.children('td').eq(5).html(),'moviename1':tarInp.eq(0).val(),'on':tarSel.eq(2).val()},
                success:function (data) {
                }
            });
            $('#show_tbody tr').eq(trIndex).empty().append(tdStr);
            $('#renyuan').modal('hide');
        }
    });
</script>
<script>
    tartr = $('#show_tbody tr');
        $('#tb').on('click', '.del', function () {
            //发送ajax
            trIndex = $('.del', '#show_tbody').index($(this));
            var tar = $('#show_tbody tr').eq(trIndex);
            $.ajax({
                url:"${pageContext.request.contextPath}/delmovieServlet",
                type:"POST",
                dataType:"text",
                data:{ 'moviename':tar.children('td').eq(0).html()},
                success:function (data) {
                    alert("清除成功！");
                    }
            });
        });
</script>
<script>
    $('#clearseat1').click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/CealseatServlet",
            type:"POST",
            dataType:"text",
            data:{ 'seatname':'seats'},
            success:function (data) {
                alert("清除成功！");
            }
        });

    });
    $('#clearseat2').click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/CealseatServlet",
            type:"POST",
            dataType:"text",
            data:{ 'seatname':'seats2'},
            success:function (data) {
                alert("清除成功！");
            }
        });

    });
    $('#clearseat3').click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/CealseatServlet",
            type:"POST",
            dataType:"text",
            data:{ 'seatname':'seats3'},
            success:function (data) {
                alert("清除成功！");
            }
        });

    });
    $('#clearseat4').click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/CealseatServlet",
            type:"POST",
            dataType:"text",
            data:{ 'seatname':'seats4'},
            success:function (data) {
                alert("清除成功！");
            }
        });

    });
</script>
<script src="js/mejs.js"></script>
</body>
</html>
