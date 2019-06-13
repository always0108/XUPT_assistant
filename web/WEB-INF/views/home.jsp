<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>绑定</title>
    <%@include file="public/resource.jsp"%>
    <style type="text/css">
        .hero-img {
            max-height: 702px;
            overflow: hidden;
            position: relative; }
        .hero-img img.hero {
            margin-top: -8%; }
        .hero-img .text-wrap {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            width: 100%; }
        .hero-img .text-wrap p.title {
            font-size: 60px;
            color: #ffcc80; }
        .hero-img .text-wrap p.description {
            font-size: 42px;
            color: #fff;
            margin-bottom: 20px; }
        .hero-img .text-wrap .btn {
            width: 152px;
            max-width: 100%;
            height: 36px;
            background-color: transparent;
            border: 1px solid #ffcc80;
            border-radius: 3px;
            font-family: "Montserrat";
            color: #ffcc80;
            font-size: 12px;
            text-transform: uppercase; }
        .hero-img .text-wrap .btn:hover {
            background-color: #ffcc80;
            color: #fff;
            transition: .5s; }
        @media (max-width: 580px) {
            .hero-img .text-wrap p.title {
                font-size: 50px; }
            .hero-img .text-wrap p.description {
                font-size: 32px; } }
        @media (max-width: 430px) {
            .hero-img .text-wrap p.title {
                font-size: 28px; }
            .hero-img .text-wrap p.description {
                font-size: 20px; } }
        @media (max-width: 330px) {
            .hero-img .text-wrap p.title {
                font-size: 20px; }
            .hero-img .text-wrap p.description {
                font-size: 10px; } }

        .services-section {
            padding: 80px 0 30px;
            background-color: #fff; }
        .services-section .title-and-desc {
            margin-bottom: 110px; }
        .services-section .title-and-desc .separate {
            display: block; }
        .services-section .title-and-desc p.body-text {
            text-align: center; }
        .services-section .service {
            text-align: center;
            margin-bottom: 70px; }
        .services-section .service img {
            margin-bottom: 6px; }
        .services-section .service .serv-title {
            font-size: 14px;
            font-family: "Play";
            color: #28292e;
            text-transform: uppercase;
            font-weight: 700;
            margin-bottom: 14px; }
        @media (max-width: 960px) {
            .services-section .col-1-3 {
                width: 50%; } }
        @media (max-width: 768px) {
            .services-section .col-1-3 {
                width: 100%; } }

        .services-section.serv-2 {
            background-color: #fafafa;
            padding: 80px 0 30px; }
        @media (max-width: 768px) {
            .services-section.serv-2 .title-and-desc {
                margin-bottom: 80px; } }

        .col-1-3 {
            float: left;
            width: 33.3333333333%;
            padding-left: 15px;
            padding-right: 15px; }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding-left: 15px;
            padding-right: 15px; }

        .row {
            margin-right: -15px;
            margin-left: -15px; }

        .row:after {
            content: "";
            display: table;
            clear: both; }

        .section-title, .section-title .separate {
            font-family: "Play";
            font-size: 30px;
            font-weight: 700;
            color: #28292e;
            text-align: center;
            line-height: 42px;
            text-transform: uppercase; }

        .section-title {
            margin-bottom: 12px; }
    </style>
</head>
<body>

    <%@include file="public/head.jsp"%>

    <div class="hero-img">
        <img src="/resource/images/hero-img.jpg" alt="hero-img" class="hero" style="width: 100%">
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
                        <a href="/student/courseSearch"> <img src="/resource/images/serv-ico1.png" alt="icon" class="serv-icon" ></a>
                        <p class="serv-title">课表查询</p>
                        <p class="body-text">可以为你提供所需的课表信息</p>
                        <p class="body-text">让你不必在为什么时间上什么课而发愁</p>
                    </div>
                </div>
                <div class="col-1-3">
                    <div class="service">
                        <a href=""> <img src="/resource/images/serv-ico2.png" alt="icon" class="serv-icon"></a>
                        <p class="serv-title">跳蚤市场</p>
                        <p class="body-text">可以和整个西邮的同学买卖二手物品</p>
                        <p class="body-text">为你提供一个方便交易的平台</p>

                    </div>
                </div>
                <div class="col-1-3">
                    <div class="service">
                        <a href=""> <img src="/resource/images/serv-ico3.png" alt="icon" class="serv-icon"></a>
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
