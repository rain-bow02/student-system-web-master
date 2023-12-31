<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body id="total">
<div id="log">
    <ul>
        <li>
            <h3>学生信息管理系统</h3>
        </li>
        <li>账号：<input type="text" id="userName" autofocus></li>
        <li>密码：<input type="password" id="password"></li>
        <li><input type="button" class="button login" value="登录" onclick="login()">
            <input type="button" class="button logup" value="注册" onclick="logup()">
        </li>
    </ul>
</div>
</body>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    li {
        height: 40px;
        list-style: none;
    }

    #total {
        background-image: url("imgs/2.jpg");

        background-repeat: no-repeat;
        background-size: 100% auto;
    }

    #log {
        position: absolute;
        left: 50%;
        top: 40%;
        transform: translate(-50%, -50%);
        width: 300px;
        height: 160px;
        padding: 20px;
        text-align: center;
        background-color: #e1fff5;
    }

    .button {
        width: 40px;
        height: 30px;
        border: none;
        border-radius: 30%;
        background-color: azure;
    }

    .button:hover {
        background-color: #0be7ff;
    }

    .login {
        margin-right: 30px;
    }

    .logup {
        margin-left: 50px;
    }

</style>

<script>

    function Ajax(url, type, data, success, error) {
        $.ajax({
            url: url,
            type: type,
            data: data,
            dataType: "json",
            success: success,
            error: error
        })
    }

    /**
     * 登录，向后台请求，验证输入的账号和密码
     */
    function login() {
        //获取前台input的值
        let userName = $("#userName").val();
        let password = $("#password").val();

        //以json形式存储
        let user = {
            userName: userName,
            password: password
        }

        //指定后台接口地址
        // let url = "http://localhost/UserLogin";
         let url = "http://127.0.0.1:8080/student/UserLogin";

        //发送请求
        Ajax(url, "post", user, function (res) {
            console.log("请求成功", res);
            //获取后台传回的数据
            isSuccessShow(res.success);
        }, function (err) {
            console.log("请求失败", err);
        })
    }

    /**
     * 根据返回判断后面的操作，登录成功后跳转页面
     * @param isSuccess
     */
    function isSuccessShow(isSuccess) {
        if (isSuccess) {
            alert("success");
            window.location.href = "view/index.html";
        } else {
            alert("登录失败！！！");
            $("#userName").val("");
            $("#password").val("");
        }
    }

</script>

</html>
