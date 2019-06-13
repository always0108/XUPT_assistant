<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 19-6-13
  Time: 上午12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>西邮管家 - 我的物品</title>
    <%@include file="public/resource.jsp"%>
    <link type="text/css" rel="stylesheet" href="/resource/lib/bootstrap-fileinput/css/fileinput.css" />
</head>
<body>
<STYLE>
    #btnflybox {
        position: fixed;
        top:108px;
        left:70%;
        z-index: 888;
        width: 100px;
        background-color:#ffffff;
        background-color:rgba(0,0,0,0.0);
    }
    #btnfly {
        flex: 0 1 auto;
        width: 80%;
        height: 70%;
        color: #fff;
        font-size: 20px;
        border-radius: 10px;
        border: none;
        outline: none;
        background-color:#000000;
        background-color:rgba(0,0,0,0.4);
    }
</STYLE>
<%@include file="public/head.jsp"%>
<div class="container main">
    <div>
        <div class="row centered">
            <div class="col-lg-8 col-lg-offset-2">
                <h4>我的物品</h4>
            </div>
        </div>
    </div>
    <br>
    <div class="centered" id="load">
        <div class="list"></div>
    </div>

    <%--删除商品--%>
    <div class="modal fade" id="myDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 100px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align: center">删除物品信息?</h4>
                    <input type="hidden" id="id" value="">
                </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="delete" class="btn btn-primary">删除</button>
                    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 修改商品 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 100px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align: center">修改物品信息</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <div class="input-group" >
                                <span class="input-group-addon">商品名称</span>
                                <input type="text" class="form-control" name="name" id="oldname" placeholder="原来的商品名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">价&emsp;&emsp;格</span>
                                <input type="text" class="form-control" name="price" id="oldprice" placeholder="原来的价格">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">联系方式</span>
                                <input type="text" class="form-control" name="phone" id="oldphone" placeholder="原来的联系方式">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">简&emsp;&emsp;介</span>
                                <input type="text" class="form-control" name="information" id="oldinformation" placeholder="原来的简介">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">状&emsp;&emsp;态</span>
                                <select name="status" id="status" class="form-control">
                                    <option value="0">正在售出</option>
                                    <option value="1">已经售出</option>
                                </select>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="update" class="btn btn-primary">修改</button>
                    </div>

                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%--添加按钮--%>
    <div id="btnflybox">
        <button id="btnfly" class="btn btn-primary " data-toggle="modal" data-target="#add">添加</button>
    </div>


    <%--添加商品--%>
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 100px">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="text-align: center">添加商品</h4>
                </div>
                <div class="modal-body">
                    <form id="trans" action="/transaction/add" method="post">
                        <div class="form-group">
                            <div class="input-group" >
                                <span class="input-group-addon">商品名称</span>
                                <input type="text" class="form-control" name="name" id="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" >商品价格</span>
                                <input type="text" class="form-control" name="price" id="price">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">联系方式</span>
                                <input type="text" class="form-control" name="phone" id="phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">简&emsp;&emsp;介</span>
                                <input type="text" class="form-control" name="information" id="information">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="file-loading">
                                <input id="file" name="images" type="file">
                            </div>
                        </div>
                        <input type="hidden" name="enclosure" id="enclosure">
                    </form>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="new" class="btn btn-primary">提交</button>
                    </div>

                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<%@include file="public/foot.jsp"%>
<%@include file="public/js.jsp"%>

<script src="../../resource/js/dropload.min.js"></script>
<script src="../../resource/js/zepto.min.js"></script>
<script src="../../resource/lib/bootstrap/js/popper.js"></script>
<script src="../../resource/lib/bootstrap-fileinput/js/fileinput.js"></script>
<script src="../../resource/lib/bootstrap-fileinput/js/locales/zh.js"></script>

