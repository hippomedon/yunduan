<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>添加商品</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${ctx}/resource/static_yh/css/font.css">
        <link rel="stylesheet" href="${ctx}/resource/static_yh/css/index.css">
        <script type="text/javascript" src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${ctx}/resource/static_yh/js/index.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->

    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                  <div class="layui-form-item">
                      <label for="username" class="layui-form-label">
                          <span class="x-red">*</span>商品名称
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="name" name="name" required="" lay-verify="required" placeholder="请输入商品名称"
                          autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>
                      </div>
                  </div>


                  <div class="layui-form-item">
                      <label  class="layui-form-label">
                      </label>
                      <button  class="layui-btn" lay-filter="add" lay-submit="">
                          确认
                      </button>
                  </div>
              </form>
            </div>
        </div>
        <script type="text/javascript">
            layui.use(['form', 'layer'], function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //监听提交
                form.on('submit(add)', function(data) {
                    //发异步，把数据提交给
                    var data1 = data.field;
                    $.ajax({
                        type:"post",
                        url:"${ctx}/itemCategory/exAdd",
                        data:data1,
                        dataType:"json",
                        success:function (data) {
                            if(data.code==20000){
                                console.log("type-add_yh_2新增"+data.message);
                                layer.alert("增加成功", {
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

            });
        </script>
        <script  type="text/javascript">
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </body>

</html>
