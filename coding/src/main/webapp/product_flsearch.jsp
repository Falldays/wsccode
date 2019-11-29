
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


                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 请求失败
                    console.error(errorThrown);
                }
            });

            $.ajax({
                url: 'productSearch/load3',//请求URL
                data: {oneId:"${param.oneId}",twoId:"${param.twoId}"}, //请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data);
                    var productList=data.productList;
                    var length=productList.length;
                    for(var index=0;index<length;index++){
                        var pro=productList[index];
                        $("#flId").append(' <dl>' +
                            '<dt>' +
                            '<a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'"><img src="'+pro.pdCover+'" alt="" height="120px"/>' +
                            '</a></dt><dd><p><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">'+pro.pdName.substring(0,17)+'...'+'</a></p>' +
                            '<p></p>' +
                            '<p><s></s>￥ '+pro.pdPrice+'</p> </dd></dl>');
                    }

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
        <li><a href="userIndex.jsp">首页</a></li>
        <ul class="clearfix fr">
            <li><a href="#">您好，请登录</a></li>
            <li><a href="#">免费注册</a></li>
            <li><a href="#">我的订单</a></li>
            <li><a href="#">我的收藏夹</a></li>
            <li><a href="#">我的购物车</a></li>
            <li><a href="#">联系客服</a></li>
            <li><a href="#" style="border: none">网站导航</a></li>
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
        </div>
    </div>
</div>

<div class="header">
    <div class="container clearfix">
<div class="jiaocai clearfix" id="item1">
    <h1>您选择的是：${param.name}<span></span></h1>
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
    <div class="book fr" id="flId">

    </div>
</div>
    </div>
</div>
</body>
</html>
