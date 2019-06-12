<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 19-6-12
  Time: 上午10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>
    <%@include file="public/js.jsp"%>
    <%@include file="public/head.jsp"%>
    <script>
        $(function () {
            $("#button").click(function () {
                var password = $("#password").val();
                var newPassword = $("#newPassword").val();
                var newRePassword = $("#newRePassword").val();
                $.ajax({
                    url:"/system/updatePassword",
                    type:"post",
                    data:{password:password,newPassword:newPassword,newRePassword:newRePassword},
                    dataType:"json",
                    success:function (data) {
                        if(data == "修改成功"){
                            Swal.fire({
                                type: 'success',
                                title: "修改成功",
                                width:300
                            })
                            setTimeout(function(){
                                $(window).attr({
                                    'location': "login"
                                })
                            }, 1000);
                        }else {
                            Swal.fire({
                                type: 'error',
                                title: data,
                                width:300
                            })
                        }
                    }
                })
            })
        })
    </script>

    <div class="container main">
        <div class="col-lg-6 col-xs-12 col-lg-offset-3">
                <form class="bs-example bs-example-form" role="form">
                    <div class="form-group">
                        <label>旧密码</label>
                        <input type="text" name="password" id="password" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>新密码</label>
                        <input type="text" name="newPassword" id="newPassword" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>重复新密码</label>
                        <input type="text" name="newRePassword" id="newRePassword" class="form-control">
                    </div>

                    <div class="form-group">
                        <button type="button" id="button" class="btn btn-primary form-control">确认</button>
                    </div>
                </form>
        </div>
    </div>

    <%@include file="public/foot.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</body>
</html>
