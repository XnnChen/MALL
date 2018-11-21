<%--
  Created by IntelliJ IDEA.
  User: xc
  Date: 2018/11/2
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<header>
<style>
    @import "assets/bootstrap/css/bootstrap.css";
    @import "assets/styles/global.css";
    h4{
        text-align: center;
    }
</style>
</header>
<body>
<div class="container">
    <div class="col-lg-6">
        <p>
            <h4>logo....</h4>
        </p>
    </div>
    <div class="col-lg-6">
        <form class="navbar-form navbar-right">
            <div class="input-group" id="search">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                <button class="btn btn-default glyphicon glyphicon-search" type="submit"></button>
                <button class="btn btn-default glyphicon glyphicon-shopping-cart" type="submit"></button>
            </span>
            </div><!-- /input-group -->
        </form>
    </div>
</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script>
    <%--$(function () {--%>
        <%--$.ajax({--%>
            <%--url:'${ctx}/category/index',--%>
            <%--type: 'post',--%>
            <%--dataType: 'json',--%>
            <%--success:function (data) {--%>
                <%--$('ul#nav').append('<li><a href="">'+${sessionScope.category.title}+'</a></li>')--%>
            <%--}--%>
        <%--})--%>
    <%--})--%>
</script>
</html>
