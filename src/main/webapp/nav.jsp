<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="commons/inc.jsp" %>
<style>
    #avatar{
        height: 30px;
    }
    .nav li{
        top: -5px;
    }
</style>
<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">首页</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <%-- todo --%>
            <c:if test="${sessionScope.user eq null}">
                <li><a href="sign-up.jsp"><span class="glyphicon glyphicon-user"></span> Sign up</a></li>
                <li><a href="sign-in.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign in</a></li>
            </c:if>
            <c:if test="${sessionScope.user ne null}">
                <li><a class="pop" href="#" data-toggle="popover" data-container="body" data-trigger="hover" data-placement="bottom" title="Header..."
                       data-content="<a href=&quot;/user/signOut&quot;>Sign out</a>">
                    <img id="avatar" class="avatar img-circle" src="/assets/avatar/${sessionScope.user.userInfo.avatar}"> ${sessionScope.user.email}</a></li>
            </c:if>
        </ul>
    </div><!-- /.navbar-collapse -->
</div><!-- /.container-fluid -->
<script>
    $(function () {
        $(".pop").popover({ trigger: "manual" , html: true, animation:false})
            .on("mouseenter", function () {
                var _this = this;
                $(this).popover("show");
                $(".popover").on("mouseleave", function () {
                    $(_this).popover('hide');
                });
            }).on("mouseleave", function () {
            var _this = this;
            setTimeout(function () {
                if (!$(".popover:hover").length) {
                    $(_this).popover("hide");
                }
            }, 300);
        });
    });
</script>