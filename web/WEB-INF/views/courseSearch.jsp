<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: limeng
  Date: 19-6-10
  Time: 上午8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课表查询</title>
    <meta charset='UTF-8'/>
    <meta name="viewport" content="width=device-width,
                                   initial-scale=1.0,
                                   maximum-scale=1.0,
                                   user-scalable=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body style="margin: 2%">
    <form method="POST" action="/student/courseSearch">
        <div class="form-group">
            <select class="form-control" name="year">
                <option value="2018">2018-2019</option>
                <option value="2017">2017-2018</option>
                <option value="2016">2016-2017</option>
                <option value="2015">2015-2016</option>
            </select>
        </div>

        <div class="form-group">
            <select class="form-control" name="semester">
                <option value="1">第一学期</option>
                <option value="2">第二学期</option>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="form-control btn btn-primary">查询</button>
        </div>

        <div class="form-group">
            <button type="button" class="form-control btn btn-primary">返回</button>
        </div>


    </form>

    <c:if test="${courses != null}">
        <div class="form-group">
            <table data-toggle="table" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th data-field="time" data-align="center" data-valign="middle">时间</th>
                    <th data-field="courseName" data-align="center" data-valign="middle">课程名称</th>
                    <th data-field="place" data-align="center" data-valign="middle">地点</th>
                    <th data-field="teacher" data-align="center" data-valign="middle">教师</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.day_of_week} ${course.jc}</td>
                        <td>${course.courseName}</td>
                        <td>${course.campus} ${course.classroom}</td>
                        <td>${course.teacher}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>



</body>
</html>
