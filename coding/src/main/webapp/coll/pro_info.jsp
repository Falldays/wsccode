<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/20
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品信息</title>
</head>
<body>
<c:choose>
    <c:when test="${empty requestScope.pro}">
        <span style="color: #FF0000">该员工不存在</span>
    </c:when>
    <c:otherwise>
        <ul style="list-style: none">
            <li><b>商品名称:</b>${requestScope.pro.pdName}</li>
            <li><b>商品价格:</b>${requestScope.pro.pdPrice}</li>
            <li><b>商品数量:</b>${requestScope.pro.pdNumber}</li>
            <li><b>商品图片:</b><image src="${requestScope.pro.pdCover}"/></li>
        </ul>
    </c:otherwise>
</c:choose>
</body>
</html>
