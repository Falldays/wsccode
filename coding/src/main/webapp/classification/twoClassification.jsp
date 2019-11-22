<%--
  Created by IntelliJ IDEA.
  User: 89811
  Date: 2019/11/22
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">

    <title>二级分类管理</title>
    <link rel="stylesheet" href="../res/My97DatePicker/skin/WdatePicker.css" />
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css" />
    <script src="/js/jquery.min.js"></script>

    <script>
        $("#oneId").change(function () {
            var optionHTML = '<option value="' + 1 + '">' + nn + '</option>';
            $("#selectTwo").append(optionHTML);
        });
        $(function() {
            // var oneId = $(this).val();
            // $("#selectTwo").empty();
            //利用jQuery AJAX加载部门数据和当前员工数据
            $.ajax({
                url: '/classification/load_two',//请求URL
                data: {oneId: 1},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data);
                    var twos = data.twos;
                    var length = twos.length;
                    if (0 == length) {
                        alert("未加载到二级分类数据");
                        return;
                    }
                    for (var index = 0; index < length; index++) {
                        var two = twos[index];
                        var twoId = two.twoId;//二级分类ID
                        var twoName = two.twoName;//二级分类名称
                        var optionHTML = '<option value="' + twoId + '">' + twoName + '</option>';
                        $("#selectTwo").append(optionHTML);
                    }
                    //默认选中用户所属部门
                    // $("#selectTwo").val(emp.depId);
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
<ol class="breadcrumb">
    <li>当前位置:二级分类管理</li>
</ol>
<div class="container" style="padding-left: 0px;">
    <div class="well">
        <form action="/classification/queryClassificationByOneId" method="post">
            <div class="form-group" style="width: 100%">
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-1 text-right">
                            <span>一级:</span>
                        </div>
                        <div class="col-sm-3">
                            <select name="oneId" id="selectOne" class="form-control"  >
                                <option value="">--请选择--</option>
                                <c:forEach items="${requestScope.oneClassificationList}" var="classification">
                                    <option value="${classification.claFid}">${classification.claName}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </div>
                    <div >
                        <div class="col-lg-1 text-right">
                            <span>二级:</span>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-sm-3">
                            <select name="twoId" id="selectTwo" class="form-control">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary"><span>查询</span></button>
                        <a href="/classification/queryTwoClassification"><button type="button" class="btn btn-primary" ><span>显示所有</span></button></a>
                        <a href="#"><button type="button" class="btn btn-warning" ><span>添加二级分类</span></button></a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="container">
    <%--<div class="form-signin" role="form">--%>
    <div id="scrollContent" style="width: 99%">
        <table class="table table-hover table-striped table-bordered">
            <thead>
            <tr class="info">
                <th class="text-center">
                    <span>二级分类编号</span>
                </th>
                <th class="text-center">
                    <span>二级分类名称</span>
                </th>
                <th class="text-center">
                    <span>所属分类（一级）</span>
                </th>
                <th class="text-center">
                    <span>对应三级分类数</span>
                </th>
                <th class="text-center">
                    <span>操作</span>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${ empty requestScope.twoClassificationListBy}">
                    <tr>
                        <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${requestScope.twoClassificationListBy}" var="classification">
                        <tr>
                            <td align="center">${classification.twoNo}</td>
                            <td align="center">${classification.twoName}</td>
                            <td align="center">${classification.oneName}</td>
                            <td align="center">${classification.number}</td>
                            <td>
                                <button type="button" class="btn btn-primary" ><span>修改</span></button>
                                <button type="button" class="btn btn-danger" ${classification.number==0? "":"disabled"}><span>删除</span></button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</body>

</html>