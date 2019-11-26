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
    <title>添加三级分类</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>
<script>
    $(function () {
        $('#selectOne').bind('change', function () {
            $("#selectTwo").empty();
            var options = $("#selectOne option:selected"); //获取选中的项
            var oneId = options.val() //拿到选中项的值

            $.ajax({
                url: '/classification/load_two',//请求URL
                data: {oneId: oneId},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data);
                    var twos = data.twos;
                    var length = twos.length;
                    for (var index = 0; index < length; index++) {
                        var two = twos[index];
                        var twoId = two.pd_twoId;//二级分类ID
                        var twoName = two.pd_twoName;//二级分类名称
                        var optionHTML = '<option value="' + twoId + '">' + twoName + '</option>';
                        $("#selectTwo").append(optionHTML);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 请求失败
                    console.error(errorThrown);
                }
            });
        });
    });
</script>
<body>
<ol class="breadcrumb">
    <li>当前位置:添加三级分类</li>
</ol>
<div id="alertMessage">
</div>
<div id="scrollContent" style="width: 99%">
    <form action="${pageContext.request.contextPath}/classification/addThree" method="post">
        <div class="form-group">
            <div class="row">
                <label class="control-label col-md-2" style="text-align: right;">所属分类（一级）</label>
                <div class="col-sm-3">
                    <select name="claFid" id="selectOne" class="form-control"  required>
                        <c:forEach items="${requestScope.oneClassificationList}" var="classification">
                            <option value="${classification.claFid}" ${classification.number==0?"disabled":""} ${two.claFid==classification.claFid? "selected":""}}>
                                    ${classification.claName}
                            </option>
                        </c:forEach>
                    </select>
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
                    <select name="pd_twoId" id="selectTwo" class="form-control"  required >
                        <c:forEach items="${requestScope.twoMap}" var="two1">
                            <option value="${two1.twoId}" ${two1.twoId==three.pd_twoId?"selected":""}>${two1.twoName}</option>
                        </c:forEach>
                    </select>
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
                    <input  class="form-control" type="text" name="pd_threeNo" value="${three.pd_threeNo}" required/>
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
                <button type="submit" class="btn btn-primary" id="submit_button01">
                    <span>添加分类</span></button>
                <a href="../classification/queryThreeClassification"><button type="button" class="btn btn-close" id="submit_button02" ><span>取消添加</span></button></a>
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
