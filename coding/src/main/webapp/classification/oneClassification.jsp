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
<script>
    function deleteOne(oneId,oneName) {
        if(!oneId)
        {
            alert('Error！');
            return false;
        }

        $.ajax(
            {
                url: "classification/deleteOneClassificationByOneId",
                data:{"oneId":oneId},
                type: "post",
                beforeSend:function()
                {
                    $("#msg").html("<span style='color:blue'>正在处理...</span>");
                    return true;
                },
                success:function(data)
                {
                    if(data > 0)
                    {
                        alert('操作成功');
                        $("#msg").html("<span style='color:blueviolet'>恭喜，删除成功！</span>");

                        // document.location.href='world_system_notice.php'
                        location.reload();
                    }
                    else
                    {
                        $("#msg").html("<span style='color:red'>失败，请重试</span>");
                        alert('操作失败');
                    }
                },
                error:function()
                {
                    alert('请求出错');
                },
                complete:function()
                {
                    // $('#tips').hide();
                }
            });

        return false;

    }
</script>
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
                        <a href="queryClassification"><button type="button" class="btn btn-primary" ><span>显示所有</span></button></a>
                        <a href="../classification/addOne.jsp"><button type="button" class="btn btn-warning" ><span>添加一级分类</span></button></a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="left">
                    <div class="col-sm-9 text-center" >
                        <span style="color:rgb(255,0,0)">${msg}</span>
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
                                <input type="hidden" value="${classification.claName}" id="hidden01"/>
                                <input type="hidden" value="${classification.claFid}" id="hidden02"/>
                                <button type="button" class="btn btn-primary" ><span>修改</span></button>
                                <button type="button" class="btn btn-danger" ${classification.number==0? "":"disabled"}  data-toggle="modal" data-target="#myModal" onclick="return deleteOne(${classification.claFid},${classification.claName})">
                                    <span>删除</span>
                                </button>
                            </td>
                        </tr>

                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        删除分类
                    </h4>
                </div>
                <div class="modal-body" id="my-div">
                    是否确定删除一级分类：&nbsp;&nbsp;&nbsp;${classification.claName}${classification.claFid}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        取消
                    </button>
                    <button type="submit" class="btn btn-danger" data-dismiss="#myModal">
                        确认删除
                    </button><span id="msg"> </span>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
</body>

</html>