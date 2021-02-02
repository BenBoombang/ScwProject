<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/27
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form id="regForm" class="form-signin" role="form" method="post" action="${pageContext.request.contextPath}/permission/user/reg">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户注册</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" name="loginacct" id="loginacct_input" value="${errorUser.loginacct}" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" class="form-control" name="userpswd" id="userpswd_input" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="email" class="form-control" name="email" id="email_input" value="${errorUser.email}" placeholder="请输入邮箱地址" style="margin-top:10px;">
            <span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <select class="form-control" >
                <option>会员</option>
                <option>管理</option>
            </select>
        </div>
        <div class="checkbox">
            <label>
                忘记密码
            </label>
            <label style="float:right">
                <a href="${pageContext.request.contextPath}/login.jsp">我有账号</a>
            </label>
        </div>
        <a id="regBtn" class="btn btn-lg btn-success btn-block" > 注册</a>
    </form>

    <input type="hidden" value="${errorMsg}" id="hiddenErrorMsg">
</div>
<script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/layer/layer.js"></script>

<script>
    $(function () {
        $("#regBtn").click(function () {

            // 获取登录账号的内容
            var loginacct = $("#loginacct_input").val();
            if (loginacct.trim() == "") {
                layer.msg("账号不能为空", {time:2000, icon:0}, function () {
                    //
                });
                return false;
            }

            if (loginacct.indexOf(" ") != -1) {
                layer.msg("账号不能包含空格或为空格", {time:2000, icon:0}, function () {
                    //
                });
                return false;
            }

            // 获取密码的内容
            var password = $("#userpswd_input").val();
            if (password == ""){
                layer.msg("密码不能为空", {time:2000, icon:0}, function () {
                    //
                });
                return false;
            }

            // 获取邮箱的内容
            var regEmail = $("#email_input").val();
            if (regEmail == "") {
                layer.msg("邮箱不能为空", {time:2000, icon:0}, function () {
                    //
                });
                return false;
            }

            var loginType = $("select.form-control").val();
            if (loginType == "管理") {
                $("#regForm").submit();
            }else {
                layer.msg("此功能尚未开通", {time:2000, icon:0}, function () {
                    //
                });
            }

            // 终止掉默认行为
            return false;
        })
    });

    $(function(){
        // 判断隐藏域中有没有值，有值，则弹窗显示
        var errorMessage = $("#hiddenErrorMsg").val();
        if (errorMessage != "") {
            layer.msg("注册失败，用户名已存在", {time:2000, icon:0}, function () {
                //
            });
        }
    })
</script>
</body>
</html>