<script>
    var pics = new Array(); //多图上传返回的图片属性接受数组

    $("#file").fileinput({
        language : 'zh',
        enctype: 'multipart/form-data',
        uploadUrl : "/image/upload",
        showUpload: false,
        showRemove: false,
        dropZoneEnabled: false,
        autoReplace : true,
        minFileCount: 0,
        uploadAsync: true,
        browseOnZoneClick: true,
        maxFileSize:1024*4,
        msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",
        allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
        mainClass: "input-group",
        layoutTemplates :{
            actionUpload:'',//去除上传预览缩略图中的上传图片；
            actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。
        },
    }).on("filebatchselected", function(e, files) {
        $(this).fileinput("upload");             // 文件选择完直接调用上传方法。
    }).on("fileuploaded", function(e, data, previewId) {       // 上传完成后的处理
        $('#' + previewId).attr('fileid', data.response.id);
        console.log(data.response.id)
        pics.push(data.response.id);
    }).on('filesuccessremove', function(event, id) {
        var fileid = $('#' + id).attr('fileid');
        for (i = 0;i < pics.length;i++){
            if(parseInt(pics[i]) == parseInt(fileid)){
                pics.splice(i,1);
            }
        }
        $.ajax({
            type :"POST",
            url : "/image/delete",
            dataType : "json",
            data : {
                "id" : fileid
            },
            success : function(data) {
                console.log("delete success");
            },
            error: function(data) {
                console.log('error');
            }
        });
    });

    $("#new").click(function (){
        if(pics.length > 0){
            var result = "";
            result = result + pics[0];
            for(var i = 1; i < pics.length;i++)
                result = result + "+" + pics[i];
        }else{
            result = "null";
        }
        var name = $("#name").val();
        var price = $("#price").val();
        var information = $("#information").val();
        var phone = $("#phone").val();
        $.ajax({
            url:"/transaction/add",
            type:"post",
            data:{
                name:name,
                price:price,
                information:information,
                phone:phone,
                enclosure:result
            },
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
                            'location': "MyTransaction"
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
    });

    $(function(){
        // 页数
        var currentPage = 0;
        // 每页展示5个
        var pageSize = 3;

        // dropload
        $('#load').dropload({
            scrollArea : window,
            loadDownFn : function(me){
                currentPage++;
                if(currentPage < 20){
                    var result = '';
                    $.ajax({
                        type: 'GET',
                        url: '/transaction/getMy?currentPage='+currentPage+'&pageSize='+pageSize,
                        dataType: 'json',
                        success: function(data){
                            var arrLen = data.length;
                            if(arrLen > 0){
                                for(var i=0; i<arrLen; i++){
                                    if(data[i].pics.length > 0){
                                        var imageurl = "/image/getImage?id="+data[i].pics[0];
                                    }else {
                                        var imageurl = "/resource/images/noPic.jpeg";
                                    }
                                    result +=
                                            '<div class="col-lg-4">'
                                            +'<div class="thumbnail">'
                                            +'<img src=\"'+imageurl+'\" alt="商品" style="width: 300px;height:225px ">'
                                            +'<div class="caption" >'
                                            +'<h3>'+data[i].name+'</h3>'
                                            +'<div style="text-align: left">'
                                            +'<h5>价格：'+data[i].price+'</h5>'
                                            +'<h5>卖家姓名：'+data[i].seller+'</h5>'
                                            +'<h5>联系方式：'+data[i].phone+'</h5>'
                                            +'<p>简介：'+data[i].information+'</p>'
                                            +'</div>'
                                        +'<p>'
                                        +'<a href="#" class="btn btn-primary" role="button" data-toggle="modal" data-target="#myModal" data-id=\"'+data[i].id+'\" data-name=\"'+data[i].name+'\" data-price=\"'+data[i].price+'\" data-information=\"'+data[i].information+'\" data-phone=\"'+data[i].phone+'\" data-status=\"'+data[i].status+'\">修改</a>'
                                        +'<a style="margin-left: 20px" href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myDelete" data-id='+data[i].id+'>删除</a>'
                                        +'</p>'
                                            +'</div>'
                                            +'</div>'
                                            +'</div>'
                                }
                                // 如果没有数据
                            }else{
                                // 锁定
                                me.lock();
                                // 无数据
                                me.noData();
                            }
                            // 为了测试，延迟1秒加载
                            setTimeout(function(){
                                // 插入数据到页面，放到最后面
                                $('.list').append(result);
                                // 每次数据插入，必须重置
                                me.resetload();
                            },1000);
                        },
                        error: function(xhr, type){
                            // alert('Ajax error!');
                            // // 即使加载出错，也得重置
                            // me.resetload();
                        }
                    });
                }
            }
        });

    });

    $("#myModal").on('show.bs.modal',function (event) {
        var but = $(event.relatedTarget);
        var id = but.data("id");
        console.log(id);
        var modal = $(this);
        modal.find("#oldname").val(but.data("name"));
        modal.find("#oldprice").val(but.data("price"));
        modal.find("#oldphone").val(but.data("phone"));
        modal.find("#oldinformation").val(but.data("information"));
        modal.find("#status").val(but.data("status"));
        $("#update").click(function () {
            var name = $("#oldname").val();
            var price = $("#oldprice").val();
            var information = $("#oldinformation").val();
            var phone = $("#oldphone").val();
            var status = $("#status").val();
            $.ajax({
                url:"/transaction/update",
                type:"post",
                data:{id:id,name:name,price:price,information:information,phone:phone,status:status},
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
                                'location': "MyTransaction"
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
        var but = $(event.relatedTarget)
        var id = but.data("id");
        console.log(id);
        $("#delete").click(function (event) {
            $.ajax({
                url:"/transaction/delete",
                type:"post",
                data:{id:id},
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
                                'location': "MyTransaction"
                            })
                        }, 1000);
                    }else {
                        Swal.fire({
                            type: 'error',
                            title: "删除失败",
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
