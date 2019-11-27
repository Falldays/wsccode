<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <li><a href="#">首页</a></li>
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
            <a href="userindex.jsp"><img src="images/logo4.png" alt=""/></a>
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
                            <a class="panel-title" data-toggle="collapse" data-parent="#panel-566826" href="#panel-element-753713">账号管理</a>
                        </div>
                        <div id="panel-element-753713" class="panel-collapse in">
                            <div class="panel-body">
                                <a href="user_address.jsp">收货地址设置</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div   class="col-md-10 column">
                <form  method="post" action="/useradd/insertUseradd?user_id=1">
                    <div>
                        <p style="background-color: #F0FFF0;font-size: 18px;margin-top: 20px;">
                            收货地址
                        </p>
                        <div >
                            <div>
                                <p >
                                * 地址信息：
                                省：<select id="Select1" name="addAddress1"></select>
                                市：<select id="Select2" name="addAddress2"></select>
                                区：<select id="Select3" name="addAddress3"></select>
                                </p>
                            </div>
                        <div>
                            <p>
                                * 详细地址：<input type="text" id="xxdz"   name="addAddress4" placeholder="请输入详细地址信息，如道路、门牌号等" style="width: 500px">
                            </p>
                        </div>
                        </div>
                        <div>
                            <p>
                                * 收货人姓名：<input type="text" id="username" name="addName" placeholder="请填写姓名">
                            </p>
                        </div>
                        <div>
                            <p>
                                * 手机号码：<input type="text" id="phone" name="addTelephone" placeholder="手机号码或电话号码必须填一项" style="width: 200px">
                            </p>
                        </div>

                    </div>
                    <div >
                        <button class="btn btn-warning" type="reset">重置</button>
                        <button class="btn btn-info"  type="submit">保存</button>
                    </div>
                </form>
                <p style="background-color: #F0FFF0;font-size: 18px;margin-top: 20px;">
                    已保存的地址
                </p>
                <div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                收货人
                            </th>
                            <th>
                                详细地址
                            </th>
                            <th>
                                手机号码
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty useradds}" >
                                <tr>
                                    <td colspan="4" align="center">
                                        <span>未查询到任何地址信息</span>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${useradds}" var="useradd">
                                    <tr>
                                        <input type="hidden" value="${useradd.useraddId}" >
                                        <td>${useradd.addName}</td>
                                        <td>${useradd.addAddress}</td>
                                        <td>${useradd.addTelephone}</td>
                                        <td>
                                            <a href="/useradd/delUseradd?useradd_id=${useradd.useraddId}">删除</a>
                                            <a href="/useradd/toEditUseradd.action?useradd_id=${useradd.useraddId}">修改</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    addressInit('Select1', 'Select2', 'Select3');
</script>
</body>
</html>
