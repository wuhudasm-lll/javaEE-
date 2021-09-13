<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>用户信息管理</title>
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
    <div class="title">用户信息管理</div>
    <div class="content">
        <!--搜索输入框及查询、重置按钮-->
        <div class="container content_width">
            <div class="person_search">
                <div class="search_input">
                    <div class="input-group mb-3">
                        <span>用户名：</span>
                        <input id="Ktext" type="text" class="form-control" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="search_input">
                    <div class="input-group mb-3" hidden>
                        <span>密码：</span>
                        <input id="job_num" type="text" class="form-control" placeholder="请输入密码">
                    </div>
                </div>
                <div class="search_input">
                    <button class="btn btn-primary search_btn" type="button" id="search_btn">查询</button>
                    <button class="btn btn-primary search_btn" type="button" id="back_btn">重置</button>
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
                                    <td class="tb_bg"><label ><font style="font-size: 14px; color: red;">*</font>用户名</label>
                                    </td>
                                    <td><input class="jobNum" id="username" name="username" type="text" placeholder="请输入用户名"/></td>
                                </tr>
                                <tr>
                                    <td class="tb_bg"><label ><font style="font-size: 14px; color: red;">*</font>密码</label>
                                    </td>
                                    <td><input class="phoneNum" id="password" name="password" type="text" placeholder="请输入密码"/></td>
                                </tr>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button id="add_btn" type="button" class="btn btn-secondary">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--表格列表-->
        <table id="tb" class="table">
            <thead>
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>密码</th>
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
                int id=0;
                String username="";
                String password="";
                try
                {
                    String sql="select * from user ";
                    ps = (PreparedStatement) conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while(rs.next())
                    {
                        id = id+1;
                        username=rs.getString("username");
                        password=rs.getString("password");
                        out.println("<tr>");
                        out.println("<td> "+id+"</td>");
                        out.println("<td>"+username+"</td>");
                        out.println("<td>"+password+"</td>");
                        out.println("<td>");
                        out.println("<a href=\"#\" id =\"edit\" class=\"edit\">编辑</a>");
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
    $('.edit').click(function () {

    });
</script>
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
        tartr = $('#show_tbody tr'),
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
                    a = $('td:eq(1)', par).html().trim();
                jobArr.push(a);
                usernameArr.push(c);
            }
            var username = $('.jobNum').val();
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
                    url:"${pageContext.request.contextPath}/usermasterServlet",
                    type:"POST",
                    data:{"username":$("#username").val(),"password":$("#password").val()},
                    dataType:"text",
                    success:function (data) {
                    }
                });
                tdStr = '';
                tartr = tartr.length+1;
                tdStr+='<td>'+tartr+'</td>';
                for (var a=0; a<tarInp.length; a++) {
                    tdStr+= '<td>' + tarInp.eq(a).val() + '</td>'
                }
                tdStr+= '<td><a href="#" class="edit">编辑</a> <a href="#" class="del">删除</a></td>';
                $('#show_tbody').append('<tr>' + tdStr + '</tr>');
                $('#renyuan').modal('hide');
            }
        }else {
            tdStr = '';
            var tar = $('#show_tbody tr').eq(trIndex);
            tdStr+= '<td>' + tartr.length + '</td>'
            for (var a=0; a<tarInp.length; a++) {
                tdStr+= '<td>' + tarInp.eq(a).val() + '</td>'
            }
            tdStr+= '<td><a href="#" class="edit">编辑</a> <a href="#" class="del">删除</a></td>';
            $.ajax({
                url:"${pageContext.request.contextPath}/updateUserServlet",
                type:"POST",
                dataType:"text",
                data:{ 'username1':tarInp.eq(0).val(),'password':tarInp.eq(1).val(),'username':tar.children('td').eq(1).html()},
                success:function (data) {

                }
            });
            $('#show_tbody tr').eq(trIndex).empty().append(tdStr);
            $('#renyuan').modal('hide');
        }
    });
</script>
<script>
    $('#tb').on('click', '.del', function () {//失去焦点事件
        //发送ajax
        trIndex = $('.del', '#show_tbody').index($(this));
        var tar = $('#show_tbody tr').eq(trIndex);
        $.ajax({
            url:"${pageContext.request.contextPath}/deluserServlet",
            type:"POST",
            dataType:"text",
            data:{ 'username':tar.children('td').eq(1).html()},
            success:function (data) {
            }
        });
    });
</script>
<script src="js/mejs.js"></script>
</body>
</html>
