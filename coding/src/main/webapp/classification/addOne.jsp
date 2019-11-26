<%--
  Created by IntelliJ IDEA.
  User: 89811
  Date: 2019/11/23
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加一级分类</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>
<script>
    $(function () {
        setTimeout(function () {
            $("#myspan").empty();
        }, 6000);
    })
</script>
<body>
<ol class="breadcrumb">
    <li>当前位置:添加一级分类</li>
</ol>
<div id="alertMessage">
</div>
<div id="scrollContent" style="width: 99%">
    <form action="${pageContext.request.contextPath}/classification/addOneClassification" method="post">
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">一级分类编号</label>
                <div class="col-sm-3">
                    <input  class="form-control" type="text" name="claNo" value="${cla.claNo}" required/>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">一级分类名称</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="claName" value="${cla.claName}" required/>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="col-sm-1"></div>
        <div class="form-group">
            <div class="col-sm-3 text-right">
                <button type="submit" class="btn btn-primary" id="submit_button01">
                    <span>添加分类</span></button>
                <a href="../classification/queryClassification"><button type="button" class="btn btn-close" id="submit_button02" ><span>取消添加</span></button></a>
            </div>
        </div>
        <div class="form-group">
            <div class="left">
                <div class="col-sm-9 text-center" >
                    <span style="color:rgb(255,0,0)" id="myspan">${msg}</span>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
