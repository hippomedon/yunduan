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
                                <span class='x-red'>*</span>商品名称
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="name" autocomplete="off" value="${obj.name}"
                                class="layui-input" lay-verify="required"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>作者
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="autor"  lay-verify="required" value="${obj.autor}"
                                       autocomplete="off" class="layui-input"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>作品出版社
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="pub"  lay-verify="required" value="${obj.pub}"
                                       autocomplete="off" class="layui-input"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>出版时间
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="pubtime"  lay-verify="required" value="${obj.pubtime}"
                                       autocomplete="off" class="layui-input"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>商品价格
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="price" autocomplete="off" value="${obj.price}"
                                       class="layui-input" lay-verify="required">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                商品折扣
                            </label>
                            <div class="layui-input-block">
                                <input type="text" name="zk" autocomplete="off" value="${obj.zk}"
                                       class="layui-input" >
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>商品类别
                            </label>
                            <div class="layui-input-block">
                                <select name="categoryIdTwo">
                                    <c:forEach items="${types}" var="data" varStatus="l">
                                        <option value="${data.id}" ${obj.categoryIdTwo == data.id?"selected":""}>${data.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>




                        <%--<div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>主图
                            </label>
                            <div class="layui-upload">

                                <button class="layui-btn " id="preview_img" type="button" name="file">
                                    上传图片
                                </button>
                                <div class="layui-upload-list" style="margin-left: 108px;">
                                    <img class="layui-upload-img" id="demo" width="92px" height="92px" src="${obj.url1}">
                                    <p id="demoText"></p>
                                </div>
                                <div class="layui-collapse" lay-accordion="" style="width: 399.5px; margin-left: 108px;">
                                    <div class="layui-colla-item">
                                        <h2 class="layui-colla-title">展开图片</h2>
                                        <div class="layui-colla-content" id="colla_img" style="">
                                        </div>
                                    </div>
                                </div>
                            </div>   因为实现不了多按钮多图片上传故阉割掉，但是单图片上传通过ajax成功--%>
                          <%-- <div class="layui-input-block">
                                <input type="file" name="file" autocomplete="off"
                                       class="layui-input" lay-verify="required">
                                <div class="tips"><img src="${obj.url1}" alt="${obj.url1}"></div>
                            </div>
                        </div>--%>


                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class='x-red'>*</span>主图
                            </label>
                            <div class="layui-upload">

                                <button class="layui-btn" id="preview_img" type="button" name="file">
                                    上传图片
                                </button>
                                <div class="layui-upload-list" style="margin-left: 108px;">
                                    <img class="layui-upload-img" id="demo" width="92px" height="92px" src="${obj.url1}">
                                    <p id="demoText"></p>
                                </div>
                                <div class="layui-collapse" lay-accordion="" style="width: 399.5px; margin-left: 108px;">
                                    <div class="layui-colla-item">
                                        <h2 class="layui-colla-title">展开图片</h2>
                                        <div class="layui-colla-content" id="colla_img" style="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="layui-form-item layui-form-text">
                            <div class="label"><label class="layui-form-label"  ><span class='x-red'>*</span>描述</label></div>
                            <div class="field">
                                <script type="text/plain" id="remark_txt_1" name="ms" style="width: 100%;height: 300px;">${obj.ms}</script>
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

                //下面是单按钮单图片上传
                var myfile;
                //常规使用 - 普通图片上传
                var uploadInst = upload.render({
                    elem: "#preview_img"
                    ,url: '${ctx}/item/exUpdate' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
                    ,auto: false
                    //,bindAction: '#upload_img'  //指向上一个按钮触发上传
                    //,accept:'file'
                    ,accept: 'images',
                    choose: function (obj) {
                        obj.preview(function (index, file, result) {
                            $('#demo').attr('src',result);
                            myfile = file
                           // $('#fileName').val(file.name); //展示文件名
                            $('#colla_img').find('img').remove();
                            $('#colla_img').append('<a href="#" οnclick="openImg();"><img id="showImg" src="' + result + '" width="370px"></a>');
                        })
                    },
                    before: function(obj) {
                        // 预读本地文件示例，不支持ie8
                        obj.preview(function(index, file, result) {
                            $('#demo').attr('src', result); // 图片链接（base64）
                        });
                    },

                    done: function (res) {
                       // $('#credential_hide').val(res.msg); //隐藏输入框赋值
                        //$('#submitForm').click(); //上传成功后单击隐藏的提交按钮
                        // 如果上传失败
                        if(res.code > 0) {
                            return layer.msg('上传失败');
                        }
                        //上传成功
                    },

                    error: function (index, upload) {
                        //layer.msg('上传失败！' + index, {icon: 5});
                        // 演示失败状态，并实现重传
                        var demoText = $('#demoText');
                        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                        demoText.find('.demo-reload').on('click', function() {
                            uploadInst.upload();
                        });
                    }
                });

                //多图片上传
                upload.render({
                    elem: '#test2'
                    ,url: '' //此处配置你自己的上传接口即可
                    ,multiple: true
                    ,before: function(obj){
                        //预读本地文件示例，不支持ie8
                        obj.preview(function(index, file, result){
                            $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                        });
                    }
                    ,done: function(res){
                        //上传完毕
                    }
                });

                //监听提交
                form.on('submit(*)', function(data){

                    //var data1 = data.field;
                    var myForms = $('#myupdate')[0];
                    var formdatas = new FormData(myForms);  //这么获取的数据已经是json
                    //formdatas.append("item",JSON.stringify(data.field));
                    //formdatas.append("file",myfile); /*单张图片上传相关代码*/
                    //formdatas.append("file[]",myfile);
                    console.log(formdatas);   /*下次上来搞明白这里*/


                    $.ajax({
                        type:"post",
                        url:"${ctx}/item/exUpdate",
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