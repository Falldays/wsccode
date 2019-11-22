<%--
  Created by IntelliJ IDEA.
  User: FanLiMing
  Date: 2019/11/21
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
    <script src="js/jquery.min.js"></script>
    <script>
        $(function () {
            //利用jQuery AJAX加载部门数据和当前员工数据
            $.ajax({
                url: '/emp/load_one',//请求URL
                data: {emp_id: '${param.emp_id}'},//请求参数
                type: 'POST',//请求方式
                dataType: 'json', //将从服务器获取的数据处理成JSON格式
                success: function (data) {
                    //请求成功,data表示从服务获取的数据
                    console.info(data)
                    //获取员工数据
                    var emp=data.emp;
                    if($.isEmptyObject(emp)){
                        alert("该员工不存在或已被删除");
                        $('input,select').attr('disabled',true);
                        return;
                    }
                    //设置员工数据
                    $('input[name="empNo"]').val(emp.empNo);
                    $('input[name="empName"]').val(emp.empName);
                    $('input[name="mobile"]').val(emp.mobile);
                    $('input[name="birthday"]').val(emp.birthday);
                    $('input[name="salary"]').val(emp.salary);
                    $('input[name="homeplace"]').val(emp.homeplace);
                    //选中性别单选框
                    $(':radio[name="sex"][value="'+emp.sex+'"]').attr('checked',true);
                    var deps=data.deps;
                    var length=deps.length;
                    if(0==length){
                        alert("未加载到部门数据");
                        return ;
                    }
                    for(var index=0;index<length;index++){
                        var dep=deps[index];
                        var depId=dep.depId;//部门ID
                        var depName=dep.depName;//部门名称
                        var optionHTML='<option value="'+depId+'">'+depName+'</option>';
                        $("#dep-select").append(optionHTML);
                    }
                    //默认选中用户所属部门
                    $("#dep-select").val(emp.depId);
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

<section class="cartMain">
    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk">
                <!--所有商品全选-->
                <input type="checkbox" id="all" class="whole_check">
                <label for="all"></label>
                全选
            </li>
            <li class="list_con">商品名称</li>
            <li class="list_info">商品参数</li>
            <li class="list_price">单价</li>
            <li class="list_amount">数量</li>
            <li class="list_sum">金额</li>
            <li class="list_op">操作</li>
        </ul>
    </div>

    <div class="cartBox">
        <div class="order_content">
            <ul class="order_lists">
                <li class="list_chk">
                    <input type="checkbox" id="checkbox_2" class="son_check">
                    <label for="checkbox_2"></label>
                </li>
                <li class="list_con">
                    <div class="list_img"><a href="/collect/getpro?pd_id=${collect.pdId}"><img src="" alt=""></a></div>
                    <div class="list_text"><a href="/collect/getpro?pd_id=${collect.pdId}">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
                </li>
                <li class="list_info">
                    <p>规格：默认</p>
                    <p>尺寸：16*16*3(cm)</p>
                </li>
                <li class="list_price">
                    <p class="price">￥980</p>
                </li>
                <li class="list_amount">
                    <div class="amount_box">
                        <a href="javascript:;" class="reduce reSty">-</a>
                        <input type="text" value="1" class="sum">
                        <a href="javascript:;" class="plus">+</a>
                    </div>
                </li>
                <li class="list_sum">
                    <p class="sum_price">￥980</p>
                </li>
                <li class="list_op">
                    <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                </li>
            </ul>
        </div>
    </div>
            <!--底部-->
            <div class="bar-wrapper">
                <div class="bar-right">
                    <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                    <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                    <div class="calBtn"><a href="javascript:;">结算</a></div>
                </div>
            </div>
</section>

<section class="model_bg"></section>
<section class="my_model">
    <p class="title">删除宝贝<span class="closeModel">X</span></p>
    <p>您确认要删除该宝贝吗？</p>
    <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a>
        <a href="" class="dialog-close">关闭</a></div>
</section>


<script src="js/carts.js"></script>


</body>
</html>
