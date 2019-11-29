<%--
  Created by IntelliJ IDEA.
  User: 29067
  Date: 2019/11/28
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查询订单</title>
    <link rel="stylesheet" href="../res/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <script type="text/javascript" src="../res/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<ol class="breadcrumb">
    <li>当前位置:查询订单</li>
</ol>

<div class="container">
    <div id="scrollContent" style="width: 99%">
        <table class="table table-hover table-striped table-bordered">
            <thead>
            <tr class="info">
                <th class="text-center">
                    <span>订单编号</span>
                </th>
                <th class="text-center">
                    <span>订单价格</span>
                </th>
                <th class="text-center">
                    <span>快递单号</span>
                </th>
                <th class="text-center">
                    <span>创建时间</span>
                </th>
                <th class="text-center">
                    <span>订单状态</span>
                </th>
                <th class="text-center">
                    <span>操作</span>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${ empty requestScope.orderList}">
                    <tr>
                        <td colspan="7" align="center"><span style="color: #0000FF">未查询到数据</span></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${requestScope.orderList}" var="order">
                        <tr>
                            <td>${order.orderNo}</td>
                            <td>${order.orderPrice}</td>
                            <td>${order.expressNo}</td>
                            <!-- 利用格式化标签输出创建时间-->
                            <td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd"/></td>
                            <td>${order.orderStatus}</td>
                            <td>
                                <%--<a href="#" onclick="deleteProduct(${order.orderId},'${order.orderNo}')">
                                    <button type="button" class="btn btn-danger" }>
                                        <span>删除</span>
                                    </button></a>--%>
                                    <a href="/order/update-order.jsp?order_id=${order.orderId}">
                                        <button type="button" class="btn btn-primary" ><span>修改</span></button></a>
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
    function deleteProduct(orderId, orderNo) {
        if (window.confirm('确定要删除订单【' + orderNo + '】吗?')) {
            window.location.href = '/order/deleteOrder?order_id=' + orderId;
        }
    }

</script>
</table>
共查询到:<span style="color: #1f33ff">${fn:length(requestScope.orderList)}</span>条记录
</div>
</body>
</html>