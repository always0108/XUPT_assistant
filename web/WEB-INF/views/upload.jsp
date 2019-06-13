<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图片</title>
    <%@include file="public/resource.jsp"%>
    <link type="text/css" rel="stylesheet" href="/resource/lib/bootstrap-fileinput/css/fileinput.css" />
</head>
<body>

    <%@include file="public/head.jsp"%>

    <div class="container main">

        <div class="col-lg-6 col-lg-offset-3  col-xs-12" style="margin-top: 80px">


            <%--<form id="trans" action="/image/test" method="post">--%>

                <%--<div class="form-group">--%>
                    <%--<div class="input-group" >--%>
                        <%--<span class="input-group-addon">商品名称</span>--%>
                        <%--<input type="text" class="form-control" name="name" id="name">--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="form-group">--%>
                    <%--<div class="input-group">--%>
                        <%--<span class="input-group-addon" >价 &nbsp; &nbsp;  &nbsp;  &nbsp;  格</span>--%>
                        <%--<input type="text" class="form-control" name="price" id="price">--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="form-group">--%>
                    <%--<div class="input-group">--%>
                        <%--<span class="input-group-addon">联系方式</span>--%>
                        <%--<input type="text" class="form-control" name="phone" id="phone">--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="form-group">--%>
                    <%--<div class="input-group">--%>
                        <%--<span class="input-group-addon">简 &nbsp; &nbsp; &nbsp;  &nbsp;  介</span>--%>
                        <%--<input type="text" class="form-control" name="information" id="information">--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="form-group">--%>
                    <%--<div class="file-loading">--%>
                        <%--<input id="file" name="images" type="file">--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<input type="hidden" name="enclosure" id="enclosure">--%>

                <%--<div class="form-group">--%>
                    <%--<button type="button" class="form-control btn btn-primary" id="but" onclick="send()">添加</button>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>


                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Open modal for @fat</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>
                ...more buttons...

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="exampleModalLabel">New message</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="recipient-name" class="control-label">Recipient:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="control-label">Message:</label>
                                        <textarea class="form-control" id="message-text"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Send message</button>
                            </div>
                        </div>
                    </div>
                </div>

    <%@include file="public/foot.jsp"%>

    <%@include file="public/js.jsp"%>

    <script src="/resource/lib/bootstrap/js/popper.js"></script>
    <script type="text/javascript" src="/resource/lib/bootstrap-fileinput/js/fileinput.js"></script>
    <script type="text/javascript" src="/resource/lib/bootstrap-fileinput/js/locales/zh.js"></script>


    <script>
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-title').text('New message to ' + recipient)
            modal.find('.modal-body input').val(recipient)
        })
    </script>


                <%----%>
    <%--<script>--%>
            <%--var pics = new Array(); //多图上传返回的图片属性接受数组--%>

            <%--$("#file").fileinput({--%>
                <%--language : 'zh',--%>
                <%--enctype: 'multipart/form-data',--%>
                <%--uploadUrl : "/image/upload",--%>
                <%--showUpload: false,--%>
                <%--showRemove: false,--%>
                <%--dropZoneEnabled: false,--%>
                <%--autoReplace : true,--%>
                <%--minFileCount: 0,--%>
                <%--uploadAsync: true,--%>
                <%--browseOnZoneClick: true,--%>
                <%--maxFileSize:1024*4,--%>
                <%--msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",--%>
                <%--allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀--%>
                <%--mainClass: "input-group",--%>
                <%--layoutTemplates :{--%>
                    <%--actionUpload:'',//去除上传预览缩略图中的上传图片；--%>
                    <%--actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。--%>
                <%--},--%>
            <%--}).on("filebatchselected", function(e, files) {--%>
                <%--$(this).fileinput("upload");             // 文件选择完直接调用上传方法。--%>
            <%--}).on("fileuploaded", function(e, data, previewId) {       // 上传完成后的处理--%>
                <%--$('#' + previewId).attr('fileid', data.response.id);--%>
                <%--console.log(data.response.id)--%>
                <%--pics.push(data.response.id);--%>
            <%--}).on('filesuccessremove', function(event, id) {--%>
                <%--var fileid = $('#' + id).attr('fileid');--%>
                <%--for (i = 0;i < pics.length;i++){--%>
                    <%--if(parseInt(pics[i]) == parseInt(fileid)){--%>
                        <%--pics.splice(i,1);--%>
                    <%--}--%>
                <%--}--%>
                <%--$.ajax({--%>
                <%--type :"POST",--%>
                <%--url : "/image/delete",--%>
                <%--dataType : "json",--%>
                <%--data : {--%>
                    <%--"id" : fileid--%>
                    <%--},--%>
                    <%--success : function(data) {--%>
                        <%--console.log("delete success");--%>
                <%--},--%>
                    <%--error: function(data) {--%>
                        <%--console.log('error');--%>
                    <%--}--%>
                <%--});--%>
            <%--});--%>

            <%--function send() {--%>
                <%--if(pics.length > 0){--%>
                    <%--var result = "";--%>
                    <%--result = result + pics[0];--%>
                    <%--for(var i = 1; i < pics.length;i++)--%>
                        <%--result = result + "+" + pics[i];--%>
                <%--}else{--%>
                    <%--result = "null";--%>
                <%--}--%>
                <%--$("#enclosure").val(result);--%>
                <%--$("#trans").submit();--%>
            <%--}--%>
    <%--</script>--%>
</body>
</html>
