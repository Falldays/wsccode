<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/23
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>删除商品结果</title>
</head>
<body>
<c:choose>
<c:when test="${1==param.rows}">
    <span style="color:rgb(0,0,255)">删除成功</span>
</c:when>
<c:when test="${-1==param.rows}">
    <span style="color:rgb(255,0,0)">删除失败,服务器异常</span>
</c:when>
<c:otherwise>
    <span style="color:rgb(219,99,48)">删除商品,服务器返回未知的状态</span>
</c:otherwise>
</c:choose>
<a href="/admin/queryproduct">返回查询页面</a>
</body>
</html>
