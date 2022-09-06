<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/4/14
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/statics/modules/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/modules/layui/css/layui.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/statics/modules/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/statics/modules/layui/css/modules/laydate/default/laydate.css">
    <style>
          .file{
          }
          .file img{
              width: 300px;
              height: 250px;
          }
          .box{
              width: 100%;
              height: 200px;
          }

          .box ul{
              height: auto;
              list-style-type: none;
              display: flex;
              flex-direction: row;
              justify-content: center;
              border: 0;
              margin-bottom: 20px;
          }

          .box ul li{
              list-style: none;
              height: auto;
              margin: 10px;
          }

    </style>
</head>
<body>
<div class="container">
    <div class="layui-upload">
        <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
        <div class="layui-upload-list">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>文件名</th>
                    <th>大小</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="demoList"></tbody>
            </table>
        </div>
        <button type="button" class="layui-btn" id="testListAction">开始上传</button>
    </div>
</div>
<script>
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
        //多文件列表示例
        var demoListView = $('#demoList')
            , uploadListIns = upload.render({
            elem: '#testList'
            , url: '${pageContext.request.contextPath}/file/uploadDocs/'
            , accept: 'file'
            , method: 'post'
            , multiple: true
            , auto: false
            , bindAction: '#testListAction'
            , choose: function (obj) {
                let files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function (index, file, result) {
                    let tr = $(['<tr id="upload-' + index + '">'
                        , '<td>' + file.name + '</td>'
                        , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                        , '<td>等待上传</td>'
                        , '<td>'
                        , '<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        , '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        , '</td>'
                        , '</tr>'].join(''));
                    //单个重传
                    tr.find('.demo-reload').on('click', function () {
                        obj.upload(index, file);
                    });
                    //删除
                    tr.find('.demo-delete').on('click', function () {
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });
                    demoListView.append(tr);
                });
            }
            , done: function (res, index, upload) {
                if (res.code === 0) { //上传成功
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
                console.log(res);//服务器响应信息
                console.log(index);//当前文件的索引
                console.log(upload);//重新上传的方法
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                console.log(index);//当前文件的索引
                console.log(upload);//重新上传的方法
            }
        });
    });
</script>
<div class="layui-upload" style="margin-top: 200px">
    <button type="button" class="layui-btn" id="test1">上传图片</button>
    <div class="layui-upload-list">
        <div class="layui-upload-list" id="demo2"></div>
        <p id="demoText"></p>
    </div>
    <div style="width: 95px;">
        <div class="layui-progress layui-progress-big" lay-showpercent="yes" lay-filter="demo">
            <div class="layui-progress-bar" lay-percent=""></div>
        </div>
    </div>
    <button type="button" class="layui-btn" id="test9">开始上传</button>
</div>
<script type="text/javascript">
    layui.use(['upload', 'element', 'layer'], function() {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , layer = layui.layer;

        //常规使用 - 普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '${pageContext.request.contextPath}/file/uploadDocs' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            ,auto: false
            ,multiple: true
            ,bindAction: '#test9'
            ,choose:function (obj){
                //预览上传图片
                obj.preview(function(index, file, result){
                    let imge = $('#demo2');
                    imge.empty();
                    imge.append('<a href="#" οnclick="openImg();">' +
                        '<img id="showImg" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" width="250px" height="200px">' +
                        '</a>')
                });
            }
            ,before: function(obj){
                element.progress('demo', '0%'); //进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            }
            ,done: function(res){
                //如果上传失败
                if(res.code === -1){
                    return layer.msg('上传失败');
                }
                //上传成功的一些操作
                openImg();
                //……
                $('#demoText').html(''); //置空上传失败的状态
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
            //进度条
            ,progress: function(n, elem, e){
                element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
                if(n === 100){
                    layer.msg('上传完毕', {icon: 1});
                }
            }
        });
    })
    /*查看大图*/
    function openImg() {
        let idBar = $('#showImg');
        let src = idBar[0].src;
        let width = idBar.width();
        let height = idBar.height();
        let scaleWH = width / height;        let bigH = 550;
        let bigW = scaleWH * bigH;
        if (bigW > 1000) {
            bigW = 1000;
            bigH = bigW / scaleWH;
        } // 放大预览图片
        parent.layer.open({
            type: 1,
            title: false,
            closeBtn: 1,
            shadeClose: true,
            area: [bigW + 'px', bigH + 'px'], //宽高
            content: '<img width="' + bigW + '" src="' + src + '" height=" '+bigH+' " />'
        });
    }
</script>

<div class="file">
    <div class="box">
        <ul class="ul"></ul>
    </div>
</div>
<div id="page" style="margin: 0 auto;width: 750px;height:50px;margin-top: 50px"></div>

<script>
    var datas;
    $(document).ready(function (){
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/file/getFile/'+1+'/'+0+'',
            dataType: 'json',
            async: false,
            success: function (data1){
               datas = data1;
            }
    })
    })
    function pagesByFile(pageNum,pageSize){
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/file/getFile/'+pageNum+'/'+pageSize+'',
            dataType: 'json',
            async: false,
            success: function (data1){
                //加载后台返回的list集合数据
                datas=data1;
                let data = data1.data.list;
                console.log(data)
                for (let i = 0 ;i < data.length; i++){
                    $('.ul').append( '<li><img  src="'+'${pageContext.request.contextPath}/statics/upload/' + data[i].fileName +'"   width="250px" height="200px"></li>' );
                }
            }
        })

    }

    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;

        //完整功能
        laypage.render({
             elem: 'page'
            ,count: datas.data.total
            ,curr:1
            ,first:1
            ,limit:2
            ,limits:[2,5,10]
            ,groups:3
            ,theme: '#c993f6'
            ,button: []
            ,last:datas.data.pages
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            ,jump: function(obj,first){
                $('.ul').empty();
                pagesByFile(obj.curr,obj.limit)
            }
        });

    })

</script>
</body>
</html>
