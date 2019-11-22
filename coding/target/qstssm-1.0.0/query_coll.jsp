<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/19
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查询收藏信息</title>
</head>
<body>
<%--测试--%>
<div>
    <h2>收藏夹</h2>
    <table width="600" border="1" cellspacing="0">
        <tr>
            <th>用户ID</th>
            <th>商品ID</th>
            <th>收藏时间</th>
        </tr>
        <c:choose>
            <c:when test="${ empty requestScope.collList}">
                <tr>
                    <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${requestScope.collList}" var="collect">
                    <tr>
                        <td>${collect.userId}</td>
                        <td>${collect.pdId}</td>
                        <td><fmt:formatDate value="${collect.collDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <a href="#" onclick="deleteEmp(${emp.empId},'${emp.empName}')">删除</a>
                            <a href="/emp/update_emp.jsp?emp_id=${emp.empId}" target="_blank">修改</a>
                            <a href="/collect/getpro?user_id=1" target="_blank">详情</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </table>

</div>
</body>
</html>
