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
      article{
        background: #f9f2f4 no-repeat center center;
        height: 245px;
      }
      article:hover {
        opacity: .8;
      }
      p.t {
        margin-top: 5px;
        font-weight: bolder;
      }

      p.t:hover {
        color: #b4a078;
      }

      p.p b {
        color: #d4282d;
        margin-right: 20px;
      }

      p.p s {
        color: #bbb;
        text-decoration: line-through;
      }

      p.d {
        color: #999;
      }
      p.t, p.p, p.d {
        text-align: center;
      }

      article, p.t {
        cursor: pointer;
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
<script>
  $(function () {
      $.ajax({
          url: '${ctx}/product/index',
          type: 'post',
          dataType: 'json',
          success:function (data) {
              $.each(data, function (index, item) {
                  $('main').append('<section id="' + item.id + '" class="col-md-3"><article></article><p class="t"></p><p class="p"><b></b><s></s></p><p class="d"></p></section>')
                  var section = $('#' + item.id);
                  section.find('article').css('background-image', 'url(pictures/cover/' + $.parseJSON(item.coverPicture)[0] + ')');
                  section.find('p.t').text(item.title + item.id);
                  section.find('p.p b').text("￥" + item.price);
                  section.find('p.p s').text("￥" + item.originalPrice);
                  section.find('p.d').text(item.desc);
              });
          }
      });

      $(document).on('click', 'article, p.t',function () {
          var id = $(this).parent('section').attr('id');
          window.location.href = 'detail.jsp?id=' + id;
      })
  });
</script>
</html>
