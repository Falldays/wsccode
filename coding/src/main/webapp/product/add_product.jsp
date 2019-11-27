<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/23
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="../res/bootstrap/datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css" />
    <link rel="stylesheet" href="../res/My97DatePicker/skin/WdatePicker.css" />
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="../res/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<ol class="breadcrumb">
    <li>当前位置:添加商品</li>
</ol>
<div id="alertMessage">
</div>
<div id="scrollContent" style="width: 99%">
    <form action="/admin/addproduct" method="post">
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">商品编号:</label>
                <div class="col-sm-3">
                    <input type="text" name="pdNo" required >
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">商品名称:</label>
                <div class="col-sm-3">
                    <input type="text" name="pdName" required>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">商品三级分类ID:</label>
                <div class="col-sm-3">
                    <input type="text" name="pdthreeId" required>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">入库时间:</label>
                <div class="col-sm-3">
                    <input type="date" name="pdDate" required>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">价格:</label>
                <div class="col-sm-3">
                    <input type="number" name="pdPrice" required>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">图片:</label>
                <div class="col-sm-3">
                    <input type="text" name="pdCover"required>
                </div>
                <div class="col-sm-1">
                    <span style="color:rgb(255,0,0)">*</span>
                </div>
            </div>
        </div>

        <div class="modal-footer">

            <input type="hidden" name="pdId" required>
            <input type="submit" value="添加商品" class="btn btn-primary">&nbsp;&nbsp;
            <input type="reset" value="重新填写" class="btn btn-primary">
        </div>
    </form>
</div>
</body>
</html>
