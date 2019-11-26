<%--
  Created by IntelliJ IDEA.
  User: 89811
  Date: 2019/11/23
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改三级分类</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<ol class="breadcrumb">
    <li>当前位置:修改三级分类</li>
</ol>
<div id="alertMessage">
</div>
<div id="scrollContent" style="width: 99%">
    <form action="/classification/updateThree" method="post">
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">所属分类（一级）</label>
                <div class="col-sm-3">
                        <input  class="form-control" type="text" name="claName" value="${cla.claName}" readonly/>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">所属分类（二级）</label>
                <div class="col-sm-3">
                    <input  class="form-control" type="text" name="pd_twoName" value="${two.pd_twoName}" readonly/>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">三级分类编号</label>
                <div class="col-sm-3">
                    <input  class="form-control" type="text" name="pd_threeNo" value="${three.pd_threeNo}" readonly/>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">三级分类名称</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="pd_threeName" value="${three.pd_threeName}" required/>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="col-sm-1"></div>
        <div class="form-group">
            <div class="col-sm-3 text-right">
                <input type="hidden" value="${three.pd_threeId}" name="pd_threeId"/>
                <input type="hidden" value="${two.pd_twoId}" name="pd_twoId"/>
                <button type="submit" class="btn btn-primary" id="submit_button01">
                    <span>确认修改</span></button>
                <a href="../classification/queryThreeClassification"><button type="button" class="btn btn-close" id="submit_button02" ><span>返回</span></button></a>
            </div>
        </div>
        <div class="form-group">
            <div class="left">
                <div class="col-sm-9 text-center" >
                    <span style="color:rgb(255,0,0)">${msg}</span>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
