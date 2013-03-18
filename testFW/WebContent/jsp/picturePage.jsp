<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.testFW.bo.UserBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	UserBO user = (UserBO) request.getAttribute("loginUser");
	boolean hasLogin = false;
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
	}
	String imgPath = ConstantsUtil.FW_DOMAIN + "/album/1/1/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/picturePage.css" rel="stylesheet" type="text/css" />

<!-- google jquery link 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->

<script language="javascript" type="text/javascript" 
 	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script> 
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<!-- Add mousewheel plugin (this is optional) -->
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox-thumbs.css" />
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox-thumbs.js"></script>
<script language="javascript" type="text/javascript">
	$(function() {
		$('.small_search').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
			}
		});
		/*fancybox-start*/
		$('.small_search').blur(function() {
			if (this.value == '') {
				this.value = this.defaultValue;
			}
		});
		$('a.fixedTip').aToolTip();
		$('input.fixedTip').aToolTip();
		$('.fancybox').fancybox();
		$('.fancybox-thumbs').fancybox({
			prevEffect : 'none',
			nextEffect : 'none',
			closeBtn : false,
			arrows : false,
			nextClick : true,
			helpers : {
				title : {
					type : 'over'
				},
				thumbs : {
					width : 50,
					height : 50
				}
			}
		});
		$('.fancybox-iframe').fancybox({
			'padding' : 0,
			'margin' : 0,
			'scrolling' : 'no',
			'type' : 'ajax'
		});
		$('.small_search').blur(function() {
			if (this.value == '') {
				this.value = this.defaultValue;
			}
		});
		$('a.fixedTip').aToolTip();
		$('input.fixedTip').aToolTip();
	});
	function userQuit() {
		$.ajax({
			type : "POST",
			url : "/action/user/userquit",
			dataType : "text",
			success : function(msg) {
				location.reload();
			}

		});
	}
</script>
<title>图册</title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<% out.print(ConstantsUtil.FW_DOMAIN+ConstantsUtil.DEFAULT_BG); %>">
	</div>
	<div id="hd">
		<div class="top_bar">
			<a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/index">首页></a><a href="#">图册</a><span>不因得失而惧怕前行</span>
		</div>
		<p>
			Telephone: 1581 011 2386<a href="http://weibo.com/semis">@伪冥</a>
		</p>
	</div>
	<div class="go_back">
		<%
			if (!"index".equals(fun)) {
		%>
		<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/index"><img src="<%=ConstantsUtil.FW_DOMAIN%>/img/go_back.png" alt="" /></a>
		<%
			}
		%>
	</div>
	<div class="wrap">
		<div class="container">
			<div class="main_wrap">
				<div class="main">
					<div id="post-1" class="album">
						<div class="iLikeThis" id="iLikeThis-1">
							<span class="counter">4<a onclick="likeThis(1);"
								class="fixedTip" title="点击标记该相册为喜爱">Like</a> </span>
						</div>
						<p>
							<a id="album1" class="fancybox-thumbs" title="这是测试图册的封面"
								data-fancybox-group="thumb1" href="<%=imgPath%>1_1.jpg"><img
								width="200" height="200" class="aligncenter size-medium"
								src="<%=imgPath%>1_1.jpg" alt="这是测试图册的封面" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>1_2.jpg"><img
								src="<%=imgPath%>1_2.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>1_3.jpg"><img
								src="<%=imgPath%>1_3.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>1_4.jpg"><img
								src="<%=imgPath%>1_4.jpg" alt="这是测试图片" /> </a>
						</p>
						<a class="btn_details_only"
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture/1">Details</a>
						<a title="预览" class="btn_preview_w_details"
							onclick="javascript:$('#album1').click();">Preview</a>
					</div>
					<div id="post-2" class="album">
						<div class="iLikeThis" id="iLikeThis-2">
							<span class="counter">4<a onclick="likeThis(2);"
								class="fixedTip" title="点击标记该相册为喜爱">Like</a> </span>
						</div>
						<p>
							<a id="album2" class="fancybox-thumbs" title="时光镜面"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_1.jpg"><img
								width="200" height="200" class="aligncenter size-medium"
								src="<%=imgPath%>2_1.jpg" alt="时光镜面" /> </a> <a
								style="display: none" title="大一圣诞夜，哈哈~" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_2.jpg"><img
								src="<%=imgPath%>2_2.jpg" alt="大一圣诞夜，哈哈~" /> </a> <a
								style="display: none" title="看到这张相片我才知道什么叫做年轻真好~" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_3.jpg"><img
								src="<%=imgPath%>2_3.jpg" alt="看到这张相片我才知道什么叫做年轻真好~" /> </a> <a
								style="display: none" title="不知道是不是最全的一张合影？" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_4.jpg"><img
								src="<%=imgPath%>2_4.jpg" alt="不知道是不是最全的一张合影？" /> </a>
								 <a style="display: none" title="这撒货现在各奔东西啦~" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_5.jpg"><img
								src="<%=imgPath%>2_5.jpg" alt="这撒货现在各奔东西啦~" /> </a>
						</p>
						<a class="btn_details_only"
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture/2">Details</a>
						<a title="预览" class="btn_preview_w_details"
							onclick="javascript:$('#album2').click();">Preview</a>
					</div>
				</div>
				
			</div>
		</div>
		<div class="group" id="paging">
						<%
							if (!hasLogin) {
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/login.html">登录</a>
						<%
							} else {
						%>
						<a
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/<%=user.getId()%>"
							title="点击进入主页"><%=user.getName()%></a> <a href="#"
							onclick="userQuit();" title="点击退出">退出</a>
						<%
							}
						%>
						<%
							if (hasLogin) {
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/messageLogin.html">留言</a>
						<%
							} else {
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/messageLogout.html">留言</a>
						<%
							}
						%>
		</div>
	</div>
	<div id="ft">
		<p>
			<span class="flink">友情链接：<a target="_blank" href="http://baipeng.alwaysdata.net">BAI
				Peng's</a>| <a target="_blank" href="http://www.eamonning.com">清泉逐流</a></span><span class="copyright">&copy; 2013 京ICP备13011487号. all designed by <a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/mainpage/1">偷懒的熊</a></span>
		</p>
	</div>
</body>
</html>