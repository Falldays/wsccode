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
    <title>一级分类管理</title>
    <link rel="stylesheet" href="../res/My97DatePicker/skin/WdatePicker.css" />
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css" />
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../res/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<ol class="breadcrumb">
    <li>当前位置:一级分类管理</li>
</ol>
<div class="container" style="padding-left: 0px;">
    <div class="well">
        <form action="queryClassificationByOneId" method="post">
            <div class="form-group" style="width: 100%">
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-3">
                            <select name="oneId" class="form-control">
                                <option value="">--请选择--</option>
                                <c:forEach items="${requestScope.oneClassificationList}" var="classification">
                                        <option value="${classification.claFid}">${classification.claName}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary"><span>查询</span></button>
                        <a href="/classification/queryClassification"><button type="button" class="btn btn-primary" ><span>显示所有</span></button></a>
                        <a href="#"><button type="button" class="btn btn-warning" ><span>添加一级分类</span></button></a>
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
                        <span>分类编号</span>
                    </th>
                    <th class="text-center">
                        <span>一级分类名称</span>
                    </th>
                    <th class="text-center">
                        <span>对应二级分类数量</span>
                    </th>
                    <th class="text-center">
                        <span>操作</span>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${ empty requestScope.oneClassificationListBy}">
                        <tr>
                            <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.oneClassificationListBy}" var="classification">
                            <tr>
                                <td align="center">${classification.claNo}</td>
                                <td align="center">${classification.claName}</td>
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