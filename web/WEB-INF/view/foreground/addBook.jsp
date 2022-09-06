<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/3/26
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="form-group">
            <label for="bkname">书籍名称：</label>
            <input type="text" class="form-control" name="bookName" id="bkname" required>
        </div>
        <div class="form-group">
            <label for="bkcounts">书籍数量：</label>
            <input type="text" class="form-control" name="bookCounts" id="bkcounts" required>
        </div>
        <div class="form-group">
            <label for="bkdetail">书籍介绍：</label>
            <input type="text" class="form-control" name="detail" id="bkdetail" required>
        </div>
        <div class="form-group">
            <input type="submit" style="width: 150px;float: right" class="form-control" value="添加">
        </div>
    </form>
</div>
</body>
</html>
