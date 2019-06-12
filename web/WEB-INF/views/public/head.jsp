<%--
  Created by IntelliJ IDEA.
  User: limeng
  Date: 19-6-11
  Time: 下午1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                        <a class="navbar-brand" href="#">西邮管家</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            个人中心 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/system/modifyInfo">修改个人信息</a>
                            <li><a href="#">修改密码</a>
                            <li><a href="/student/bind">绑定学号</a>
                        </ul>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            信息查询 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/student/courseSearch">课表查询</a>
                            <li><a href="/student/gradeSearch">成绩查询</a>

                        </ul>
                    <li><a href="#">跳蚤市场</a>
                    <li><a href="#">失物招领</a>
                    <li><a href="#">校园说说</a>
                    <li><a href="#">关于我们</a>
                    <%--<li><a data-toggle="modal" data-target="#myModal" href="#myModal"><i class="fa fa-envelope-o"></i></a><>--%>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</html>
