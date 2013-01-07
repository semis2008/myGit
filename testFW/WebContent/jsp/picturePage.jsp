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
<link href="/css/album.css" rel="stylesheet" type="text/css" />
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
		$('input.fixedTip').aToo
lTip();
	});
</script>
<title>主页</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" id="sForm"
					action="<%=ConstantsUtil.FW_DOMAIN%>/action/system/search">
					<input name="s" id="s" value="站内搜索" class="small_search fixedTip"
						type="text" title="输入内容后，敲击回车可以在全站内搜索相关信息" />
				</form>
			</div>
			<h1>
				<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
					title="testFW Logo"><img
					src="<%=ConstantsUtil.FW_DOMAIN%>/img/easyfw.png"
					alt="TestFW Logo" /> </a>
			</h1>
			<p>
				不因感情,而影响行动,<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					不因得失,而惧怕前行. 
			</p>
		</div>
		<div class="container">
			<div class="sidebar">
				<ul class="side_nav">
					<li <%if ("mainpage".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a>
					</li>
					<li <%if ("diary".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip" href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/"
						title="查看日志" id="diary">日志</a>
					</li>
					<li <%if ("picture".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture" title="查看图册信息"
						id="picture">图册</a>
					</li>
					<li <%if ("aboutus".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus" title="关于我以及本站"
						id="aboutus">about</a>
					</li>
				</ul>
			</div>
			<div class="main_wrap">
				<div class="main">
					<div class="top_bar"></div>
					<div class="group" id="paging">
						<%if (!hasLogin) {%>
						<a class="fancybox-iframe fixedTip"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/login.html"
							title="点击登录">登录</a>
						<%} else {%>
						<a class="fixedTip"
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
							title="点击进入主页"><%=user.getName()%></a>
						<%}%>
						<a class="fancybox-iframe fixedTip" href="#" title="点击给我留言">留言</a>
					</div>
					<div id="post-1" class="album">
						<div class="iLikeThis" id="iLikeThis-1">
							<span class="counter">4<a onclick="likeThis(1);"
								class="fixedTip" title="点击标记该相册为喜爱">Like</a> </span>
						</div>
						<p>
							<a class="fancybox-thumbs" title="这是测试图册的封面"
								data-fancybox-group="thumb1" href="<%=imgPath%>4_b.jpg"><img
								width="200" height="200" class="aligncenter size-medium"
								src="<%=imgPath%>4_s.jpg" alt="这是测试图册的封面" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>3_b.jpg"><img
								src="<%=imgPath%>3_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>2_b.jpg"><img
								src="<%=imgPath%>2_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>1_b.jpg"><img
								src="<%=imgPath%>1_s.jpg" alt="这是测试图片" /> </a>
						</p>
						<a class="btn_details_only"
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture">Details</a>
						<a title="预览" class="btn_preview_w_details"
							onclick="javascript:$('.fancybox-thumbs').click();">Preview</a>
					</div>
					<div id="post-2" class="album">
						<div class="iLikeThis" id="iLikeThis-2">
							<span class="counter">4<a onclick="likeThis(2);"
								class="fixedTip" title="点击标记该相册为喜爱">Like</a> </span>
						</div>
						<p>
							<a class="fancybox-thumbs" title="这是测试图册的封面"
								data-fancybox-group="thumb2" href="<%=imgPath%>4_b.jpg"><img
								width="200" height="200" class="aligncenter size-medium"
								src="<%=imgPath%>4_s.jpg" alt="这是测试图册的封面" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>3_b.jpg"><img
								src="<%=imgPath%>3_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_b.jpg"><img
								src="<%=imgPath%>2_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>1_b.jpg"><img
								src="<%=imgPath%>1_s.jpg" alt="这是测试图片" /> </a>
						</p>
						<a class="btn_details_only"
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture">Details</a>
						<a title="预览" class="btn_preview_w_details"
							onclick="javascript:$('.fancybox-thumbs').click();">Preview</a>
					</div>
				</div>
				<div class="section_wrap more_padding">
					<h3>
						<strong>1989</strong> Keep Learning &amp; Remain Modest.
					</h3>
					<small>&copy; Copyright 2012 TestFW. All rights reserved.
						Designed by <a target="_blank"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/user/1">Kalor</a> </small><br><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>