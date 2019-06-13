<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>绑定</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>

<%@include file="public/head.jsp"%>

<div class="container main">
    <div class="col-lg-6 col-lg-offset-3  col-xs-12">
        <c:if test="${status == 0}">
            <form style="margin-top: 50px">
                <div class="form-group">
                    <label for="status">状态</label>
                    <input type="text" class="form-control" id="status" name="status" readonly value="未绑定">
                </div>

                <div class="form-group">
                    <label for="number">学号</label>
                    <input type="text" class="form-control" id="number" name="number" placeholder="学号">
                </div>

                <div class="form-group">
                    <label for="password">教务系统密码</label>
                    <input type="password" class="form-control" id = "password" name="password" placeholder="密码">
                </div>

                <div class="form-group">
                    <button type="button" class="form-control btn btn-primary" id = "bind">立即绑定</button>
                </div>
            </form>
        </c:if>

        <c:if test="${status == 1}">
            <form>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >状&emsp;&emsp;态</span>
                        <label class="form-control">已绑定</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >姓&emsp;&emsp;名</span>
                        <label class="form-control">${student.name}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >学&emsp;&emsp;号</span>
                        <label class="form-control">${student.number}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >性&emsp;&emsp;别</span>
                        <label class="form-control">${student.sex}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >民&emsp;&emsp;族</span>
                        <label class="form-control">${student.nation}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >学&emsp;&emsp;院</span>
                        <label class="form-control">${student.college}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >专&emsp;&emsp;业</span>
                        <label class="form-control">${student.specialty}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >班&emsp;&emsp;级</span>
                        <label class="form-control">${student.clazz}</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" >入学年份</span>
                        <label class="form-control">${student.entrollment_year}</label>
                    </div>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-primary form-control" id = "unbind">解绑</button>
                </div>
            </form>
        </c:if>


    </div>
</div>

<%@include file="public/foot.jsp"%>

<%@include file="public/js.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<script type="text/javascript">
    $(function(){
        $("#unbind").click(function () {
            $.ajax({
                type:"post",
                url:"/student/unbind",
                dataType:"json",
                success:function (data) {
                    if(data == "success"){
                        Swal.fire({
                            type: 'success',
                            title: "解绑成功",
                            width:300
                        })
                        setTimeout(function(){
                            $(window).attr({
                                'location': "bind"
                            })
                        }, 1000);
                    }else {
                        Swal.fire({
                            type: 'error',
                            title: "解绑失败",
                            width:300
                        })
                    }
                }
            })
        })
    })

    $("#bind").click(function () {
        var number = $("#number").val();
        var password = $("#password").val();
        $.ajax({
            type:"post",
            url:"/student/bind",
            data:{
                number:number,
                password:password
            },
            dataType:"json",
            success:function (data) {
                if(data == "success"){
                    Swal.fire({
                        type: 'success',
                        title: "绑定成功",
                        width:300
                    })
                    setTimeout(function(){
                        $(window).attr({
                            'location': "bind"
                        })
                    }, 1000);
                }else {
                    Swal.fire({
                        type: 'error',
                        title: "绑定失败",
                        width:300
                    })
                }
            }
        })
    })
</script>

</body>
</html>