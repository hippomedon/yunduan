<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>商品类型</title>
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
            <a href="">商品管理</a>
            <a>
              <cite>商品类型</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username"  placeholder="待开发" autocomplete="off" class="layui-input" >
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick="xadmin.open('添加商品','${ctx}/itemCategory/add',800,600)"><i class="layui-icon"></i>添加</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th  style="width: 39px;">
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>
                                ID
                            </th>
                            <th>
                                类别名称
                            </th>
                            <th>
                                子商品
                            </th>

                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
                            <tr>
                                <td>
                                    <input type="checkbox" name="id" value="1"   lay-skin="primary">
                                </td>

                                <td>
                                   ${data.id}
                                </td>

                                <td >
                                    ${data.name}
                                </td>

                                <td class="td-status">
                                    <a class="layui-btn layui-btn-normal" href="${ctx}/itemCategory/findBySql2?pid=${data.id}">查看二级分类</a>
                                </td>

                                <td class="td-manage">
                                    <a title="编辑" href="javascript:;" onclick="xadmin.open('编辑','${ctx}/itemCategory/update?id=${data.id}','800','510','1')"
                                       class="ml-5" style="text-decoration:none">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>

                                    <a title="删除" href="javascript:;" onclick="member_del(this,${data.id})"
                                       style="text-decoration:none">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>

                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <pg:pager url="${ctx}/itemCategory/findBySql" maxIndexPages="5" items="${pagers.total}" maxPageItems="10" export="curPage=pageNumber">
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
<%--
                            <a class="num" href="">1</a>
                            <span class="current">2</span>
                            <a class="num" href="">3</a>
                            <a class="num" href="">489</a>
                            <a class="next" href="">&gt;&gt;</a>--%>
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