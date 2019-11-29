<%--
  Created by IntelliJ IDEA.
  User: 29067
  Date: 2019/11/20
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>我的订单</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<ol class="breadcrumb">
    <li>当前位置:我的订单</li>
</ol>
<div class="container">
    <div id="scrollContent" style="width: 99%">
        <table class="table table-hover table-striped table-bordered">
            <thead>
            <tr class="info">
                <th class="text-center">
                    <span>订单编号</span>
                </th>
                <th class="text-center">
                    <span>商品名称</span>
                </th>
                <th class="text-center">
                    <span>商品价格</span>
                </th>
                <th class="text-center">
                    <span>订单总价</span>
                </th>
                <th class="text-center">
                    <span>快递单号</span>
                </th>
                <th class="text-center">
                    <span>创建时间</span>
                </th>
            </tr>
            </thead>
          <c:choose>
            <c:when test="${ empty requestScope.mapList}">
                <tr>
                    <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${requestScope.mapList}" var="map">
                    <tr>
                        <td>${map.orderNo}</td>
                        <td>${map.pdName}</td>
                        <td>${map.pdPrice}</td>
                        <td>${map.orderPrice}</td>
                        <td>${map.expressNo}</td>
                        <!-- 利用格式化标签输出创建时间-->
                        <td><fmt:formatDate value="${map.createTime}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </table>
    </div>
    共查询到:<span style="color: #1f33ff">${fn:length(requestScope.mapList)}</span>条记录
</div>
</body>
</html>
