<%--
  Created by IntelliJ IDEA.
  User: kiss
  Date: 2019/11/18
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户信息查询</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div id="scrollContent" style="width: 99%">
        <table class="table table-hover table-striped table-bordered">
            <thead>
            <tr class="info">
                <th class="text-center">
                    <span>用户编号</span>
                </th>
                <th class="text-center">
                    <span>用户姓名</span>
                </th>
                <th class="text-center">
                    <span>用户昵称</span>
                </th>
                <th class="text-center">
                    <span>性别</span>
                </th>
                <th class="text-center">
                    <span>手机号码</span>
                </th>
                <th class="text-center">
                    <span>出生日期</span>
                </th>
                <th class="text-center">
                    <span>操作</span>
                </th>
            </tr>
            </thead>
        <c:choose>
            <c:when test="${ empty requestScope.userList}">
                <tr>
                    <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${requestScope.userList}" var="user">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userNc}</td>
                        <td>${1==user.sex?'男':'女'}</td>
                        <td>${user.tel}</td>
                        <!-- 利用格式化标签输出出生日期-->
                        <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
                        <td><a href="#" onclick="deleteUser(${user.userId},'${user.userName}')">
                            <button type="button" class="btn btn-danger" }>
                                <span>删除</span>
                            </button></a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <script>
            /**
             * 根据管理员ID删除管理员信息
             * @param adminId
             * @param adminName
             */
            function deleteUser(userId, userName) {
                if (window.confirm('确定要删除【' + userName + '】吗?')) {
                    window.location.href = '/user/delete?user_id=' + userId;
                }
            }

        </script>
    </table>
    </div>
    共查询到:<span style="color: #1f33ff">${fn:length(requestScope.adminList)}</span>条记录
</div>
</body>
</html>
