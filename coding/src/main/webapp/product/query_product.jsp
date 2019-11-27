<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/23
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <title>查看商品</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<ol class="breadcrumb">
    <li>当前位置:查询商品</li>
</ol>

<div class="container">
    <div id="scrollContent" style="width: 99%">
        <table class="table table-hover table-striped table-bordered">
            <thead>
            <tr class="info">
                <th class="text-center">
                    <span>商品编号</span>
                </th>
                <th class="text-center">
                    <span>商品名称</span>
                </th>
                <th class="text-center">
                    <span>商品三级分类ID</span>
                </th>
                <th class="text-center">
                    <span>入库时间</span>
                </th>
                <th class="text-center">
                    <span>价格</span>
                </th>
                <th class="text-center">
                    <span>操作</span>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${ empty requestScope.productList}">
                    <tr>
                        <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${requestScope.productList}" var="admin">
                        <tr>
                            <td>${admin.pdNo}</td>
                            <td>${admin.pdName}</td>
                            <td>${admin.pdthreeId}</td>
                            <td>${admin.pdPrice}</td>
                            <!-- 利用格式化标签输出出生日期-->
                            <td><fmt:formatDate value="${admin.pdDate}" pattern="yyyy-MM-dd"/></td>
                            <%--<td>${admin.pdCover}</td>--%>
                            <td>
                                <a href="#" onclick="deleteProduct(${admin.pdId},'${admin.pdName}')">
                                    <button type="button" class="btn btn-danger" }>
                                    <span>删除</span>
                                    </button></a>
                                <a href="/product/update_product.jsp?pd_id=${admin.pdId}"><button type="button" class="btn btn-primary" ><span>修改</span></button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</div>


            <script>
            /**
             * 根据员工ID删除员工信息
             * @param empId
             * @param empName
             */
            function deleteProduct(pdId, pdName) {
                if (window.confirm('确定要删除【' + pdName + '】吗?')) {
                    window.location.href = '/admin/deleteproduct?pd_id=' + pdId;
                }
            }

        </script>
    </table>
    共查询到:<span style="color: #1f33ff">${fn:length(requestScope.productList)}</span>条记录
</div>
</body>
</html>
