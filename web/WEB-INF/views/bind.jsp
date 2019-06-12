<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>绑定</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>

<%@include file="public/head.jsp"%>

<div class="container main">
    <div class="col-lg-6 col-lg-offset-3  col-xs-12" style="margin-top: 80px">
        <form method="POST" action="/student/bind">
            <div class="form-group">
                <label for="number">学号</label>
                <input type="text" class="form-control" id="number" name="number" placeholder="学号">
            </div>

            <div class="form-group">
                <label for="password">教务系统密码</label>
                <input type="password" class="form-control" id = "password" name="password" placeholder="密码">
            </div>

            <br>

            <div class="form-group">
                <input type="submit" class="form-control btn btn-primary" value="绑定"/>
            </div>
        </form>
    </div>
</div>

<%@include file="public/foot.jsp"%>

<%@include file="public/js.jsp"%>

</body>
</html>