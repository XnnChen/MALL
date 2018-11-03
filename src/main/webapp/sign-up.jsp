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
    <title>sign up page</title>
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
        <span class="tit">注册</span>
    </div>
    <section class="col-md-4 col-md-offset-4">
        <form action="${ctx}/user/signUp" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control">
                <span id="hint">${requestScope.message}</span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" class="form-control">
            </div>
            <button id="signUp" type="submit" class="btn btn-success btn-block">注册</button>
        </form>
    </section>
</main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
</body>
</html>
