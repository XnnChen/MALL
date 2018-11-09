<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>product add page</title>
        <style>
            span{
                background-color: #1b6d85;
                color: #fff;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <h1>ADD Product</h1>
        <form action="${ctx}/product/create" method="post" enctype="multipart/form-data">
            <input name="title" placeholder="TITLE"><br>
            <input name="desc" placeholder="DESC"><br>
            <input name="price" placeholder="PRICE"><br>
            <input name="originalPrice" placeholder="ORIGINAL PRICE"><br>
            封面图片：<br>
            <input type="file" name="coverPictureFile"><br><hr>
            滑动图片组：<br>
            <input type="file" name="slidePictureFiles"><br>
            <input type="file" name="slidePictureFiles"><br>
            <input type="file" name="slidePictureFiles"><br>
            <input type="file" name="slidePictureFiles"><br>
            <input type="file" name="slidePictureFiles"><br><hr>
            详情图片：<br>
            <input type="file" name="detailPictureFiles"><br>
            <span>Add File</span><br>
            <input name="spec" placeholder="SPEC"><br>
            <input name="stock" placeholder="STOCK"><br>
            <select name="status">
                <option value="0">上架</option>
                <option value="1">暂存</option>
            </select><br>
            <input type="submit" value="ADD">
        </form>
        <script src="../../assets/scripts/jquery.min.js"></script>
        <script>
            $(function () {
                $("span").on("click", function () {
                    $('<input type="file" name="detailPictureFiles"><br>').insertBefore($(this));
                });
            });
        </script>
    </body>
</html>