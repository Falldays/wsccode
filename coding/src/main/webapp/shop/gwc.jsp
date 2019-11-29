
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>(WSC)购物车</title>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>微商城购物车</title>

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/carts.css">
    <script>
        function judgeQueding()
        {
            if(confirm("确定要结算吗吗？"))
            {
                window.location.href="/shop/jiesuan";
            }
        }
    </script>>
</head>
<body>
<section class="cartMain">

    <from action="/shop/jiesuan" method="post" id="myFrom">
    <div class="cartMain_hd">
		<ul class="order_lists cartTop">
			<li class="list_chk">
				<!--所有商品全选-->
				<input type="checkbox" id="all" class="whole_check">
				<label for="all"></label>
				全选
			</li>
			<li class="list_con">商品名称</li>
			<li class="list_info">商品三级分类ID</li>
			<li class="list_price">单价</li>
			<li class="list_amount">数量</li>
			<li class="list_sum">金额</li>
			<li class="list_op">操作</li>
		</ul>
	</div>

    <div class="cartBox">
		<div class="shop_info">
		</div>
		<div class="order_content">
            <c:choose>
            <c:when test="${ empty requestScope.cartlist}">
                <tr>
                    <td colspan="7" align="center"><span style="color: #0000FF">~还没有收藏商品~</span></td>
                </tr>
            </c:when>
            <c:otherwise>
            <c:forEach items="${requestScope.cartlist}" var="carts">
            <ul class="order_lists">
				<%--选择框--%>
                <li class="list_chk">
					<input type="checkbox" id="checkbox_2" class="son_check">
					<label for="checkbox_2"></label>
				</li>
                <%--名称及图片--%>
				<li class="list_con">
					<%--<div class="list_img"><a href="/collect/getpro?pd_id=${shop.pdId}"><img src="${shop.pdCover}" alt=""></a></div>--%>
					<div class="list_text"><a href="/collect/getpro?pd_id=${carts.pdId}">${carts.pdName}</a></div>
				</li>
				<li class="list_info">
                     ${carts.pdthreeId}
				</li>
                <%--商品价格--%>
				<li class="list_price">
					<p class="price">￥${carts.pdPrice}</p>
				</li>
                <%--计算总价--%>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="${carts.scNumber}" class="sum" name="scNumber${carts.no}" >
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥${carts.pdPrice}</p>
				</li>
                 <%--操作--%>
				<li class="list_op">
					<p class="del"><a href="#" class="delBtn">移除商品</a></p>
                    <input type="hidden" name="scId${carts.no}" value="${carts.scId}">
                    <input type="hidden" name="pdId" value="${carts.pdId}">
                    <input type="hidden" name="collId${carts.no}" value="${collId}">
                    <input type="hidden" name="pdId${carts.no}" value="${carts.pdId}" >

				</li>

			</ul>
            </c:forEach>
            </c:otherwise>
            </c:choose>
		</div>
	</div>

	
	<!--底部-->

	<div class="bar-wrapper">
		<div class="bar-right">

            <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
			<div class="totalMoney" >共计: <strong class="total_text">0.00</strong><input type="hidden" class="total_text" name="scPrice" value=""></div>
            <div class="calBtn"><a href="#" onclick="document.getElementById('myForm').submit()">结算</a></div>

		</div>
	</div>
</from>

</section>
<section class="model_bg"></section>
<section class="my_model">
	<p class="title">删除宝贝<span class="closeModel">X</span></p>
	<p>您确认要删除该宝贝吗？</p>
	<div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
</section>

<script src="../js/jquery.min.js"></script>
<script src="../js/carts.js"></script>

</body>
</html>