<%--
  Created by IntelliJ IDEA.
  User: limeng
  Date: 19-6-4
  Time: 上午8:22
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 19-2-22
  Time: 上午12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head ><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="../../resource/login/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../resource/login/css/reset.css">
    <script src="../../resource/login/js/particles.min.js"></script>
    <script src="../../resource/login/js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="../../resource/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../resource/easyui/themes/icon.css">
    <script src="../../resource/easyui/jquery.min.js"></script>
    <script src="../../resource/easyui/jquery.easyui.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<body style="height: 100%; background: #fff url(../../resource/images/1.jpg) 50% 50% no-repeat; background-size: cover;">
<div >
    <div class="login" style="display: block;height: 450px;" >
        <div class="login-top" style="margin-top: 20px" >
            登录
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="../../resource/login/images/name.png"></div>
            <div class="login-center-input">
                <input type="text" name="name" id="username" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=&#39;&#39;" onblur="this.placeholder=&#39;请输入您的用户名&#39;">
                <div class="login-center-input-text">用户名</div>
            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="../../resource/login/images/password.png"></div>
            <div class="login-center-input">
                <input type="password" name="password" id="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder=&#39;&#39;" onblur="this.placeholder=&#39;请输入您的密码&#39;">
                <div class="login-center-input-text">密码</div>
            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="../../resource/login/images/password.png"></div>
            <div class="login-center-input">
                <input type="text" style="width: 50%" name="cpacha" id="cpacha" value="" placeholder="请输入验证码" onfocus="this.placeholder=&#39;&#39;" onblur="this.placeholder=&#39;请输入验证码&#39;">
                <div class="login-center-input-text">验证码</div>
                <img id="cpacha_img" title="点击切换验证码" style="cursor: pointer;" src="get_cpacha?vl=4&wd=110&ht=30&type=loginCpacha" width="110px" height="30px" onclick="change()">
            </div>
        </div>
        <div class="login-button" id="loginButton">
            登录
        </div>
        <div class="login-button" style="margin-top: 20px" id="registerButton">
            注册
        </div>
    </div>
    <div class="sk-rotating-plane"></div>
    <canvas class="particles-js-canvas-el" width="1147" height="952" style="width: 100%; height: 100%;"></canvas></div>

<!-- scripts -->

<script type="text/javascript">
    function hasClass(elem, cls) {
        cls = cls || '';
        if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
        return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
    }

    function addClass(ele, cls) {
        if (!hasClass(ele, cls)) {
            ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
        }
    }

    $(function () {
        $("#registerButton").click(function () {
            window.location.href = "/system/register"
        })
    })

    function change() {
        $("#cpacha_img").attr("src","get_cpacha?vl=4&wd=110&ht=30&type=loginCpacha&t="+new Date().getTime());
    }

    function removeClass(ele, cls) {
        if (hasClass(ele, cls)) {
            var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
            while (newClass.indexOf(' ' + cls + ' ') >= 0) {
                newClass = newClass.replace(' ' + cls + ' ', ' ');
            }
            ele.className = newClass.replace(/^\s+|\s+$/g, '');
        }
    }
    document.querySelector(".login-button").onclick = function(){
        var username = $("#username").val();
        var password = $("#password").val();
        var cpacha = $("#cpacha").val();
        addClass(document.querySelector(".login"), "active");
        addClass(document.querySelector(".sk-rotating-plane"), "active");
        document.querySelector(".login").style.display = "none";
        $.ajax({
            url:'/system/loginAct',
            data:{name:username,password:password,cpacha:cpacha},
            type:'post',
            dataType:'json',
            success:function (data) {
                if(data.type == 'success'){
                    Swal.fire({
                        type: 'success',
                        title: data.msg,
                        width:300
                    })
                    setTimeout(function(){
                        $(window).attr({
                            'location': "home"
                        })
                    }, 1000);
                }else{
                    removeClass(document.querySelector(".login"), "active");
                    removeClass(document.querySelector(".sk-rotating-plane"), "active");
                    document.querySelector(".login").style.display = "block";
                    Swal.fire({
                        type: 'error',
                        title: data.msg,
                        width:300
                    })
                    change();
                }
            }
        })
    }
</script>
</body></html>

