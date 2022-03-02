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
        <link rel="stylesheet" href="${ctx}/resource/static_yh/lib/layui/css/layui.css"  media="all">

        <script type="text/javascript" src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${ctx}/resource/static_yh/js/index.js"></script>
        <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
        <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>


    </head>
    <body>

        <div class="layui-card">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">

              <div class="layui-tab-content" >
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-form-pane" enctype="multipart/form-data" id="myupdate">

                        <input type="hidden" name="id" value="${obj.id}" />

                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>标题
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="name" autocomplete="off" value="${obj.name}"
                                class="layui-input" lay-verify="required"/>
                            </div>
                        </div>


                        <div class="layui-form-item layui-form-text">
                            <div class="label">
                                <label class="layui-form-label"  >
                                    <span class='x-red'>*</span>内容
                                </label>
                            </div>
                            <div class="field">
                                <script type="text/plain" id="remark_txt_1" name="content" style="width: 100%;height: 300px;">${obj.content}</script>
                                <script type="text/javascript">
                                var editor = UE.getEditor('remark_txt_1');
                                UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
                                UE.Editor.prototype.getActionUrl = function (action) {
                                    if(action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo'){
                                        return '${ctx}/ueditor/saveFile';
                                    }else{
                                        return this._bkGetActionUrl.call(this,action);
                                    }
                                }
                                </script>
                                <div class="tips"></div>
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


            layui.use(['upload', 'element', 'layer','form'], function(){
                var $ = layui.jquery
                    ,upload = layui.upload
                    ,element = layui.element
                    ,layer = layui.layer
                    ,form = layui.form;


                //监听提交
                form.on('submit(*)', function(data){

                    //var data1 = data.field; //使用data.field获取到的表单数据是json格式，但是通过ajax传不到后台，
                                                //mysql会报错id找不到，我想可能是上传了文件的问题这样的方式行不同
                    var myForms = $('#myupdate')[0];
                    var formdatas = new FormData(myForms);
                    //console.log(formdatas);   /*下次上来搞明白这里*/
                    //console.log(data1);

                    $.ajax({
                        type:"post",
                        url:"${ctx}/news/exUpdate",
                        data:formdatas,//单张图片上传改为formdatas
                        contentType: false,//查文档ajax
                        processData: false,//查文档ajax  //不加这两条会报500
                        dataType:"json",
                        success:function (data) {
                            if (data.code==20000){
                                console.log("update_yh修改"+data.message);
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
            });
        </script>

    </body>
</html>