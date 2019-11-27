<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html PUBLIC>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/skin/css/style.css" type="text/css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson li").click(function() {
					$(".menuson li.active").removeClass("active");
					$(this).addClass("active");
				});

				$('.title').click(function() {
					var $ul = $(this).next('ul');
					$('dd').find('ul').slideUp();
					if($ul.is(':visible')) {
						$(this).next('ul').slideUp();
					} else {
						$(this).next('ul').slideDown();
					}
				});
			});
		</script>
	</head>

	<body style="background:#f0f9fd;">
		<div class="lefttop"><span></span>功能菜单</div>
		<dl class="leftmenu">
			<dd>
				<div class="title"><span><img src="css/skin/images/leftico03.png"/></span>商品管理</div>
				<ul class="menuson">
					<li><cite></cite>
						<a href="dep/add_dep.html" target="rightFrame">添加商品</a><i></i></li>
					<li><cite></cite>
						<a href="dep/query_dep.html" target="rightFrame">查询商品</a><i></i></li>
					<li><cite></cite>
						<a href="dep/query_dep.html" target="rightFrame">修改商品</a><i></i></li>
				</ul>
			</dd>
			<dd>
				<div class="title"><span><img src="css/skin/images/leftico02.png"/></span>商品分类管理</div>
				<ul class="menuson">
					<li></li>
					<li><cite></cite>
						<a href="post/add_post.html" target="rightFrame">添加分类</a><i></i></li>
					<li><cite></cite>
						<a href="post/query_post.html" target="rightFrame">查询分类</a><i></i></li>
					<li><cite></cite>
						<a href="post/query_post.html" target="rightFrame">修改分类</a><i></i></li>
				</ul>
			</dd>
			<dd>
				<div class="title"><span><img src="css/skin/images/leftico04.png"/></span>会员管理</div>
				<ul class="menuson">
					<li></li>
					<li><cite></cite>
						<a href="/user/query_user.jsp" target="rightFrame">查询会员</a><i></i></li>
					<li><cite></cite>
						<a href="/user/update_user.jsp" target="rightFrame">修改会员</a><i></i></li>
					<li><cite></cite>
						<a href="/user/update_password.jsp" target="rightFrame">重置会员密码</a><i></i></li>
				</ul>
			</dd>

			<dd>
				<div class="title"><span><img src="css/skin/images/leftico04.png"/></span>订单管理</div>
				<ul class="menuson">
					<li></li>
					<li><cite></cite>
						<a href="emp/query_emp.html" target="rightFrame">查询订单</a><i></i></li>
					<li><cite></cite>
						<a href="emp/my_info.html" target="rightFrame">修改订单</a><i></i></li>
				</ul>
			</dd>

		</dl>
	</body>

</html>