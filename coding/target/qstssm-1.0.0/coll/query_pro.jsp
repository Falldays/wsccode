<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/19
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="css/public.css" />
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/swiper3.07.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/myfocus-2.0.1.min.js"></script>
    <script src="js/main.js"></script>
    <title>微商城 - 我的购物车</title>
</head>
<body>

<div class="top" id="item4">
    <div class="container clearfix">
        <ul class="clearfix fr">
            <li><a href="#">用户名</a></li>
            <li><a href="#">我的微商城</a></li>
            <li><a href="#">我的订单</a></li>
            <li><a href="#">收藏夹</a></li>
            <li><a href="#">联系客服</a></li>
            <li><a href="#" style="border: none">网站导航</a></li>
        </ul>
    </div>

<div>
    <h2>收藏夹</h2>
    <table width="600" border="1" cellspacing="0">
        <tr>
            <th>商品名</th>
            <th>商品价格</th>
            <th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${ empty requestScope.mapList}">
                <tr>
                    <td colspan="7" align="center"><span style="color: #0000FF">~还没有收藏商品~</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${requestScope.mapList}" var="collect">
                    <tr>
                        <td>${collect.pdName}</td>
                        <td>${collect.pdPrice}元</td>
                        <td>
                            <a href="#" onclick="deletePro(${collect.collId},'${collect.pdName}')">取消收藏</a>&nbsp;&nbsp;
                            <a href="/collect/getpro?pd_id=${collect.pdId}" target="_blank">详情</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <script>
            /**
             * 根据购物车ID删除商品信息
             * @param empId
             * @param empName
             */
            function deletePro(collId, pdName) {
                if (window.confirm('确定要取消【' + pdName + '】收藏吗?')) {
                    window.location.href = '/collect/delete?coll_id='+collId;
                }
            }

        </script>
    </table>

</div>
</body>
</html>
