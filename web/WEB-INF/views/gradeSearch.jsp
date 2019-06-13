<%--
  Created by IntelliJ IDEA.
  User: limeng
  Date: 19-6-10
  Time: 上午8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>西邮管家 - 成绩查询</title>
    <%@include file="public/resource.jsp"%>
</head>
<body>

    <%@include file="public/head.jsp"%>

    <div class="container main">
        <div class="col-xs-12 col-lg-8 col-lg-offset-2">
            <form id="searchForm" method="POST" action="/student/gradeSearch">
                <div class="form-group">
                    <select class="form-control" name="year" id="selectYear">
                        <option value="0">请选择学年</option>
                        <option value="2018">2018-2019</option>
                        <option value="2017">2017-2018</option>
                        <option value="2016">2016-2017</option>
                        <option value="2015">2015-2016</option>
                    </select>
                </div>

                <div class="form-group">
                    <select class="form-control" name="semester" id="selectSemester">
                        <option value="0">请选择学期</option>
                        <option value="1">第一学期</option>
                        <option value="2">第二学期</option>
                    </select>
                </div>

                <div class="form-group">
                    <button type="button" id="search" class="form-control btn btn-primary">查询</button>
                </div>
            </form>

            <input type="hidden" id="year" value="${year}">
            <input type="hidden" id="semester" value="${semester}">

            <c:if test="${grades != null}">
                <div class="form-group">
                    <table data-toggle="table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th data-field="courseName" data-align="center" data-valign="middle">课程名称</th>
                            <th data-field="scores" data-align="center" data-valign="middle">成绩</th>
                            <th data-field="GPA" data-align="center" data-valign="middle">绩点</th>
                            <th data-field="teacher" data-align="center" data-valign="middle">教师</th>
                            <th data-field="type" data-align="center" data-valign="middle">类型</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="grade" items="${grades}">
                            <tr>
                                <td>${grade.courseName}</td>
                                <td>${grade.scores}</td>
                                <td>${grade.GPA}</td>
                                <td>${grade.teacher}</td>
                                <td>${grade.type}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>


    <%@include file="public/foot.jsp"%>

    <%@include file="public/js.jsp"%>

    <script type="application/javascript">
        $(document).ready(function(){
            var year = $("#year").val();
            var semester = $("#semester").val();
            $("#selectYear").each(function (value) {
                $(this).children("option").each(function(){
                    if ($(this).val() == year){
                        $(this).attr("selected","selected");
                    }
                })
            })

            $("#selectSemester").each(function (value) {
                $(this).children("option").each(function(){
                    if ($(this).val() == semester){
                        $(this).attr("selected","selected");
                    }
                })
            })

            $("#search").click(function () {
                $('select').each(function() {
                    if($(this).children("option:selected").val() == 0){
                        Swal.fire({
                            type: 'error',
                            title: '请选择',
                            width:300
                        })
                        return false;
                    }
                });
                $("#searchForm").submit();
            })
        });
    </script>

</body>
</html>
