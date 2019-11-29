
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>购物车</title>

</head>


<body>

<div>

    <form method="post" action="/shop/jiesuan">
        <h2>购物车</h2>
        <table width="600" border="1" cellspacing="0">

            <tr>

                <th>商品名</th>
                <th>商品价格</th>
                <th>数量</th>
                <th>操作</th>
            </tr>
            <c:choose>
                <c:when test="${ empty requestScope.cartlist}">
                    <tr>
                        <td colspan="7" align="center"><span style="color: #0000FF">~还没有收藏商品~</span></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${requestScope.cartlist}" var="carts">
                        <tr>

                            <td>${carts.pdName} </td>
                            <td>${carts.pdPrice}元</td>
                            <td><input type="number"name="scNumber${carts.no}" value="${carts.scNumber}"></td>
                            <td>

                                <input type="hidden" name="pdId${carts.no}" value="${carts.pdId}" >
                                <input type="hidden" name="scId" value="${carts.scId}">
                                <input type="hidden" name="userId" value="${carts.userId}">
                                <a href="#" onclick="deletePro(${carts.scId},'${carts.pdName}')">取消收藏</a>&nbsp;&nbsp;
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <script>
                var a=${size}
                /**
                 * 根据购物车ID删除商品信息
                 * @param empId
                 * @param empName
                 */
                function deletePro(scId, pdName) {
                    if (window.confirm('确定要取消【' + pdName + '】收藏吗?')) {
                        window.location.href = '/collect/delete?scId='+scId;
                    }
                }

            </script>
        </table>
        <input type="submit" value="结算">

    </form>
</div>


</body>
</html>
