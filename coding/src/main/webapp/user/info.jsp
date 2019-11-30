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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <meta charset="utf-8">

    <title>用户详细信息-微商城</title>

    <link href="css/public.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.3.min.js"></script>


</head>
<body>
<div class="top" id="item4">
    <div class="container clearfix">
        <ul class="clearfix fr">
            <li><a href="/user/info.jsp">您好，${sessionScope.user.userName}</a></li>
            <li><a href="#">我的订单</a></li>
            <li><a href="/collect/querypro?user_id=1">我的收藏夹</a></li>
            <li><a href="#">我的购物车</a></li>
            <li><a href="#">联系客服</a></li>
            <li><a href="#" style="border: none">网站导航</a></li>
        </ul>
    </div>
</div>

<div class="header">
    <div class="container clearfix">
        <div class="logo fl">
            <a href="/userIndex.jsp"><img src="images/logo4.png" alt=""/></a>
        </div>
    </div>
</div>

<!-- Content -->
<div class="container">
    <div class="docs-methods">
        <div class="col-md-12 column">
            <div class="col-md-2 column" style="margin-top: 10px;">
                <div class="panel-group" id="panel-566826">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title" data-toggle="collapse" data-parent="#panel-566826" >账号管理</a>
                        </div>
                        <div id="panel-element-753713" class="panel-collapse in">
                            <div class="panel-body">
                                <a href="/user/info.jsp">用户详细信息</a>
                            </div>
                            <div class="panel-body">
                                <a href="/useradd/getUseradd">收货地址设置</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div   class="col-md-10 column">

                <div style="width: 300px;height:200px;background-color: #EEEEEE">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <span style="color: #FF0000">该用户不存在</span>
                    </c:when>
                    <c:otherwise>
                        <ul style="list-style: none">
                            <p><li><b>您的姓名：</b>${sessionScope.user.userName}</li></p>
                            <p><li><b>您的昵称：</b>${sessionScope.user.userNc}</li></p>
                            <p><li><b>性别：</b>${1==sessionScope.user.sex?'男':'女'}</li></p>
                            <!-- 利用格式化标签输出出生日期-->
                            <p><li><b>出生日期：</b><fmt:formatDate value="${sessionScope.user.birthday}" pattern="yyyy-MM-dd"/></li></p>
                            <p><li><b>手机号码：</b>${sessionScope.user.tel}</li></p>
                        </ul>
                    </c:otherwise>
                </c:choose>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
