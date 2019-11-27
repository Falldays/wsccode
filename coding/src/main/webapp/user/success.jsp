<%--
  Created by IntelliJ IDEA.
  User: kiss
  Date: 2019/11/22
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <strong> welcome,${sessionScope.user.username}! </strong>
</div>
this is success page!

<a href="/user/anotherpage.jsp">点我跳到另一个页面</a>

<form action="/user/outLogin">
    <table>
        <tr>
            <td><input type="submit" value="退出登录"></td>
        </tr>
    </table>
</form>

</body>
</html>
