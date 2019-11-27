<%--
  Created by IntelliJ IDEA.
  User: luliujun
  Date: 2019/9/25
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改订单</title>
    <script src="/js/jquery.min.js"></script>
    <script>
        $(function () {
            //利用jQuery AJAX加载数据
            $.ajax({
                url: '/order/load_one',//请求URL
                data: {order_id: '${param.orderId}'},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data)
                    //获取员工数据
                    var order=data.order;
                    if($.isEmptyObject(order)){
                        alert("该订单不存在或已被删除");
                        $('input,select').attr('disabled',true);
                        return;
                    }
                    //设置订单数据
                    $('input[name="orderNo"]').val(order.orderNo);
                    $('input[name="userId"]').val(order.userId);
                    $('input[name="orderPrice"]').val(order.orderPrice);
                    $('input[name="expressNo"]').val(order.expressNo);
                    $('input[name="orderStatus"]').val(order.orderStatus);
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
<form action="/order/updateOrder" method="post">
    <ul style="list-style: none">
        <li><h3>修改订单</h3></li>
        <li>订单编号:<input type="text" name="orderNo" required></li>
        <li>订单总价:<input type="text" name="orderPrice" required></li>
        <li>快递单号:<input type="text" name="expressNo" required></li>
        <li>订单状态:<input type="number" name="orderStatus" required></li>
        <!-- 在页面隐藏用户ID-->
            <input type="hidden" name="userId" value="${param.userId}">
            <input type="hidden" name="orderId" value="${param.orderId}">
            <input type="submit" value="修改订单">&nbsp;&nbsp;
            <input type="reset" value="重新填写">
        </li>
    </ul>
</form>
</body>
</html>
