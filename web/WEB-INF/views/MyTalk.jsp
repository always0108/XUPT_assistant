<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 19-6-13
  Time: 下午5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>西邮管家 - 我的说说</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>
<%@include file="public/head.jsp"%>
<script src="../../resource/js/dropload.min.js"></script>
<script src="../../resource/js/zepto.min.js"></script>
<script src="../../resource/lib/bootstrap/js/popper.js"></script>
<div class="container main">
        <br>
        <div>
            <div class="row centered">
                <div class="col-lg-8 col-lg-offset-2">
                    <h3>我的说说</h3>
                </div>
            </div>
            <br>
        </div>

    <c:forEach items="${talks}" var="talk">
        <div class="panel panel-primary col-lg-12">
            <div class="panel-body " style="text-align: left">
                用户名：${talk.username}
            </div>
            <div class="panel-footer">
                <h4>${talk.content}</h4>
            </div>
            <div class="panel-footer" style="font-family: 'Georgia', Times, Times New Roman, serif">
                <h4>时间:${talk.display_time}</h4>
            </div>
            <div style="text-align: right;margin-top: 20px">
                <p>
                    <a href="#" class="btn btn-primary" role="button" data-toggle="modal" data-target="#myModal" data-id="${talk.id}" data-content="${talk.content}">修改</a>
                    <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myDelete" data-id="${talk.id}">删除</a>
                </p>
            </div>
        </div>
    </c:forEach>


    <!-- 修改说说 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 100px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align: center">修改说说</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="input-group" >
                            <span class="input-group-addon">说说</span>
                            <input type="text" id="oldcontent" name="content" class="form-control" placeholder="原来的说说">
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="updateTalk" class="btn btn-primary">提交更改</button>
                    </div>

                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%--增加按钮--%>
    <div id="btnflybox" style="top:110px; left:72%;">
        <button id="btnfly" class="btn btn-primary " data-toggle="modal" data-target="#add">添加</button>
    </div>

    <%--增加说说--%>
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 100px">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align: center">添加说说</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="input-group" >
                            <span class="input-group-addon">说说</span>
                            <input type="text"  name="content" id="content" class="form-control" >
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="addTalk" class="btn btn-primary">提交</button>
                    </div>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="myDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 100px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align: center">删除说说？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="delete" class="btn btn-primary">删除</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>

<%@include file="public/foot.jsp"%>
<%@include file="public/js.jsp"%>
<script>
    $("#addTalk").click(function () {
        var content = $("#content").val();
        $.ajax({
            url:"/secret/add",
            data:{content:content},
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data == "发表成功"){
                    Swal.fire({
                        type: 'success',
                        title: data,
                        width:300
                    })
                    setTimeout(function(){
                        $(window).attr({
                            'location': "MyTalk"
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

    $("#myModal").on('show.bs.modal',function (event) {
        var but = $(event.relatedTarget);
        var id = but.data("id");
        console.log("access");
        console.log(id);
        var modal = $(this);
        modal.find("#oldcontent").val(but.data("content"));
        $("#updateTalk").click(function () {
            var content = $("#oldcontent").val();
            $.ajax({
                url:"/secret/update",
                data:{id:id,content:content},
                type:"post",
                dataType:"json",
                success:function (data) {
                    if(data == "修改成功"){
                        Swal.fire({
                            type: 'success',
                            title: data,
                            width:300
                        })
                        setTimeout(function(){
                            $(window).attr({
                                'location': "MyTalk"
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

    $("#myDelete").on('show.bs.modal',function (event) {
        var but = $(event.relatedTarget);
        var id = but.data("id");
        console.log(id);
        $("#delete").click(function () {
            $.ajax({
                url:"/secret/delete",
                data:{id:id},
                type:"post",
                dataType:"json",
                success:function (data) {
                    if(data == "删除成功"){
                        Swal.fire({
                            type: 'success',
                            title: data,
                            width:300
                        })
                        setTimeout(function(){
                            $(window).attr({
                                'location': "MyTalk"
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
</body>
</html>
