<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 19-6-13
  Time: 下午5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>西邮管家 - 校园说说</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>
<style>
    .heart {
        background:url(../../resource/images/web_heart_animation.png);
        background-position:left;
        background-repeat:no-repeat;
        bottom:37%;
        height:50px;
        width:50px;
        cursor:pointer;
        position:absolute;
        right: 1%;
        background-size:2500%;
    }
    .heart:hover, .heart:focus{
        background-position:right;
    }

    @-webkit-keyframes heartBlast {
        0% {
            background-position:left;
        }
        100% {
            background-position:right;
        }
    }

    @keyframes heartBlast {
        0% {
            background-position:left;
        }
        100% {
            background-position:right;
        }
    }

    .heartAnimation {
        display:inline-block;
        -webkit-animation-name:heartBlast;
        animation-name:heartBlast;
        -webkit-animation-duration:.8s;
        animation-duration:.8s;
        -webkit-animation-iteration-count:1;
        animation-iteration-count:1;
        -webkit-animation-timing-function:steps(28);
        animation-timing-function:steps(28);
        background-position:right;
    }

    .likeCount{
        font-family:'Georgia', Times, Times New Roman, serif;
        margin-top:32px;
        margin-left:68px;
        font-size:20px;
        color:#999999}
</style>
<%@include file="public/head.jsp"%>

<div class="container main">
    <br>
    <div>
        <div class="row centered">
            <div class="col-lg-8 col-lg-offset-2">
                <h4>西邮校园说说</h4>
            </div>
        </div>
    </div>

    <c:forEach items="${talks}" var="talk">
        <div class="panel panel-primary col-lg-12">
            <div class="panel-body " style="text-align: left">
                用户名：${talk.username}
            </div>
            <div class="panel-footer">
                <h4>${talk.content}</h4>
            </div>
            <div class="panel-footer" style="margin-bottom: 20px">
                <h4>时间:${talk.display_time}</h4>
            </div>
            <div style="text-align: right">
                <div class="heart" id="like" rel="like" talkId="${talk.id}">
                    <div class="likeCount" id="likeCount"></div>
                </div>
            </div>
        </div>
    </c:forEach>


</div>

<%@include file="public/foot.jsp"%>
<%@include file="public/js.jsp"%>
<script>
    $(document).ready(function() {
        $('body').on("click",'.heart',function(){
            // var id = $(this).attr("talkID");
            // $.ajax({
            //     url:"/like/addOrDelete",
            //     data:{secret_id:id},
            //     type:"post",
            //     dataType:"json",
            //     success:function (data) {
            //         if(data == "已点赞"){
                        var A=$(this).attr("id");
                        var B=A.split("like");
                        var messageID=B[1];
                        var C=parseInt($("#likeCount"+messageID).html());
                        var D=$(this).attr("rel");//如果为Like则执行动画
                        if(D =='like') {
                            $("#likeCount"+messageID).html(C+1);
                            $(this).addClass("heartAnimation").attr("rel","unlike");
                            $(this).css("background-position","right");
                            //不加这句有bug，动画最后又会到了起点，点击后强制使图片停在最右边，
                        }else {
                            $("#likeCount" + messageID).html(C - 1);
                            $(this).removeClass("heartAnimation").attr("rel", "like");
                            $(this).css("background-position", "left");
                            //点击后强制使红心变黑，否则显示悬停状态的红色的心
                        }
                    // }else {
                    //     if(D =='like') {
                    //         $("#likeCount"+messageID).html(C+1);
                    //         $(this).addClass("heartAnimation").attr("rel","unlike");
                    //         $(this).css("background-position","right");
                    //         //不加这句有bug，动画最后又会到了起点，点击后强制使图片停在最右边，
                    //     }else {
                    //         $("#likeCount" + messageID).html(C - 1);
                    //         $(this).removeClass("heartAnimation").attr("rel", "like");
                    //         $(this).css("background-position", "left");
                    //         //点击后强制使红心变黑，否则显示悬停状态的红色的心
                    //     }
                    // }
                // }
        //     })
        });
    });
</script>
</body>
</html>
