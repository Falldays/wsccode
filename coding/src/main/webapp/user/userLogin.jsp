<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html lang="en">
<head>
<title>微商城-欢迎登录</title>
<meta name="renderer" content="webkit"> 
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
        <style>
            /*web background*/
            .container{
                display:table;
                height:70%;
            }
            .row{
                display: table-cell;
                vertical-align: middle;
            }
            body {

                background-image: url("images/w.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                height: 100%;
                width: 100%;
            }
            /* centered columns styles */
            .row-centered {
                text-align:center;
            }
		.form-group{
			font-size: 15px;
		}
           </style>
</head>
<body>

<div class="header">
	<div class="logo">
	
	<a href="../userIndex.jsp"><img src="images/logo4.png" style="margin-top: 15px;margin-left: 50px;"></a>
	<img src="images/cat.jpg" style="height: 106px;width: 106px;margin-right: 30px;"align="right">
	</div>

</div>
	<div class="container" style="color:#FFF" >
	<div class="row clearfix">
		<div class="col-md-12 column" >
			<h3 align="right" style="margin-right: 80px;">
				账户登录
			</h3>
			<form class="form-horizontal" role="form"  action="/user/login" method="post" >
				<div class="form-group" >
					 <label for="inputEmail3" class="col-sm-9 control-label" >用户名</label>
					<div class="col-sm-3">
						<input type="text" class="form-control " name="userName" id="inputEmail3" placeholder="用户名"  />
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
						<button type="button" class="btn btn-success" onclick="window.location.href = '/user/add_user.jsp'">注  册</button>
						<a href="xxx.jsp" style="color: #FFFFFF;margin-left: 50px;">忘记密码</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<div class="w">
    <div id="footer-2013">
        <div class="links" align="center" style="margin-top: 50px;">
            <a rel="nofollow" target="_blank" href="//www.jd.com/intro/about.aspx">
                关于我们
            </a>
            |
            <a rel="nofollow" target="_blank" href="//www.jd.com/contact/">
                联系我们
            </a>
            |
            <a rel="nofollow" target="_blank" href="//zhaopin.jd.com/">
                人才招聘
            </a>
            |
            <a rel="nofollow" target="_blank" href="//www.jd.com/contact/joinin.aspx">
                商家入驻
            </a>
            |
            <a rel="nofollow" target="_blank" href="//www.jd.com/intro/service.aspx">
                广告服务
            </a>
            |
            <a target="_blank" href="//club.jd.com/links.aspx">
                友情链接
            </a>
            |
            <a target="_blank" href="//media.jd.com/">
                销售联盟
            </a> 
        </div>
        <div class="copyright" align="center">
            Copyright&nbsp;&copy;&nbsp;2019-2077&nbsp;&nbsp;微商城WSC.com&nbsp;版权所有
        </div>
    </div>
</body>

</html>

