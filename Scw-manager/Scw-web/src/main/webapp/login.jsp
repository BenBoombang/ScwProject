<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/27
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <form id="loginForm" class="form-signin" role="form" method="post" action="${pageContext.request.contextPath}/permission/user/login">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control"
                   name="loginacct" id="loginacct_input" placeholder="请输入登录账号"
                   value="${errorLoginUser.loginacct}" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" class="form-control" name="userpswd" id="userpswd_input" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <select class="form-control" >
                <option value="member">会员</option>
                <option value="manager">管理</option>
            </select>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
            <br>
            <label>
                忘记密码
            </label>
            <label style="float:right">
                <a href="${pageContext.request.contextPath}/reg.jsp">我要注册</a>
            </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
    </form>

    <input type="hidden" id="hiddenLoginErrorMsg" value="${sessionScope.errorLoginMsg}">
    <%-- 在 在这个隐藏域中存好数据后，要将原数据从 session 中移除 --%>
    <c:remove var="errorLoginMsg" scope="session"/>
</div>
<script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/layer/layer.js"></script>
<script>

    $(function(){
       var eorMsg = $("#hiddenLoginErrorMsg").val();
       if (eorMsg != "") {
           layer.msg("登录失败，用户名或密码错误！", {time:2000, icon:0}, function () {
               //
           });
           return false;
       }
    });

    function dologin() {
        var type = $(":selected").val();
        if ( type == "manager" ) {
            $("#loginForm").submit();
            return false;
        } else {
            window.location.href = "${pageContext.request.contextPath}/index.jsp";
        }

        return false;
    }
</script>
</body>
</html>
