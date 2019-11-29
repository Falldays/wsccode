<%--
  Created by IntelliJ IDEA.
  User: 89811
  Date: 2019/11/22
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>微商城后台管理系统</title>
</head>

<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />

    <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
        <frame src="left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
      <frame src="admin/info.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
    </frameset>
</frameset>
</html>
