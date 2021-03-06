<%--
  Created by IntelliJ IDEA.
  User: xc
  Date: 2018/11/2
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <title>sign in page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/sign.css";
        @import "assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse"></nav>
<header class="index jumbotron"></header>
<main class="container">
    <div class="title-line">
        <span class="tit">登录</span>
    </div>
    <section class="col-md-4 col-md-offset-4">
        <form action="${ctx}/user/signIn" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" value="tom@tom.com">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" class="form-control" value="123">
            </div>
            <button id="signIn" type="submit" class="btn btn-primary btn-block">登录</button>
        </form>
        ${requestScope.message}
    </section>
</main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
</body>
</html>
