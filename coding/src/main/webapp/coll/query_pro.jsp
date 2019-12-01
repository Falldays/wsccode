<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/19
  Time: 21:08
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

    <title>收货地址-微商城</title>

    <script src="js/jsAddress.js"></script>
    <link href="css/public.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />


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
<ol class="breadcrumb">
    <li>当前位置:收藏夹</li>
</ol>
<div class="header">
    <div class="container clearfix">
        <div class="logo fl">
            <a href="/userIndex.jsp"><img src="images/logo4.png" alt=""/></a>
        </div>
    </div>
</div>


<div class="container-fluid" style="padding-left: 0px;">
    <div class="well">
        <form action="/collect/addshop" method="post">
            <div class="form-group" style="width: 100%">
                <div class="row">
                    <c:choose>
                        <c:when test="${ empty requestScope.mapList}">
                                <p colspan="7" align="center"><span style="color: #0000FF">~还没有收藏商品~</span></p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.mapList}" var="collect">
                                <div >
                                    <div class="col-sm-1">
                                        <span>商品名:</span>
                                    </div>
                                    <div class="col-sm-1">
                                        <span></span>
                                    </div>
                                    <div class="col-sm-1">
                                        <span>商品价格:</span>
                                    </div>
                                    <div class="col-sm-1">
                                        <span></span>
                                    </div>
                                    <div class="col-sm-1">
                                        <span>操作:</span>
                                    </div>
                                </div>
                                <div>&nbsp;</div>
                                <div >
                                    <div class="col-sm-2">
                                        <a href="/collect/getpro?pd_id=${collect.pdId}">${collect.pdName}</a>
                                    </div>
                                    <div class="col-sm-2">
                                            ${collect.pdPrice}元
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" onclick="deletePro(${collect.collId},'${collect.pdName}')"><input type="button" class="btn btn-warning" value="取消收藏"></a>
                                        <input type="submit" value="加入购物车" class="btn btn-danger">
                                    </div>
                                            <input type="hidden" value="${collect.pdId}" name="pdId">
                                            <input type="hidden" value="${collect.collId}" name="collId">

                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
        <script>
            /**
             * 根据购物车ID删除商品信息
             * @param empId
             * @param empName
             */
            function deletePro(collId, pdName) {
                if (window.confirm('确定要取消【' + pdName + '】收藏吗?')) {
                    window.location.href = '/collect/delete?coll_id='+collId;
                }
            }

        </script>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
