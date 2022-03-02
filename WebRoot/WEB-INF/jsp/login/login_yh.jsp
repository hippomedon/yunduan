<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>管理登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${ctx}/resource/static_yh/css/font.css">
    <link rel="stylesheet" href="${ctx}/resource/static_yh/css/login.css">
	  <link rel="stylesheet" href="${ctx}/resource/static_yh/css/index.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/resource/static_yh/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <h1 style="text-align: center">管理登录</h1>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="${ctx}/login/toLogin">
            <input name="userName" placeholder="用户名" value="admin1"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="passWord"  placeholder="密码"  value="111111" type="password" lay-verify="required" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <!-- 底部结束 -->
    <script>
    //百度统计可去掉
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
      var s = document.getElementsByTagName("script")[0]; 
      s.parentNode.insertBefore(hm, s);
    })();
    </script>
</body>
</html>