<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>管理员登录</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/ml/css/style.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container" >
    <div class="line bouncein" style="padding-top: 100px;">
        <div class="xs6 xm4 xs3-move xm4-move">
            <form action="${ctx}/login/toLogin" method="post">
                <div class="panel login-box">
                    <div class="text-center margin-big padding-big-top"><h1>管理员登录</h1></div>
                    <div class="panel-body" style="padding: 30px;padding-bottom: 10px; padding-top: 10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="userName" placeholder="用户名" data-validate="required:请输入账号！" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="passWord" placeholder="密码" data-validate="required:请输入密码！" />
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                    </div>
                    <div style="padding: 30px;">
                        <input type="submit" class="button button-block bg-main text-big input-big" value="登录" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>