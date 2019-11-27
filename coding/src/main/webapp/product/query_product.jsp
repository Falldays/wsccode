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
</head>
<body>
<a href="add_product.jsp">添加商品</a>


<div>
    <table width="600" border="1" cellspacing="0">
        <tr>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>商品三级分类ID</th>
            <th>入库时间</th>
            <th>价格</th>
            <%--<th>图片</th>--%>
            <th>操作</th>
        </tr>
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
                            <a href="#" onclick="deleteProduct(${admin.pdId},'${admin.pdName}')">删除</a>
                            <a href="/product/update_product.jsp?pd_id=${admin.pdId}" target="_blank">修改</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
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
