<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89811
  Date: 2019/11/28
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/swiper3.07.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/myfocus-2.0.1.min.js"></script>
    <script src="js/main.js"></script>

    <style>
        body{
            background-color:#FCFCFC;
        }
        .swiper-container {
            width: 1100px;
            height: 300px;
            margin: 0 auto;
        }
    </style>
    <title>微商城(WSC.COM)</title>
    <script>
        $(function () {

            $.ajax({
                url: 'productSearch/loadFirst',//请求URL
                data: {},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data);
                    var productList1=data.productList1;
                    var length=productList1.length;
                    for(var index=0;index<length;index++){
                        var pro=productList1[index];
                        $("#firstId").append(' <dl>' +
                            '<dt>' +
                            '<a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'"><img src="'+pro.pdCover+'" alt="" height="120px"/>' +
                            '</a></dt><dd><p><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">'+pro.pdName.substring(0,17)+'...'+'</a></p>' +
                            '<p></p>' +
                            '<p><s></s>￥ '+pro.pdPrice+'</p> </dd></dl>');
                    }

                    var productList2=data.productList2;
                    var length2=productList2.length;
                    for(var index=0;index<length2;index++){
                        var pro=productList2[index];
                        $("#secondId").append(' <div class="swiper-slide" >' +
                            '<dl> <dt><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">' +
                            '<img src="'+pro.pdCover+'" alt="" height="120px"/></a></dt>' +
                            '<dd> <p><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">'+pro.pdName.substring(0,17)+'...'+'</a></p> ' +
                            '<p></p> <p><s></s> ￥'+pro.pdPrice+'</p>' +
                            ' </dd></dl></div>');
                    }

                    var productList3=data.productList3;
                    var length3=productList3.length;
                    for(var index=0;index<length3;index++){
                        var pro=productList3[index];
                        $("#thirdId").append(' <dl>' +
                            '<dt>' +
                            '<a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'"><img src="'+pro.pdCover+'" alt="" height="120px"/>' +
                            '</a></dt><dd><p><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">'+pro.pdName.substring(0,17)+'...'+'</a></p>' +
                            '<p></p>' +
                            '<p><s></s>￥'+pro.pdPrice+'</p> </dd></dl>');
                    }

                    var swiper = new Swiper('.swiper-container', {
                        pagination: '.swiper-pagination',
                        slidesPerView: 7,
                        paginationClickable: true,
                        grabCursor: true,
                        spaceBetween: 30
                    });

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 请求失败
                    console.error(errorThrown);
                }
            });
        });
    </script>
</head>
<body>
<div class="top" id="item4">
    <div class="container clearfix">
        <ul class="clearfix fr">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a href="/user/userLogin.jsp">您好，请登录</a></li>
                    <li><a href="/user/add_user.jsp">免费注册</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/user/info.jsp">您好，${sessionScope.user.userName}</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="/my-order.jsp">我的订单</a></li>
            <li><a href="/collect/querypro">我的收藏夹</a></li>
            <li><a href="/shop/queryshop">我的购物车</a></li>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a href="/useradd/getUseradd" style="border: none">我的地址</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/useradd/getUseradd">我的地址</a></li>
                    <li><a href="/user/logout" style="border: none">退出登录</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>

<div class="header">
    <div class="container clearfix">
        <div class="logo fl">
            <a href="userIndex.jsp"><img src="images/logo4.png" alt=""/></a>
        </div>
        <div class="seacher fl">
            <form action="/product_likesearch.jsp" method="post">
                <input type="text" placeholder="小伙伴，你想找什么?" name="pdName"/><input type="submit" value="搜 索"/>
            </form>
            <p>热门搜索：
                <a href="product_flsearch.jsp?oneId=14&name=男鞋">男装</a>
                <a href="product_flsearch.jsp?twoId=1&name=潮流鞋子">潮流鞋子</a>
                <a href="product_flsearch.jsp?oneId=3&name=手机数码">手机数码</a>
                <a href="product_flsearch.jsp?oneId=8&name=家居家具">家居家具</a>
            </p>
        </div>

    </div>
</div>


