<%--
  Created by IntelliJ IDEA.
  User: xc
  Date: 2018/11/7
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <title>upload page</title>
    <style>
        span{
            background-color: #2aabd2;
            cursor: pointer;
            color: #fff;
            font-size: 12px;
        }
    </style>
</head>
<body>
<h1>upload</h1>
<form action="${ctx}/upload/test" method="post" enctype="multipart/form-data">
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <span id="addUpload">+</span>
    <br>
    <input type="submit" value="Upload">
</form>
<script src="assets/scripts/jquery.min.js"></script>
<script>
    $(function () {
        console.log('test');
        $('span#addUpload').on('click', function () {
            $('<p><input type="file" name="photoFiles"></p>').insertBefore($(this));
        });
    });
</script>
</body>
</html>
