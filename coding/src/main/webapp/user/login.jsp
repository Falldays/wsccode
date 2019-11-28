<%--
  Created by IntelliJ IDEA.
  User: kiss
  Date: 2019/11/22
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
<form action="/user/checkLogin" method="post">
    <table>
        <tr>
            <td>用户名:</td>
            <td><input id="username" name="userName" type="text"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input id="password" name="password" type="password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="登录"></td>


        </tr>
    </table>
</form>
<a href="/user/add_user.jsp">注册</a>

</body>
</html>
