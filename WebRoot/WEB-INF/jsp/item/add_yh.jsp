<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <title>
            添加商品
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${ctx}/resource/static_yh/css/font.css">
        <link rel="stylesheet" href="${ctx}/resource/static_yh/css/index.css">
        <script type="text/javascript" src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${ctx}/resource/static_yh/js/index.js"></script>
        <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
        <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>



    </head>
    <body>
    <div class="layui-fluid">
        <div class="layui-row">
            <form class="layui-form " enctype="multipart/form-data" id="myupdate">


                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>商品名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="name"  lay-verify="required" placeholder="请输入商品名称"
                               autocomplete="off" class="layui-input"/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>作者
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="autor"  lay-verify="required" placeholder="请输入作品作者"
                               autocomplete="off" class="layui-input"/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>作品出版社
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="pub"  lay-verify="required" placeholder="请输入作品出版社"
                               autocomplete="off" class="layui-input"/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>出版时间
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="pubtime"  lay-verify="required" placeholder="请输入商出版时间"
                               autocomplete="off" class="layui-input"/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>商品价格
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" autocomplete="off" placeholder="请输入商品价格"
                               class="layui-input" lay-verify="required">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        商品折扣
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="zk" autocomplete="off"   placeholder="请输入商品折扣"
                               class="layui-input" >
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>商品类别
                    </label>
                    <div class="layui-input-inline">
                        <select name="categoryIdTwo">
                            <c:forEach items="${types}" var="data" varStatus="l">
                                <option value="${data.id}">${data.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class='x-red'>*</span>主图
                    </label>
                    <div class="layui-upload">

                        <button class="layui-btn" id="preview_img" type="button" name="file">
                            上传图片
                        </button>
                        <div class="layui-upload-list" style="margin-left: 108px;">
                            <img class="layui-upload-img" id="demo" width="92px" height="92px" >
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

                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>描述
                    </label>
                    <div class="layui-input-block">
                        <script type="text/plain" id="remark_txt_1" name="ms" style="width: 100%;height: 300px;"></script>
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
                    ,url: '${ctx}/item/exAdd' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
                    ,auto: false
                    ,accept: 'images',
                    choose: function (obj) {
                        obj.preview(function (index, file, result) {
                            $('#demo').attr('src',result);
                            myfile = file;

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

                //监听提交
                form.on('submit(add)', function(data){

                    //var data1 = data.field;  data.field是个[objet objet]   formdatas传的是json
                    var myForms = $('#myupdate')[0];
                    var formdatas = new FormData(myForms);

                    console.log(formdatas);   /*下次上来搞明白这里*/


                    $.ajax({
                        type:"post",
                        url:"${ctx}/item/exAdd",
                        data:formdatas,//单张图片上传改为formdatas
                        contentType: false,//查文档ajax
                        processData: false,//查文档ajax  //不加这两条会报500
                        dataType:"json",
                        success:function (data) {
                            if (data.code==20000){
                                console.log("add_yh添加"+data.message);
                                layer.alert("新增成功", {
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