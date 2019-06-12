<%--
  Created by IntelliJ IDEA.
  User: limeng
  Date: 19-6-12
  Time: 上午8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>

    <%@include file="public/head.jsp"%>

    <div class="container main">
        <div class="col-lg-6 col-xs-12 col-lg-offset-3">
            <form action="/system/update">
                <div class="form-group">
                    <label>姓名</label>
                    <input type="text" class="form-control" name="name" placeholder="姓名">
                </div>

                <div class="form-group">
                    <label>性别</label>
                    <select class="form-control" name="sex">
                        <option value="0">请选择</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>电话</label>
                    <input type="text" class="form-control" name="phone" placeholder="电话">
                </div>

                <div class="form-group">
                    <label>简介</label>
                    <textarea class="form-control" rows="4" name="intro" placeholder="介绍一下你自己"></textarea>
                </div>

                <div class="form-group">
                    <br>
                    <button type="submit" class="btn btn-primary form-control">确认</button>
                </div>

            </form>
        </div>
    </div>

        <%@include file="public/foot.jsp"%>

        <%@include file="public/js.jsp"%>
</div>

</body>
</html>
