<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/23
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改商品</title>
    <script src="/js/jquery.min.js"></script>

    <script>
        $(function () {
            //利用jQuery AJAX加载部门数据和当前员工数据
            $.ajax({
                url: '/admin/load_product',//请求URL
                data: {pd_id: '${param.pd_id}'},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data)
                    //获取员工数据
                    var product=data.product;
                    if($.isEmptyObject(product)){
                        alert("该商品不存在或已被删除");
                        $('input,select').attr('disabled',true);
                        return;
                    }
                    //设置员工数据
                    $('input[name="pdthreeId"]').val(product.pdthreeId);
                    $('input[name="pdNo"]').val(product.pdNo);
                    $('input[name="pdName"]').val(product.pdName);
                    $('input[name="pdDate"]').val(product.pdDate);
                    $('input[name="pdPrice"]').val(product.pdPrice);
                    $('input[name="pdCover"]').val(product.pdCover);
                    $("#img01").attr("src",product.pdCover);
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

<form action="/admin/updateproduct" method="post">
    <ul style="list-style: none">
        <li><h3>修改商品</h3></li>
        <li>商品编号:<input type="text" name="pdNo" required ></li>
        <li>商品名称:<input type="text" name="pdName" required></li>
        <li>商品分类:<input type="text" name="pdthreeId" required></li>
        <li>入库时间:<input type="date" name="pdDate" required></li>
        <li>价格:<input type="number" name="pdPrice" required></li>
        <%--<li><div>图片:<input type="text" name="pdCover"><image id="img01"/></div></li>--%>

        <li>
            <!-- 在页面隐藏员工ID-->

            <input type="hidden" name="pdId" value="${param.pd_id}">
            <input type="submit" value="修改商品">&nbsp;&nbsp;
            <input type="reset" value="重新填写">

        </li>

    </ul>
</form>

</body>
</html>
