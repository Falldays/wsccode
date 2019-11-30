<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/swiper3.07.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/myfocus-2.0.1.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(function () {

            $.ajax({
                url: 'productSearch/loadFirst',//请求URL
                data: {},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data);

                    var productList3=data.productList3;
                    var length3=productList3.length;
                    for(var index=0;index<length3;index++){
                        var pro=productList3[index];
                        $("#thirdId").append(' <dl>' +
                            '<dt>' +
                            '<a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'"><img src="'+pro.pdCover+'" alt="" height="120px"/>' +
                            '</a></dt><dd><p><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">'+pro.pdName.substring(0,17)+'...'+'</a></p>' +
                            '<p></p>' +
                            '<p><s></s>￥'+pro.pdPrice+'</p> </dd></dl>');
                    }

                    var swiper = new Swiper('.swiper-container', {
                        pagination: '.swiper-pagination',
                        slidesPerView: 7,
                        paginationClickable: true,
                        grabCursor: true,
                        spaceBetween: 30
                    });

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 请求失败
                    console.error(errorThrown);
                }
            });

            $.ajax({
                url: 'productSearch/load2',//请求URL
                data: {pdName:"${param.pdName}"},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data);
                    var productList=data.productList;
                    var length=productList.length;
                    for(var index=0;index<length;index++){
                        var pro=productList[index];
                        $("#proName").append(' <dl>' +
                            '<dt>' +
                            '<a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'"><img src="'+pro.pdCover+'" alt="" height="120px"/>' +
                            '</a></dt><dd><p><a href="productSearch/productSearchByPdId?pdId='+pro.pdId+'">'+pro.pdName.substring(0,17)+'...'+'</a></p>' +
                            '<p></p>' +
                            '<p><s></s>￥ '+pro.pdPrice+'</p> </dd></dl>');
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 请求失败
                    console.error(errorThrown);
                }
            });


        });
    </script>
</head>
<body>
<div class="top" id="item4">
    <div class="container clearfix">
        <li><a href="userIndex.jsp" style="border: none">首页</a></li>
        <ul class="clearfix fr">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a href="/user/userLogin.jsp">您好，请登录</a></li>
                    <li><a href="/user/add_user.jsp">免费注册</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/user/info.jsp">您好，${sessionScope.user.userName}</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="/my-order.jsp">我的订单</a></li>
            <li><a href="/collect/querypro">我的收藏夹</a></li>
            <li><a href="/shop/queryshop">我的购物车</a></li>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a href="/useradd/getUseradd" style="border: none">我的地址</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/useradd/getUseradd">我的地址</a></li>
                    <li><a href="/user/logout" style="border: none">退出登录</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>

<div class="header">
    <div class="container clearfix">
        <div class="logo fl">
            <a href="/userIndex.jsp"><img src="images/logo4.png" alt=""/></a>
        </div>
        <div class="seacher fl">
            <form action="/product_likesearch.jsp" method="post">
                <input type="text" placeholder="小伙伴，你想找什么?" name="pdName"/><input type="submit" value="搜 索"/>
            </form>
        </div>
    </div>
</div>

<div style="width: 1400px;margin-top: 50px;height: 400px">
    <div style="width: 350px;float: left;">
        <img src="${product.pdCover}" style="height: 300px;margin-left: 300px">
    </div>
    <div style="float: right;height: 450px;width: 500px;margin-right: 250px">
        <p style="font-size: 18px;">${product.pdName}</p>
        <p>价格：<span style="font-size: 20px;color: red;">￥${product.pdPrice}</span></p>
        <p>数量：1</p>
        <p>库存：${product.pdNumber}件</p>
        <input type="button" class="btn btn-danger" value="加入购物车">
        <a href="/collect/addshop?pdId=${product.pdId}"><input type="button" class="btn btn-warning" value="加入收藏夹"></a>
    </div>
</div>

<div class="container">
    <div class="row clearfix">
<div class="jiaocai clearfix" id="item3">
    <h1>猜你喜欢<span></span></h1>
    <div class="book clearfix" style="margin: 0 auto;width: 1130px;" id="thirdId">
    </div>
</div>
    </div>
</div>
</body>
</html>
