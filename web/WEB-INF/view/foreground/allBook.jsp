<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/3/24
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/statics/modules/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/modules/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/modules/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/modules/layui/css/modules/laydate/default/laydate.css">

</head>
<body>
    <div class="container">

        <div class="row clearfix" >
            <div class="col-md-12 column">
                 <div class="page-header">
                     <h1>
                         <small>书籍列表 ———— 显示书籍信息</small>
                     </h1>
                 </div>
            </div>

            <div class="row">
                <div class="col-md-4 column">
                    <%--toAddBook--%>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
                </div>
                <div class="col-md-4 column"></div>
                <div class="col-md-4 column">
                    <%--查询功能--%>
                    <form  class="form-inline" style="float: right">
                        <input type="text" id="bookName"  name="queryBookName" class="form-control" placeholder="请输入要查询的书籍名称" style="padding-right: 0;margin-right: -8px">
                        <input type="button" onclick="queryBooks()" value="查询" class="btn btn-primary">
                    </form>
                    <script type="text/javascript">
                        function queryBooks(){
                            let bookName = $('#bookName').val();
                            let html = $('#table');
                            html.empty();
                            $.ajax({
                                type: 'GET',
                                url: '${pageContext.request.contextPath}/book/ajaxQueryBook?bookName='+bookName+'',
                                contentType: 'application/json;charset=UTF-8',
                                dataType: 'json',
                                sync: true,
                                success:function (list){
                                    console.log(list.data);
                                    if (list.bool){
                                        for (let i = 0;i<list.data.length; i++){
                                            let model =
                                                '  <tr><td>'+list.data[i].bookID+'</td>'+
                                                '      <td>'+list.data[i].bookName+'</td>'+
                                                '      <td>'+list.data[i].bookCounts+'</td>'+
                                                '      <td>'+list.data[i].detail+'</td>' +
                                                '     <td><a href="${pageContext.request.contextPath}/book/toUpdate/'+list.data[i].bookID+'">修改</a></td>'+
                                                '     <td><a href="${pageContext.request.contextPath}/book/deleteBook/'+list.data[i].bookID+'">删除</a></td>'+
                                                '  </tr>';
                                            html.append(model);
                                        }
                                    }
                                    else {
                                        alert(list.msg);
                                    }

                                }
                            })
                        }
                    </script>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-12 column">
                <table  class="table table-hover table-striped">
                    <thead>
                         <tr>
                             <th>书籍编号</th>
                             <th>书籍名称</th>
                             <th>书籍数量</th>
                             <th>书籍详情</th>
                             <th>操作</th>
                         </tr>
                    </thead>
                    <tbody id="table">
                       <%-- <c:forEach var="book" items="${list}">
                            <tr>
                                 <td>${book.bookID}</td>
                                 <td>${book.bookName}</td>
                                <td>${book.bookCounts}</td>
                                <td>${book.detail}</td>
                                 <td><a href="${pageContext.request.contextPath}/book/toUpdate/${book.bookID}">修改</a></td>&ndash;%&gt;
                                 <td><a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}">删除</a></td>&ndash;%&gt;
                           </tr>
                       </c:forEach>--%>
                       <script type="text/javascript">
                           $(document).ready(bookModel())
                           function bookModel(){
                               let html = $('#table');
                               $.ajax({
                                   type : 'post',
                                   url : '${pageContext.request.contextPath}/book/ajaxAllBook',
                                   contentType : 'application/json;charset=UTF-8',
                                   sync : true,
                                   dataType : 'json',
                                   success : function (list){
                                       console.log(list.data);
                                       for (let i = 0;i<list.data.length; i++){
                                           let model =
                                               '  <tr><td>'+list.data[i].bookID+'</td>'+
                                               '      <td>'+list.data[i].bookName+'</td>'+
                                               '      <td>'+list.data[i].bookCounts+'</td>'+
                                               '      <td>'+list.data[i].detail+'</td>' +
                                               '     <td><a href="${pageContext.request.contextPath}/book/toUpdate/'+list.data[i].bookID+'">修改</a></td>'+
                                               '     <td><a href="${pageContext.request.contextPath}/book/deleteBook/'+list.data[i].bookID+'">删除</a></td>'+
                                               '  </tr>';
                                           html.append(model);
                                       }
                                   }
                               })
                           }
                       </script>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</body>
</html>