<div class="container">
    <div class="row clearfix">

        <div class="col-md-6 column">
            <div class="carousel slide" id="carousel-907766">
                <ol class="carousel-indicators">
                    <li data-slide-to="0" data-target="#carousel-907766">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-907766" class="active">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-907766">
                    </li>
                    <li data-slide-to="3" data-target="#carousel-907766">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item" >
                        <a href="#">
                            <img alt="" src="images/f1.webp"/>
                        </a>
                    </div>
                    <div class="item active">
                        <a href="#">
                            <img alt="" src="images/f2.webp"/>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img alt="" src="images/f3.jpg"/>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img alt="" src="images/f4.webp"/>
                        </a>
                    </div>
                </div> <a class="left carousel-control" href="#carousel-907766" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-907766" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>

        <div class="col-md-3 column">
            <div class="mid">
                <a href="#">
                    <img alt="" src="images/qz.png" style="height: 442px;"/>
                </a>
            </div>
        </div>
        <div class="col-md-3 column">
            <div class="mid">
                <a href="#">
                    <img alt="" src="images/three.webp" style="height: 442px;"/>
                </a>
            </div>
        </div>

        <%--<div class="col-md-3 column">--%>
            <%--<div class="right" >--%>

            <%--</div>--%>
        <%--</div>--%>
    </div>


    <div class="jiaocai clearfix" id="item1">
        <h1>好货小屋<span></span></h1>
        <div class="list fl">
            <ul class="one" id="ulId">
                <li><a href="product_flsearch.jsp?oneId=1&name=男鞋">男鞋</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=1&name=流行男鞋">流行男鞋</a></li>
                        <li><a href="product_flsearch.jsp?twoId=2&name=网络潮牌">网络潮牌</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=2&name=个护清洁">个护清洁</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=3&name=明星品牌">明星品牌</a></li>
                        <li><a href="product_flsearch.jsp?twoId=4&name=纸品湿巾">纸品湿巾</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=3&name=手机数码">手机数码</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=5&name=手机">手机</a></li>
                        <li><a href="product_flsearch.jsp?twoId=10&name=手机配件">手机配件</a></li>
                        <li><a href="product_flsearch.jsp?twoId=11&name=摄影摄像">摄影摄像</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=4&name=钟表珠宝">钟表珠宝</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=12&name=腕表">腕表</a></li>
                        <li><a href="product_flsearch.jsp?twoId=13&name=黄金">黄金</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=5&name=家用电器">家用电器</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=14&name=电视">电视</a></li>
                        <li><a href="product_flsearch.jsp?twoId=15&name=空调">空调</a></li>
                        <li><a href="product_flsearch.jsp?twoId=16&name=洗衣机">洗衣机</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=8&name=家居家具">家居家具</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=17&name=灯饰照明">灯饰照明</a></li>
                        <li><a href="product_flsearch.jsp?twoId=18&name=五金工具">五金工具</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=9&name=运动户外">运动户外</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=19&name=运动鞋包">运动鞋包</a></li>
                        <li><a href="product_flsearch.jsp?twoId=20&name=运动服饰">运动服饰</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=14&name=男装">男装</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=21&name=羽绒服">羽绒服</a></li>
                        <li><a href="product_flsearch.jsp?twoId=22&name=休闲裤">休闲裤</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=15&name=女装">女装</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=23&name=外套">外套</a></li>
                        <li><a href="product_flsearch.jsp?twoId=24&name=女士上衣">女士上衣</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=16&name=箱包手袋">箱包手袋</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=25&name=精品男包">精品男包</a></li>
                        <li><a href="product_flsearch.jsp?twoId=26&name=功能箱包">功能箱包</a></li>
                    </ul>
                </li>
                <li><a href="product_flsearch.jsp?oneId=17&name=母婴童装">母婴童装</a>
                    <ul class="two">
                        <li><a href="product_flsearch.jsp?twoId=27&name=婴童寝居">婴童寝居</a></li>
                        <li><a href="product_flsearch.jsp?twoId=28&name=奶粉">奶粉</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="book fr" id="firstId">

        </div>
    </div>

    <div class="jiaocai clearfix" id="item2">
        <h1>精挑细选<span></span></h1>
        <div class="swiper-container">
            <div class="swiper-wrapper" id="secondId">

            </div>
            <!--<div class="swiper-pagination"></div>-->
        </div>
        <script src="js/swiper3.07.min.js"></script>
        <script>
            var swiper = new Swiper('.swiper-container', {
                pagination: '.swiper-pagination',
                slidesPerView: 7,
                paginationClickable: true,
                grabCursor: true,
                spaceBetween: 30
            });
        </script>
    </div>

    <div class="jiaocai clearfix" id="item3">
        <h1>你喜欢的<span></span></h1>
        <div class="book clearfix" style="margin: 0 auto;width: 1130px;" id="thirdId">
        </div>
    </div>

</div>
<div class="foot">
    <div class="container" >

        <div class="zhinan">
            <ul class="clearfix">
                <li class="item-li">购物指南
                    <ul>
                        <li><a href="#">支付担保安全！</a></li>
                        <li><a href="#">如何退换货呢？</a></li>
                        <li><a href="#">会员有哪些优惠？</a></li>
                        <li><a href="#">多长时间能送达？</a></li>
                    </ul>
                </li>
                <li class="item-li">配送与支持
                    <ul>
                        <li><a href="#">我们的配送方式。</a></li>
                        <li><a href="#">配送费说明</a></li>
                        <li><a href="#">我们的配送范围。</a></li>
                        <li><a href="#">发货方式有哪些？</a></li>
                    </ul>
                </li>
                <li class="item-li">支付方式
                    <ul>
                        <li><a href="#">支付方式有哪些？</a></li>
                        <li><a href="#">购物如何支付</a></li>
                        <li><a href="#">支付步骤</a></li>
                    </ul>
                </li>
                <li class="item-li">售后服务
                    <ul>
                        <li><a href="#">退换货注意事项</a></li>
                        <li><a href="#">不退换货说明</a></li>
                        <li><a href="#">售后服务流程</a></li>
                    </ul>
                </li>
                <li class="item-li" style="margin: 0">帮助信息
                    <ul>
                        <li><a href="#">二手交易说明</a></li>
                        <li><a href="#">隐私安全</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="line"></div>

        <div class="bottom">
            <p>本站所有信息均为用户自由发布，本站不对信息的真实性负任何责任，交易时请注意识别信息的真假如有网站内容侵害了您的权益请联系我们删除，举报电话：15068718875</p>
            <p>技术支持：WSC &nbsp;&nbsp;商务QQ:898111218 &nbsp;&nbsp;邮箱：898111218@qq.com</p>
        </div>
    </div>
</div>
<div class="fixnav">
    <ul>
        <li><a href="#" title="1">好货小屋</a></li>
        <li><a href="#" title="2">精挑细选</a></li>
        <li><a href="#" title="3">你喜欢的</a></li>
        <li><a href="#" title="4">返回顶部</a></li>
    </ul>
</div>
</body>
</html>