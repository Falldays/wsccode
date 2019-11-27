<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
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
</head>
<body>

<div class="top" id="item4">
    <div class="container clearfix">
        <ul class="clearfix fr">
            <li><a href="login.jsp">您好，请登录</a></li>
            <li><a href="#">免费注册</a></li>
            <li><a href="/order/queryOrder">我的订单</a></li>
            <li><a href="/collect/querypro?user_id=1">我的收藏夹</a></li>
            <li><a href="#">我的购物车</a></li>
            <li><a href="#">联系客服</a></li>
            <li><a href="#" style="border: none">网站导航</a></li>
        </ul>
    </div>
</div>

<div class="header">
    <div class="container clearfix">
        <div class="logo fl">
            <a href="#"><img src="images/logo4.png" alt=""/></a>
        </div>
        <div class="seacher fl">
            <form action="" method="post">
                <input type="text" placeholder="小伙伴，你想找什么?"/><input type="submit" value="搜 索"/>
            </form>
            <p>热门搜索：<a href="#">自行车</a> <a href="#">笔记本</a> <a href="#">平板电脑</a> <a href="#">时尚男装</a> <a href="#">潮流鞋子</a> <a href="#">手机</a> <a href="#">时尚女包</a> <a href="#">耳机</a></p>
        </div>

    </div>
</div>
</body>
</html>