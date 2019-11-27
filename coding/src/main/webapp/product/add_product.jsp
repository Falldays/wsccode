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
</head>
<body>
<form action="/admin/addproduct" method="post">
    <ul style="list-style: none">
        <li><h3>添加商品</h3></li>
        <li>商品编号:<input type="text" name="pdNo" required ></li>
        <li>商品名称:<input type="text" name="pdName" required></li>
        <li>商品三级分类ID:<input type="text" name="pdthreeId" required></li>
        <li>入库时间:<input type="date" name="pdDate" required></li>
        <li>价格:<input type="number" name="pdPrice" required></li>
        <li>图片:<input type="text" name="pdCover"required></li>
        <li>
            <!-- 在页面隐藏员工ID-->
            <input type="hidden" name="pdId" required>
            <input type="submit" value="添加商品">&nbsp;&nbsp;
            <input type="reset" value="重新填写">

        </li>
    </ul>
</form>
</body>
</html>
