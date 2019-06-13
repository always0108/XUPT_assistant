<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: limeng
  Date: 19-6-12
  Time: 上午9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>跳蚤市场</title>
    <%@include file="public/resource.jsp"%>

</head>
<body>
<%@include file="public/head.jsp"%>

<div class="container main">

    <br>
    <div>
        <div class="row centered">
            <div class="col-lg-8 col-lg-offset-2">
                <h4>西邮二手市场</h4>
                <p>XUPT secondary market</p>
            </div>
        </div>
        <!-- row -->
    </div>

    <div class="centered" id="1">
        <div class="list"></div>
    </div>

</div>


<%@include file="public/foot.jsp"%>
<%@include file="public/js.jsp"%>
<script src="../../resource/dropload.min.js"></script>
<script src="../../resource/zepto.min.js"></script>
<script>
    $(function(){
        // 页数
        var currentPage = 0;
        // 每页展示5个
        var pageSize = 3;

        // dropload
        $('#1').dropload({
            scrollArea : window,
            loadDownFn : function(me){
                currentPage++;
                if(currentPage < 20){
                    var result = '';
                    $.ajax({
                        type: 'GET',
                        url: '/transaction/getAll?currentPage='+currentPage+'&pageSize='+pageSize,
                        dataType: 'json',
                        success: function(data){
                            var arrLen = data.length;
                            if(arrLen > 0){
                                for(var i=0; i<arrLen; i++){
                                    result +=   '<div class="col-lg-4">'
                                        +'<div class="thumbnail">'
                                        +'<img src="img/12356.jpg" alt="商品">'
                                        +'<div class="caption" >'
                                        +'<h3>'+data[i].name+'</h3>'
                                        +'<div style="text-align: left">'
                                        +'<h5>价格：'+data[i].price+'</h5>'
                                        +'<h5>卖家姓名：'+data[i].seller+'</h5>'
                                        +'<h5>联系方式：'+data[i].phone+'</h5>'
                                        +'<p>简介：'+data[i].information+'</p>'
                                        +'</div>'
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
                            alert('Ajax error!');
                            // 即使加载出错，也得重置
                            me.resetload();
                        }
                    });
                }
            }
        });
    });

</script>

</body>
</html>


