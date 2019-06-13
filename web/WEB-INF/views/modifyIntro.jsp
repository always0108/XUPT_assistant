<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <%@include file="public/js.jsp"%>

    <%@include file="public/head.jsp"%>

    <div class="container main">
        <div class="col-lg-6 col-xs-12 col-lg-offset-3">
            <form>
                <div class="form-group">
                    <label>姓名</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="姓名" value="${user.name}">
                </div>

                <div class="form-group">
                    <label>性别</label>
                    <select class="form-control" name="sex" id="sex">
                        <c:choose>
                            <c:when test="${user.sex.equals('男')}">
                                <option value="0">请选择</option>
                                <option value="男" selected="selected">男</option>
                                <option value="女">女</option>
                            </c:when>

                            <c:when test="${user.sex.equals('女')}">
                                <option value="0">请选择</option>
                                <option value="男">男</option>
                                <option value="女" selected="selected">女</option>
                            </c:when>

                            <c:otherwise>
                                <option value="0" selected="selected">请选择</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </c:otherwise>

                        </c:choose>



                    </select>
                </div>

                <div class="form-group">
                    <label>电话</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="电话" value="${user.phone}">
                </div>

                <div class="form-group">
                    <label>简介</label>
                    <textarea class="form-control" rows="4" name="intro" id="intro" placeholder="介绍一下你自己">${user.intro}</textarea>
                </div>

                <div class="form-group">
                    <br>
                    <button type="button" id="button" class="btn btn-primary form-control">确认</button>
                </div>

            </form>
        </div>
    </div>

    <%@include file="public/foot.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

    <script type="text/javascript">
        $(function () {
            $("#button").click(function () {
                var name = $("#name").val();
                var sex = $("#sex").val();
                var phone = $("#phone").val();
                var intro = $("#intro").val();
                $.ajax({
                    url:"/system/update",
                    data:{name:name,sex:sex,phone:phone,intro:intro},
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        if(data == "success"){
                            Swal.fire({
                                type: 'success',
                                title: "修改成功",
                                width:300
                            })
                            setTimeout(function(){
                                $(window).attr({
                                    'location': "home"
                                })
                            }, 1000);
                        }else {
                            Swal.fire({
                                type: 'error',
                                title: "修改失败",
                                width:300
                            })
                        }
                    }
                })
            })
        })
    </script>

</body>
</html>
