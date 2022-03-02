<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>云端图书</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/static_yh/css/lunbo.css">
    <script type="text/javascript" src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
</head>
<body>
    <%@include file="/common/utop.jsp"%>
<!--导航条-->
<div class="width100" style="height: 45px;background: #dd4545;margin-top: 40px;position: relative;z-index: 100;">
    <!--中间的部分-->
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
        <!--列表导航-->
        <div class="left_yh Selected" style="width: 200px;height: 45px;" id="hiddenShow">
            <!--头部的图标-->
            <img src="${ctx}/resource/user/images/cd.png" class="left_yh" style="margin-left: 24px;" alt="">
            <span class="block_yh left_yh fff" style="height: 45px;line-height: 44px;margin-left: 10px;">分类</span>
            <!--导航展开部分-->
            <div class="downSlide"  style="width: 200px;">
                <c:forEach items="${lbs}" var="data" varStatus="l">
                    <div class="n1Nav" style="width: 100%">
                        <font style=" margin-left: 80px;">${data.father.name}</font>
                        <img src="${ctx}/resource/user/images/jt.png" alt="" style=" margin-right: 30px">
                        <div class="n2Nav">
                            <div class="n3Nav">
                                <h3>${data.father.name}</h3>
                                <c:forEach items="${data.childrens}" var="child" varStatus="ll">
                                    <a href="${ctx}/item/shoplist?categoryIdTwo=${child.id}">${child.name}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav" >
            <a href="${ctx}/login/uIndex" style="color: #fff">首页</a>
            <a href="${ctx}/news/list" style="color: #fff">公告</a>
            <a href="${ctx}/message/add" style="color: #fff">留言</a>
        </div>
    </div>
</div>
<!--轮动广告-->
<div class="width1200 center_yh hidden_yh" style="position: relative;z-index:80;">

    <div id="ad" >
        <ul>
            <li>
                <a href="#" title="位置1"><img src="${ctx}/resource/images_yh/banner/17152_ad990.jpg" alt=""></a>
            </li>
            <li>
                <a href="#" title="位置2"><img src="${ctx}/resource/images_yh/banner/17304_ad990.jpg" alt=""></a>
            </li>
            <li>
                <a href="#" title="位置3"><img src="${ctx}/resource/images_yh/banner/17317_ad990.jpg" alt=""></a>
            </li>
            <li>
                <a href="#" title="位置4"><img src="${ctx}/resource/images_yh/banner/17341_ad990.jpg" alt=""></a>
            </li>
            <li>
                <a href="#" title="位置5"><img src="${ctx}/resource/images_yh/banner/17343_ad990.jpg" alt=""></a>
            </li>
            <li>
                <a href="#" title="位置6"><img src="${ctx}/resource/images_yh/banner/990360.jpg" alt="">></a>
            </li>
        </ul>
    </div>
    <div class="slideshortcut">
        <a id="SlidePrev" class="prev">&lt;</a>
        <a id="SlideNext" class="next">&gt;</a>
    </div>
    <div class="jiaodiandiv">
        <ul>
            <li id="selectli"><span>1</span></li>
            <li><span>2</span></li>
            <li><span>3</span></li>
            <li><span>4</span></li>
            <li><span>5</span></li>
            <li><span>6</span></li>
        </ul>
    </div>
    <script type="text/javascript">
       /* $(function () {  轮播
                $(".inner").luara({width:"996",height:"490",interval:4500,selected:"seleted",deriction:"left"});
        });*/
    </script>
</div>
<!--折扣商品-->
<div class="width1200 center_yh hidden_yh">
    <div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
        <font class="left_yh font20" style="color: #ff621d;font-style: oblique;font-weight: bold">折扣大促销></font>
        <span style="font-size:17px;color:#333333;font-style: oblique; margin-left: 10px;">全场包邮，低至一折，每天上线</span>
    </div>
    <div class="width100 hidden_yh" style="height: 480px;">
        <div class="normalPic">
            <c:forEach items="${zks}" var="data" varStatus="l">
                <a href="${ctx}/item/view?id=${data.id}">
                    <h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">${data.name}</h3>
                    <p class="red font14" style="padding-left: 10px;">${data.price}</p>
                    <img src="${data.url1}" width="105" height="118" alt="" style="margin:0 auto">
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<!--热门商品-->
<div class="width1200 center_yh hidden_yh">
    <div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
        <font class="left_yh font20" style="color: #ff621d;font-style: oblique;font-weight: bold">热门商品></font>
        <span style="font-size:17px;color:#333333;font-style: oblique; margin-left: 10px;">销量最高，人气爆火</span>
    </div>
    <div class="width100 hidden_yh" style="height: 480px;">
        <div class="normalPic">
            <c:forEach items="${rxs}" var="data" varStatus="l">
                <a href="${ctx}/item/view?id=${data.id}">
                    <h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">${data.name}</h3>
                    <p class="red font14" style="padding-left: 10px;">${data.price}</p>
                    <img src="${data.url1}" width="105" height="118" alt="" style="margin:0 auto">
                </a>
            </c:forEach>
        </div>
    </div>
</div>
    <%@include file="/common/footer_yh.jsp"%>
    <script type="text/javascript" src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resource/static_yh/js/lunbo.js"></script>
</body>
</html>