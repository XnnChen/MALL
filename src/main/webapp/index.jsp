<%--
  Created by IntelliJ IDEA.
  User: xc
  Date: 2018/10/29
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
  <head>
    <title>index page</title>
    <style>
      @import "assets/bootstrap/css/bootstrap.css";
      @import "assets/styles/global.css";
      #nav{
        height: 0px;
      }
      header.jumbotron{
        background-color: #fff !important;
      }
    </style>
  </head>
  <body>
  <nav id="nav" class="index navbar navbar-inverse"></nav>
  <header class="index jumbotron"></header>
  <main class="container"></main>
  <footer class="index jumbotron"></footer>
  <script src="assets/scripts/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.js"></script>
  <script src="assets/scripts/global.js"></script>
  </body>
</html>
