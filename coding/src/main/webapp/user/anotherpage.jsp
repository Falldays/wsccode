<%--
  Created by IntelliJ IDEA.
  User: kiss
  Date: 2019/11/22
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
<div>
    <strong> ${sessionScope.user.username}!!!!! </strong>
</div>
<form action="/user/outLogin">
    <table>
        <tr>
            <td><input type="submit" value="退出登录" ></td>
        </tr>
    </table>
</form>

</body>
</html>
