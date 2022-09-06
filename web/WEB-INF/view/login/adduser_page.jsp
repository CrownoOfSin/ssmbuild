<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/4/4
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style rel="stylesheet">
        .header{
            font-size: 35px;
            font-weight: bold;
            text-align: center;
            line-height: 50px;
            -webkit-background-clip: text;
            background-image: linear-gradient(to right, #9aa5ce, #4b75d9);
            color:  transparent;
        }
        .grid-demo img{
            width: 220px;
            height: auto;
            margin: 20px;
            margin-top: 0;
            padding-left: 20px;
        }
        .layui-form {
            width: 720px;
            margin: 0 auto;
            border: 1px solid slategrey;
            background-color: white;
        }
        #add{
            margin-left: 120px;
            margin-right: 30px;
        }
        .infoTextarea.change::-webkit-input-placeholder {
            color: red;
        }
    </style>
    <script src="../${pageContext.request.contextPath}/statics/js/jquery.js"></script>
    <script src="../${pageContext.request.contextPath}/statics/modules/layui/layui.js"></script>
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/layui.css">
    <link rel="stylesheet"
          href="../${pageContext.request.contextPath}/statics/modules/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet"
          href="../${pageContext.request.contextPath}/statics/modules/layui/css/modules/laydate/default/laydate.css">

</head>
<body>
<form class="layui-form" action="" >
    <div style="width: 100%;height: 50px;text-align: center">
        <h2 class="header">注大册</h2>
    </div>
    <div class="layui-row">
        <div class="layui-col-xs7">
            <div class="grid-demo grid-demo-bg1">
                <div class="layui-form-item" style="width: auto;">
                    <label class="layui-form-label" style="width: 100px;text-align: center;padding-right: 0px;">用户名：</label>
                    <div class="layui-input-block" >
                        <input type="text" id="username" onfocus="namePut()" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" lay-reqtext="用户名是必填项，岂能为空？"
                               class="layui-input" style="width: 300px;border: 1px solid slategrey;margin-top: 20px">
                    </div>
                </div>
                <div class="layui-form-item" style="width: auto">
                    <label class="layui-form-label" style="width: 100px;text-align: center;padding-right: 0px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                    <div class="layui-input-block" >
                        <input type="password" id="pass" onfocus="passPut()" name="pass" lay-verify="required"  placeholder="请输入密码"
                               autocomplete="off" class="layui-input" style="width: 300px;border: 1px solid slategrey">
                    </div>
                </div>
                <div class="layui-form-item" style="width: auto">
                    <label class="layui-form-label" style="width: 100px;text-align: left;padding-right: 0px;">重新输入密码：</label>
                    <div class="layui-input-block" >
                        <input type="password" id="resetPass" onfocus="restPut()" name="resetPass" lay-verify="required"  placeholder="请重新请输入密码"
                               autocomplete="off" class="layui-input" style="width: 300px;border: 1px solid slategrey">
                    </div>
                </div>
                <div class="layui-form-item" style="width: auto;margin-top: 20px">
                    <input type="button" id="add" class="layui-btn layui-btn-primary layui-border-black" value="注册">
                    <input type="reset" id="clear" class="layui-btn layui-btn-primary layui-border-black" value="取消">
                </div>
                <script type="text/javascript">
                    function namePut(){
                        let name = $( "#username" );
                        name.attr( "placeholder" , "请输入用户名");
                        name.css("border","1px solid slategrey");
                    }
                    function passPut(){
                        let password = $( "#pass" );
                        password.attr( "placeholder" , "请输入密码");
                        password.css("border","1px solid slategrey");
                    }
                    function restPut(){
                        let resetPass = $( "#resetPass" );
                        resetPass.attr( "placeholder" , "请再次输入密码");
                        resetPass.css("border","1px solid slategrey");
                    }
                </script>
            </div>
            <script type="text/javascript">
                $("#add").click(function (){
                    let username = $("#username").val();
                    let pass = $("#pass").val();
                    let rePass = $("#resetPass").val();
                    let layer = layui.layer;
                    if ( pass !== rePass ){
                         layer.alert("两次输入密码不一致!");
                         $("#pass").css("border","1px solid red");
                         $("#resetPass").css("border","1px solid red");
                         return ;
                    }
                    $.ajax({
                        type : 'POST',
                        url : '${pageContext.request.contextPath}/addUser',
                        data : JSON.stringify({
                            userName : username,
                            userPass : pass
                        }),
                        contentType : 'application/json;charset=UTF-8',
                        dataType : 'json',
                        success : function(data){
                            let name = $( "#username" );
                            let password = $( "#pass" );
                            let resetPass = $( "#resetPass" );
                             //密码校验提醒
                             switch (data.code){
                                 case 410 : {
                                     name.val("");
                                     name.attr( "placeholder" , data.msg);
                                     name.addClass("infoTextarea change")
                                     name.css("border","1px solid red");
                                     break;
                                 }
                                 case 411 : {
                                     password.val("");
                                     password.attr("placeholder",data.msg);
                                     password.addClass("infoTextarea change");
                                     password.css("border","1px solid red");
                                     resetPass.val("");
                                     resetPass.attr("placeholder",data.msg);
                                     resetPass.addClass("infoTextarea change");
                                     resetPass.css("border","1px solid red");
                                     break;
                                 }
                                 case 500 : {
                                     layer.alert(data.msg);
                                     break;
                                 }
                                 case 200 : {
                                     layer.msg(data.msg,{
                                         icon : 1,
                                     });
                                     setTimeout(function (){
                                         window.location.href = '${pageContext.request.contextPath}/toLogin'
                                     },1500)
                                     break;
                                 }
                             }
                        }
                    })
                })
            </script>
        </div>
        <div class="layui-col-xs5">
            <div class="grid-demo">
                <img src="${pageContext.request.contextPath}/statics/image/logo.jpg">
            </div>
        </div>
    </div>


</form>
</body>
</html>
