<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <title>
            商品类型修改
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">

        <link rel="stylesheet" href="${ctx}/resource/static_yh/css/font.css">
        <link rel="stylesheet" href="${ctx}/resource/static_yh/css/index.css">
        <script src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${ctx}/resource/static_yh/js/index.js"></script>
    </head>
    <body>

        <div class="layui-card">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">

              <div class="layui-tab-content" >
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-form-pane">

                        <input type="hidden" name="id" value="${obj.id}" />

                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>商品类型
                            </label>
                            <div class="layui-input-block">
                                <select name="">
                                    <option value="0">--顶级分类--</option>
                                    <option value="1">水果</option>
                                    <option value="2">其他</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>类型名称
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="name" autocomplete="off" value="${obj.name}"
                                class="layui-input" lay-verify="required">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <button class="layui-btn" lay-submit="" lay-filter="*" >
                                保存
                            </button>
                        </div>
                    </form>
                    <div style="height:100px;"></div>
                </div>

              </div>
            </div> 
        </div>

        <script type="text/javascript">
            layui.use(['layer','form'], function(){
                $ = layui.jquery;//jquery
                var form = layui.form,
                    layer = layui.layer;

             //监听提交
                form.on('submit(*)', function(data){
                   /* var name = $("input[name=name]").val();
                    if(name ==""){
                        layer.msg("文章分类名称不能为空！",{icon:5,time:2000});return false;
                    }*/

                    var data1 = data.field;
                    console.log(data1);
                    $.ajax({
                        type:"post",
                        url:"${ctx}/itemCategory/exUpdate",
                        data:data1,
                        dataType:"json",
                        success:function (data) {
                            if (data.code==20000){
                                console.log("update_yh修改"+data.message);
                                /*layer.msg(data.info,{icon:1,time:2000});
                               // setTimeout(function(){
                                    window.parent.location.reload();
                                    var index = parent.layer.getFrameIndex(window.name);
                                    parent.layer.close(index);
                               // },1000);//不知道为什么这个settimeout 不起作用,这个也可以关闭弹层刷新页面*/
                                layer.alert("修改成功", {
                                    icon: 6
                                }, function() {
                                    //关闭当前frame
                                    xadmin.close();
                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                            }
                        }
                    });
                    return false;
                });
            })
            </script>
            
    </body>
</html>