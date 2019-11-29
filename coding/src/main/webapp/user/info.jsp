<%--
  Created by IntelliJ IDEA.
  User: kiss
  Date: 2019/11/18
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户详细信息</title>
</head>
<body>
<c:choose>
    <c:when test="${empty requestScope.user}">
        <span style="color: #FF0000">该用户不存在</span>
    </c:when>
    <c:otherwise>
        <ul style="list-style: none">
            <li><b>用户姓名:</b>${requestScope.user.userName}</li>
            <li><b>用户昵称:</b>${requestScope.user.userNc}</li>
            <li><b>手机号码:</b>${requestScope.user.tel}</li>
            <!-- 利用格式化标签输出出生日期-->
            <li><b>出生日期:</b><fmt:formatDate value="${requestScope.user.birthday}" pattern="yyyy-MM-dd"/></li>
            <li><b>用户性别:</b>${1==requestScope.user.sex?'男':'女'}</li>
        </ul>
    </c:otherwise>
</c:choose>
</body>
</html>
