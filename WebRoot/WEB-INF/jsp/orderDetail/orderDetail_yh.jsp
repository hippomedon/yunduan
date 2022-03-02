<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <%--<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="stylesheet" href="${ctx}/resource/static_yh/css/font.css">
    <link rel="stylesheet" href="${ctx}/resource/static_yh/css/index.css">
    <script src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/resource/static_yh/js/index.js"></script>

</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">订单管理</a>
            <a>订单列表</a>
              <a>
              <cite>订单详情</cite>
            </a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">

                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>

                            <th>
                                商品名称
                            </th>
                            <th>
                                商品图
                            </th>
                            <th>
                                商品单价
                            </th>
                            <th>
                                购买数量
                            </th>
                            <th>
                                小计
                            </th>
                            <th>
                                状态
                            </th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
                            <tr>
                                <td>
                                        ${data.item.name}
                                </td>

                                <td><img src="${data.item.url1}" alt="" style="width: 100px;height: 100px;"></td>
                                <td>
                                        ${data.item.price}
                                </td>
                                <td >
                                        ${data.num}
                                </td>
                                <td >
                                        ${data.total}
                                </td>
                                <td style="color: red">
                                    <c:if test="${data.status == 0}">未退货</c:if>
                                    <c:if test="${data.status == 1}">已退货</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <pg:pager url="${ctx}/orderDetail/ulist" maxIndexPages="5" items="${pagers.total}" maxPageItems="10" export="curPage=pageNumber">
                                <pg:param name="orderId" value="${obj.orderId}"/>   <%--传递orderId--%>
                                <pg:last>
                                    共${pagers.total}记录，共${pageNumber}页，
                                </pg:last>
                                <pg:first>
                                    <a href="${pageUrl}">首页</a>
                                </pg:first>
                                <pg:prev>
                                    <a class="prev" href="${pageUrl}">&lt;&lt;</a>
                                </pg:prev>
                                <pg:pages>
                                    <c:choose>
                                        <c:when test="${curPage eq pageNumber}">
                                            <span class="current">${pageNumber}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageUrl}">${pageNumber}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </pg:pages>
                                <pg:next>
                                    <a class="next" href="${pageUrl}">&gt;&gt;</a>
                                </pg:next>
                                <pg:last>
                                    <c:choose>
                                        <c:when test="${curPage eq pageNumber}">
                                            <span class="current">尾页</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageUrl}">尾页</a>
                                        </c:otherwise>
                                    </c:choose>
                                </pg:last>
                            </pg:pager>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate','form'], function(){
        $ = layui.jquery;
        var laydate = layui.laydate;
        var  form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody input').prop('checked',true);
            }else{
                $('tbody input').prop('checked',false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-添加*/
    function member_add(title,url,id,w,h){

        xadmin.open(title,url,id,w,h);
    }

    /*用户-停用*/
   /* function member_stop(obj,id){
        layer.confirm('确认要停用吗？',{icon:3,title:'提示信息'},function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }*/

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            <!--发异步删除数据-->
            //
            // console.log("xxx"+id);
            $.ajax({
                type:"POST",
                url:"${ctx}/itemCategory/delete",
                //data:"id="+id,
                data:{id:id},
                dataType:"json",
                success:function (data) {
                    console.log("type_yh删除"+data.message);
                }
            });
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});


        });
    }



    function delAll (argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？'+ids.toString(),{icon:3,title:'提示信息'},function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>