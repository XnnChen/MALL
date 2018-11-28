<%--
  Created by IntelliJ IDEA.
  User: xc
  Date: 2018/11/20
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detail page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
        @import "${ctx}/assets/styles/lightslider.css";

        section article{
            border:1px dashed #ffff00;
        }

        #image-gallery{
            background-color: #f9f2f4;
        }

        .number input{
            border: none;
            padding: 0;
            margin: 0;
            width: 40px;
        }
        .number input:focus{
            outline-width: 0;
        }

        .number span, .number input{
            vertical-align: middle;
            display: inline-block;
            width: 25px;
            text-align: center;
            border: 1px solid #ddd;
            height: 25px;
        }
        .number span{
            font-size: 18px;
            line-height: 25px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        #detail img{
            width: 100%;
        }

        div.row{
            margin-bottom: 30px;
        }

        p.title{
            font-weight: bolder;
            font-size: 1.4em;
        }

        span.price:before{
            content: '￥';
            color: #d4282d;
        }

        span.price{
            color: #d4282d;
            font-size: 1.2em;
            font-weight: bolder;
        }

        span.originPrice{
            text-decoration: line-through;
        }
        span.originPrice:before{
            content: '￥';
        }

        p.limit> span{
            padding-left: 20px;
        }

        #info{
            background-color: #f9f2f4;
            padding: 10px;
            margin: 20px 0;
        }

        #info > ul{
            margin-top: -29px;
            margin-left: 20px;
        }
        div.number{
            padding: 10px;
        }

        i.number-text{
            margin-right: 10px;
            font-style: normal;
        }
        div.action{
            margin-top: 20px;
            padding-left: 10px;
        }

        .action button{
            margin-right: 10px;
        }

        .cursor-disabled {
            cursor: not-allowed;
            color: #ddd;
        }

        .cursor-enabled {
            cursor: pointer;
            color: #333;
        }

        .lSGallery {
            background-color: #f4f4f4;
        }

        #buy{
            border: 1px solid #b4a078;
            width: 168px;
            height: 50px;
            color: #b4a078;
            background-color: #f5f3ef;
            border-radius: 0;
        }
        #buy:hover{
            opacity: .8;
            background-color: #fff;
        }

        #add-cart{
            border: 1px solid #b4a078;
            width: 168px;
            height: 50px;
            color: #f5f3ef;
            background-color: #b4a078 ;
            border-radius: 0;
        }
        #add-cart:hover{
            opacity: .8;
        }

        .number > span{
            width: 36px;
            height: 30px;
        }
        #num{
            width: 40px;
            margin: 0 -5px 0 -5px;
            height: 30px;
        }
    </style>
</head>
<body>
<c:set var="p" value="${sessionScope.product}"/>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <div class="row">
        <section class="col-md-6">
            <article id="slider-picture">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden" title='${p.slidePictures}'></ul>
            </article>
        </section>
        <section class="col-md-6">
            <article id="product" title="${p.id}">
                <p class="title">${p.title}</p>
                <p class="desc text-warning">${p.desc}</p>
                <div id="info">
                    <p class="price">
                        活动价 <span class="price">${p.price}</span>
                        <span class="originPrice">${p.originalPrice}</span>
                    </p>
                    <p class="limit">限制 <span>特价商品不可与优惠券叠加使用</span></p>
                    <p class="service">服务</p>
                    <ul>
                        <li>支持30天无忧退换货</li>
                        <li>48小时快速退款</li>
                        <li>满88元免邮费</li>
                        <li>网易自营品牌</li>
                        <li>国内部分地区无法配送</li>
                    </ul>
                </div>
                <div class="number">
                    <i class="number-text">数量</i>
                    <span id="sub">-</span>
                    <input id="num" name="number" value="1" pattern="\d{1,2}">
                    <span id="add">+</span>
                </div>
                <div class="action">
                    <button id="buy" class="btn btn-lg">立即购买</button>
                    <button id="add-cart" class="btn btn-lg">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        加入购物车
                    </button>
                </div>
            </article>
        </section>
    </div>
    <div class="row">
        <section class="col-md-8">
            <article id="detail" title='${p.detailPictures}'></article>
        </section>
        <section class="col-md-4">
            <article>hot</article>
        </section>
    </div>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script src="${ctx}/assets/scripts/lightslider.js"></script>
<script>
    $(document).ready(function () {

        var imageGallery = $('#image-gallery');
        var slidePictures = imageGallery.attr('title');

        $.each($.parseJSON(slidePictures), function (index, item) {
            var list = '<li data-thumb="pictures/slide/' + item + '"><img src="pictures/slide/' + item + '"/></li>';
            imageGallery.append(list);
        });

        $('#content-slide').lightSlider({
            loop: true,
            keyPress: true
        });

        imageGallery.lightSlider({
            gallery: true,
            item: 1,
            thumbItem: 5,
            slideMargin: 0,
            auto: false,
            loop: true,
            vertical: true,
            verticalHeight: 430,
            onSliderLoad: function () {
                $('#image-gallery').removeClass('cS-hidden');
            }
        });

        /* number begin*/
        var sub = $('#sub');
        var add = $('#add');
        var num = $('#num');

        sub.addClass('cursor-disabled');
        add.addClass('cursor-enabled');

        add.on('click', function () {
            var number = num.val();
            if (number < 99){
                num.val(++number);
            }else {
                add.removeClass('cursor-enabled').addClass('cursor-disabled')
            }
        });

        num.on('keyup', function () {
            var number = num.val();
            if (number <= 0) {
                sub.removeClass('cursor-enabled').addClass('cursor-disabled')
            }else if(number < 99){
                sub.removeClass('cursor-disabled').addClass('cursor-enabled')
                add.removeClass('cursor-disabled').addClass('cursor-enabled')
            }else {
                add.removeClass('cursor-enabled').addClass('cursor-disabled')
            }
        });
        /* number end*/

        var detail = $('#detail');
        var detailPictures = detail.attr('title');

        $.each($.parseJSON(detailPictures), function (index, item) {
            var img = '<img src="pictures/detail/' + item + '"/>';
            detail.append(img);
        });

        // $('#add-cart').on('click', function () {
        //     var productId = $('#product').attr('title');
        //     var number = $('#num').val();
        //     $.ajax({
        //
        //     })
        // })
    });
</script>
</body>
</html>
