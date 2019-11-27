<%--
  Created by IntelliJ IDEA.
  User: luliujun
  Date: 2019/11/14
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form action="/user/query" method="post">
    <ul style="list-style: none">
    <li>用户名：<input type="text" name="username"></li>
    <li>密码：<input type="text" name="password"></li>
        <li><input type="submit" value="立即登录"></li>
        <li><input type="reset" value="重新填写"></li>
    </ul>
</form>
</body>
</html>

