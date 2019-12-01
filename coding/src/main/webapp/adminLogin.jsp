<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>	
		<!-- Basic -->
    	<meta charset="UTF-8" />

		<title>微商城后台管理</title>
		
		<!-- Mobile Metas -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<!-- Import google fonts -->
        <link href="http://fonts.useso.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css" />
        
		<!-- Favicon and touch icons -->
		
		<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png" />
		<link rel="apple-touch-icon" sizes="57x57" href="assets/ico/apple-touch-icon-57x57.png" />
		<link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png" />
		<link rel="apple-touch-icon" sizes="76x76" href="assets/ico/apple-touch-icon-76x76.png" />
		<link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png" />
		<link rel="apple-touch-icon" sizes="120x120" href="assets/ico/apple-touch-icon-120x120.png" />
		<link rel="apple-touch-icon" sizes="144x144" href="assets/ico/apple-touch-icon-144x144.png" />
		<link rel="apple-touch-icon" sizes="152x152" href="assets/ico/apple-touch-icon-152x152.png" />
		
	    <!-- start: CSS file-->
		
		<!-- Vendor CSS-->
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->		
		
		<!-- Theme CSS -->
		<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->		
		<link href="assets/css/style.css" rel="stylesheet" />
		<link href="assets/css/add-ons.min.css" rel="stylesheet" />
		
		<style>
			footer {
				display: none;
			}
		</style>

		<script src="assets/plugins/modernizr/js/modernizr.js"></script>
			

	</head>

	<body>
		<!-- Start: Content -->
		<div class="container-fluid content">
			<div class="row">
				<!-- Main Page -->
				<div class="body-login">
					<div class="center-login">
						<div  class="logo pull-left hidden-xs" style="font-size: 25px;">
							<img src="images/logo4.png" height="45" alt="NADHIF Admin" />
							  &nbsp &nbsp后台管理系统
						</div>

						<div class="panel panel-login">
							<div class="panel-title-login text-right">
								<h2 class="title"><i class="fa fa-user"></i>管理员登陆</h2>
							</div>
							<div class="panel-body">
								<form class="form-horizontal" role="form"  action="/admin/login" method="post" >
									<div class="form-group" >
										<label for="inputEmail3" class="col-sm-9 control-label" >用户名</label>
										<div class="col-sm-3">
											<input type="text" class="form-control " name="adminName" id="inputEmail3" placeholder="用户名"  />
										</div>
									</div>
									<div class="form-group" >
										<label for="inputPassword3" class="col-sm-9 control-label">密码</label>
										<div class="col-sm-3">
											<input type="password" class="form-control" name="password" id="inputPassword3" placeholder="密码" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-9 col-sm-3" >
											<button type="submit" class="btn btn-danger">登  录</button>&nbsp;
											<button type="button" class="btn btn-success" onclick="window.location.href = '/admin/add_admin.jsp'">注  册</button>
											<a href="xxx.jsp" style="color: #FFFFFF;margin-left: 50px;">忘记密码</a>
										</div>
									</div>
								</form>
								<%--<form class="form-horizontal" role="form"  action="/admin/login" method="post" >
									<div class="form-group" >
										<label for="inputEmail3" class="col-sm-9 control-label" >用户名</label>
										<div class="col-sm-3">
											<input type="text" class="form-control " name="adminName" id="inputEmail3" placeholder="用户名"  />
										</div>
									</div>
									<div class="form-group" >
										<label for="inputPassword3" class="col-sm-9 control-label">密码</label>
										<div class="col-sm-3">
											<input type="password" class="form-control" name="password" id="inputPassword3" placeholder="密码" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-9 col-sm-3" >
											<button type="submit" class="btn btn-danger">登  录</button>&nbsp;&nbsp;
											<button type="button" class="btn btn-success" onclick="window.location.href = '/admin/add_user.jsp'">注  册</button>
											<a href="xxx.jsp" style="color: #FFFFFF;margin-left: 50px;">忘记密码</a>
										</div>
									</div>
								</form>--%>
							</div>
						</div>
					</div>
				</div>
				<!-- End Main Page -->


			</div>
		</div><!--/container-->
		
		
		<!-- start: JavaScript-->
		
		<!-- Vendor JS-->				
		<script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/vendor/skycons/js/skycons.js"></script>
		
		<!-- Plugins JS-->
		
		<!-- Theme JS -->		
		<script src="assets/js/jquery.mmenu.min.js"></script>
		<script src="assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="assets/js/pages/page-login.js"></script>
		
		<!-- end: JavaScript-->
		
	</body>
	
</html>
