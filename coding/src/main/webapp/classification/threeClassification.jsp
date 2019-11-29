<%--
  Created by IntelliJ IDEA.
  User: 89811
  Date: 2019/11/22
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>三级分类管理</title>
    <link rel="stylesheet" href="../res/My97DatePicker/skin/WdatePicker.css" />
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css" />
    <script src="/js/jquery.min.js"></script>
    <script>
        $(function () {
            $('#selectOne').bind('change',function () {
                $("#selectTwo").empty();
                $("#selectThree").empty();
                var optionHTML = '<option value="" disabled selected>--请选择--</option>';
                $("#selectThree").append(optionHTML);
                var options=$("#selectOne option:selected"); //获取选中的项
                var  oneId =options.val() //拿到选中项的值

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
                        if (0 == length) {
                            // alert("未加载到二级分类数据");
                            // return;
                            var optionHTML = '<option value="" disabled selected>--无--</option>';
                            $("#selectTwo").append(optionHTML);
                        }else {
                            var optionHTML = '<option value="" disabled selected>--请选择--</option>';
                            $("#selectTwo").append(optionHTML);
                        }
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

            $('#selectTwo').bind('change',function () {
                $("#selectThree").empty();
                var options=$("#selectTwo option:selected"); //获取选中的项
                var  twoId =options.val() //拿到选中项的值

                $.ajax({
                    url: '/classification/load_three',//请求URL
                    data: {twoId: twoId},//请求参数
                    type: 'POST',//请求方式
                    dataType: 'json', //将从服务器获取的数据处理成JSON格式
                    success: function (data) {
                        var threes = data.threes;
                        var length = threes.length;
                        if (0 == length) {
                            var optionHTML = '<option value="" disabled selected>--无--</option>';
                            $("#selectThree").append(optionHTML);
                        }else {
                            var optionHTML = '<option value="" disabled selected>--请选择--</option>';
                            $("#selectThree").append(optionHTML);
                        }
                        for (var index = 0; index < length; index++) {
                            var three = threes[index];
                            var threeId = three.pd_threeId;//二级分类ID
                            var threeName = three.pd_threeName;//二级分类名称
                            var optionHTML = '<option value="' + threeId + '">' + threeName + '</option>';
                            $("#selectThree").append(optionHTML);
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
</head>
<body>
<ol class="breadcrumb">
    <li>当前位置:三级分类管理</li>
</ol>
<div class="container" style="padding-left: 0px;">
    <div class="well">
        <form action="/classification/queryThreeClassification" method="post">
            <div class="form-group" style="width: 100%">
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-1 text-right">
                            <span>一级:</span>
                        </div>
                        <div class="col-sm-2">
                            <select name="oneId" id="selectOne" class="form-control"  >
                                <option value="" >--请选择--</option>
                                <c:forEach items="${requestScope.oneClassificationList}" var="classification">
                                    <option value="${classification.claFid}" >${classification.claName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-1 text-right">
                            <span>二级:</span>
                        </div>
                        <div class="col-sm-2">
                            <select name="twoId" id="selectTwo" class="form-control">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-1 text-right">
                            <span>三级:</span>
                        </div>
                        <div class="col-sm-2">
                            <select name="threeId" id="selectThree" class="form-control">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary"><span>查询</span></button>
                        <a href="/classification/queryThreeClassification"><button type="button" class="btn btn-primary" ><span>显示所有</span></button></a>
                        <a href="/classification/addThreeLoadOne"><button type="button" class="btn btn-warning" ><span>添加三级分类</span></button></a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="left">
                    <div class="col-sm-9 text-center" >
                        <span style="color:rgb(255,0,0)" id="myspan">${requestScope.msg}</span>
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
                    <span>三级分类编号</span>
                </th>
                <th class="text-center">
                    <span>三级分类名称</span>
                </th>
                <th class="text-center">
                    <span>所属分类（二级）</span>
                </th>
                <th class="text-center">
                    <span>所属分类（一级）</span>
                </th>
                <th class="text-center">
                    <span>对应商品数</span>
                </th>
                <th class="text-center">
                    <span>操作</span>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${ empty requestScope.threeClassificationListBy}">
                    <tr>
                        <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${requestScope.threeClassificationListBy}" var="classification">
                        <tr>
                            <td align="center">${classification.threeNo}</td>
                            <td align="center">${classification.threeName}</td>
                            <td align="center">${classification.twoName}</td>
                            <td align="center">${classification.oneName}</td>
                            <td align="center">${classification.number}</td>
                            <td>
                                <a href="/classification/threeInfo?threeId=${classification.threeId}"> <button type="button" class="btn btn-primary" ><span>修改</span></button></a>
                                <a href="#" onclick="deleteThree(${classification.threeId},'${classification.threeName}')">
                                    <button type="button" class="btn btn-danger" ${classification.number==0? "":"disabled"}><span>删除</span></button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <script>
        /**
         * 根据一级分类ID删除一级分类信息
         * @param empId
         * @param empName
         */
        function deleteThree(threeId, threeName) {
            if (window.confirm('确定要删除分类【' + threeName + '】吗?')) {
                window.location.href = '/classification/deleteThree?threeId=' + threeId;
            }
        }
    </script>
</body>

</html>