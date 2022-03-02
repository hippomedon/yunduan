<%--
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
<%@include file="/common/utop.jsp"%>
<!--导航条-->
<%@include file="/common/unav.jsp"%>

<div class="width100 hidden_yh" style="border-top: 1px solid #ddd">
    <div class="width1200 hidden_yh center_yh" style="margin-top: 75px">
        <form action="${ctx}/login/toRes" method="post">
            <div class="center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                <span style="margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">用户名：</span>
                <input type="text" name="userName" placeholder="请输入您的用户名" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
            </div>
            <div class="center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                <span style="margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">设置密码：</span>
                <input type="text" name="passWord" placeholder="建议至少使用两种字符组合" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
            </div>
            <div class="center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                <span style="margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">手机号：</span>
                <input type="text" name="phone" placeholder="建议使用常用的手机" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
            </div>
            <div class="center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                <span style="margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">电子邮箱：</span>
                <input type="text" name="email" placeholder="请输入邮箱" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
            </div>
            <p class="font14 c_66" style="text-indent: 500px;margin-top: 30px;">
                <input type="checkbox">我已阅读并同意<a href="#" class="red">《会员注册协议》</a>和<a href="#" class="red">《隐私保护政策》</a>
            </p>
            <input type="submit" value="提交" class="ipt_tj" style="width: 295px;height: 44px;margin-left: 500px;">
        </form>
    </div>
</div>
<%@include file="/common/footer_yh.jsp"%>
</body>
</html>

--%>









<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>用户注册</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <link rel="stylesheet" href="${ctx}/resource/static_yh/css/font.css">
    <link rel="stylesheet" href="${ctx}/resource/static_yh/css/index.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%@include file="/common/utop.jsp"%>
<!--导航条-->
<%@include file="/common/unav.jsp"%>
<div class="width100 hidden_yh" style="height: 573px;background: url('${ctx}/resource/user/images/bj.jpg') no-repeat center">
    <div class="width1200 hidden_yh center_yh" style="margin-top: 20px">
        <div class="right_yh bj_fff" style="width:526px;height: 530px;">
            <form class="layui-form" action="${ctx}/login/toRes" method="post" style="margin-top: 20px">
                <h3 class="tcenter font30 c_33" style="font-weight: 100;margin-top: 36px;margin-bottom: 36px;">账号注册</h3>
                <div class="layui-form-item center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                    <span style="margin-right: 15px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">用户名：</span>
                    <div class="layui-input-inline">
                        <input class="left_yh layui-input" type="text" name="userName"  autocomplete="off"  required="" lay-verify="required" placeholder="请输入您的用户名" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" >
                    </div>
                </div>

                <div class="layui-form-item center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                    <span style="margin-right: 15px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">设置密码：</span>
                    <div class="layui-input-inline">
                        <input class="left_yh layui-input" type="text" name="userName"  autocomplete="off"  required="" lay-verify="required" placeholder="建议至少使用两种字符组合" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" >
                    </div>
                </div>

                <div class="layui-form-item center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                    <span style="margin-right: 15px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">手机号：</span>
                    <div class="layui-input-inline">
                        <input class="left_yh layui-input" type="text" name="userName"  autocomplete="off"  required="" lay-verify="required" placeholder="建议使用常用的手机" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" >

                    </div>
                </div>
                <div class="center_yh hidden_yh" style="width: 475px;margin-bottom: 40px;">
                    <span style="margin-right: 15px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">电子邮箱：</span>
                    <div class="layui-input-inline">
                        <input class="left_yh layui-input" type="text" name="userName"  autocomplete="off"  required="" lay-verify="required" placeholder="请输入邮箱" style="border:1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" >
                    </div>
                </div>

                <p class="font14 c_66" style="text-indent: 100px;">
                    <input type="checkbox" style="display: inline-block">我已阅读并同意<a href="#" class="red">《会员注册协议》</a>和<a href="#" class="red">《隐私保护政策》</a>
                </p>

                <input type="submit" value="注册" class="center_yh" style="width: 295px;height: 45px;margin-left: 140px;margin-top: 20px;font-size: 16px;background: #dd4545;outline: none;border: 0;color: #fff; cursor:pointer;">
            </form>
        </div>
    </div>
</div>
<%@include file="/common/footer_yh.jsp"%>
</body>
</html>








