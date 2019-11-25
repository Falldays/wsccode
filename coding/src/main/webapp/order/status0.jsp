<%--
  Created by IntelliJ IDEA.
  User: 29067
  Date: 2019/11/21
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>我的订单</title>
</head>
<body>
<div>
    <table width="600" border="1" cellspacing="0">
        <tr>
            <th>订单状态</th>
            <th>订单编号</th>
            <th>商品名称</th>
            <th>商品价格</th>
            <th>订单总价</th>
            <th>创建时间</th>
        </tr>
        <c:choose>
            <c:when test="${ empty requestScope.mapList}">
                <tr>
                    <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${requestScope.mapList}" var="map">
                    <tr>
                        <td>${map.orderStatus}</td>
                        <td>${map.orderNo}</td>
                        <td>${map.pdName}</td>
                        <td>${map.pdPrice}</td>
                        <td>${map.orderPrice}</td>
                        <!-- 利用格式化标签输出出生日期-->
                        <td><fmt:formatDate value="${map.createTime}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </table>
    共查询到:<span style="color: #1f33ff">${fn:length(requestScope.mapList)}</span>条记录
</div>
</body>
</html>