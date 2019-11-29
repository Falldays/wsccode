<%--
  Created by IntelliJ IDEA.
  User: 29067
  Date: 2019/11/28
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/skin/css/style.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function() {
            //导航切换
            $(".menuson li").click(function() {
                $(".menuson li.active").removeClass("active");
                $(this).addClass("active");
            });

            $('.title').click(function() {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
        });
    </script>
</head>
<body style="background:#f0f9fd">
<ul class="menuson" style="list-style: none">
    <li><cite></cite>
        <a href="/order/queryOrder?userId=1" target="rightFrame">全部订单</a><i></i></li>
    <li><cite></cite>
        <a href="/order/info?userId=2&orderStatus=0" target="rightFrame">待付款</a><i></i></li>
    <li><cite></cite>
        <a href="/order/info?userId=2&orderStatus=1" target="rightFrame">待发货</a><i></i></li>
    <li><cite></cite>
        <a href="/order/info?userId=2&orderStatus=2" target="rightFrame">待收货</a><i></i></li>
</ul>
</body>
</html>
