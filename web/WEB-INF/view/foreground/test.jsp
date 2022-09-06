<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/3/31
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="../${pageContext.request.contextPath}/statics/js/jquery.js"></script>
    <script src="../${pageContext.request.contextPath}/statics/modules/layui/layui.js"></script>
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/layui.css">
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/modules/laydate/default/laydate.css">

</head>
<body>
<table class="table table-hover table-striped">
    <thead>
    <tr>
        <th>userid</th>
        <th>userName</th>
        <th>userPass</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${user}">
        <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.userPass}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</script>
</body>
</html>
