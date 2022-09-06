<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>welcome</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="../${pageContext.request.contextPath}/statics/js/jquery.js"></script>
    <script src="../${pageContext.request.contextPath}/statics/modules/layui/layui.js"></script>
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/layui.css">
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="../${pageContext.request.contextPath}/statics/modules/layui/css/modules/laydate/default/laydate.css">

    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
        }

        body {
            height: 100%;
        }

        .container {
            height: 100%;
            background-image: linear-gradient(to right, #fbc2eb, #a6c1ee);
        }

        .login-wrapper {
            background-color: #fff;
            width: 358px;
            height: 588px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 180px;
            -webkit-background-clip: text;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            color:  transparent;
        }

        .input-item {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128, 125, 125);
            font-size: 15px;
            outline: none;
        }

        .input-item::placeholder {
            text-transform: uppercase;
        }

        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            font-size: 15px;
            font-weight: bold;
            color: #fff;
            transition: all 0.5s linear 0s;
        }
        .btn:hover{
            background-image: linear-gradient(to left, #a6c1ee, #fbc2eb);
            color: red;
        }

        .msg {
            text-align: center;
            line-height: 88px;
        }

        a {
            text-decoration-line: none;
            color: #abc1ee;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-wrapper">
        <div class="header">Welcome!</div>
        <div class="form-wrapper">
            <form >
                <input type="text" id="username" name="userName" placeholder="username"  class="input-item">
                <input type="password" id="pass" name="userPass" placeholder="password"  class="input-item">
                <input type="button" id="login" onclick="checkLogin()" class="btn" value="Login" style="border: none;margin-top: 10px" >
<%--                <div class="btn" style="">Login</div>--%>
                <script type="text/javascript">
                    function checkLogin(){
                        let username = $("#username").val();
                        let pass = $("#pass").val();
                        console.log("username ===="+username+" pass ==="+pass);

                        $.ajax({
                            type : 'post',
                            url : '${pageContext.request.contextPath}/checkIn',
                            data : JSON.stringify(
                                {
                                    userName:username,
                                    userPass:pass
                                }
                            ),
                            contentType: "application/json;charset=UTF-8",
                            sync : true,
                            dataType : "json",
                            success:function (data){
                               if (data.bool){
                                   let layer = layui.layer;
                                   layer.msg(data.msg,{
                                       icon : 1,
                                   });
                                   setTimeout(function (){
                                       window.location.href = "${pageContext.request.contextPath}/book/allBook";
                                   },1500)
                               }
                               else {
                                   let layer = layui.layer;
                                   layer.msg(data.msg);
                                   $("#username").val("");
                                   $("#pass").val("");
                               }
                            }
                        })
                    }
                </script>
            </form>

        </div>
        <div class="msg">
            还没注册？
            <a href="#">请点击我</a>
            <div style="width: 100%;height: 20px"></div>
            <a href="#" style="float: right">忘记密码？</a>
        </div>
    </div>
</div>
</body>
</html>
