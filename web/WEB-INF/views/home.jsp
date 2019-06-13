<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>西邮管家 - 首页</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>

    <%@include file="public/head.jsp"%>

    <div class="hero-img">
        <img src="../../resource/images/hero-img.jpg" alt="hero-img" class="hero" style="width: 100%">
        <div class="text-wrap">
            <p class="title">为西邮学子提供最便捷的服务</p>
            <br>
            <p class="description">To Provice The Most Convenient Service For XUPT Students</p>
        </div>
    </div>

    <div class="services-section">
        <div class="container">
            <div class="row">
                <div class="title-and-desc">
                    <h2 class="section-title">
                        <span class="separate">西邮管家</span>
                        XUPT ASSISTANT
                    </h2>

                </div>
            </div>
            <div class="row">
                <div class="col-1-3">
                    <div class="service">
                        <a href="/student/courseSearch"> <img src="../../resource/images/serv-ico1.png" alt="icon" class="serv-icon" ></a>
                        <p class="serv-title">课表查询</p>
                        <p class="body-text">可以为你提供所需的课表信息</p>
                        <p class="body-text">让你不必在为什么时间上什么课而发愁</p>
                    </div>
                </div>
                <div class="col-1-3">
                    <div class="service">
                        <a href="/system/transaction"> <img src="../../resource/images/serv-ico2.png" alt="icon" class="serv-icon"></a>
                        <p class="serv-title">跳蚤市场</p>
                        <p class="body-text">可以和整个西邮的同学买卖二手物品</p>
                        <p class="body-text">为你提供一个方便交易的平台</p>

                    </div>
                </div>
                <div class="col-1-3">
                    <div class="service">
                        <a href="/system/SchoolTalk"> <img src="../../resource/images/serv-ico3.png" alt="icon" class="serv-icon"></a>
                        <p class="serv-title">校园说说</p>
                        <p class="body-text">在这可以尽情畅所欲言</p>
                        <p class="body-text">与同学们进行交流和沟通</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="public/foot.jsp"%>

    <%@include file="public/js.jsp"%>

</body>
</html>
