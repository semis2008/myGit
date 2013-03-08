<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.testFW.util.*"%>
<%@page import="com.testFW.bo.*"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	UserBO user = (UserBO) request.getAttribute("loginUser");
	boolean hasLogin = false;
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/index.css" rel="stylesheet" type="text/css" />

<!-- google jquery link 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->

<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
	<!-- gridster css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/gridter/jquery.gridster.min.css"
	rel="stylesheet" media="screen" />
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<!-- Gridter js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/gridter/jquery.gridster.min.js"></script>


<script language="javascript" type="text/javascript">
	$(function() {
		$(".navi_news").hover(function() {
			$(".navi_news").addClass("on");
			$(".navi_reply").removeClass("on");
			$(".topbar_news").show();
			$(".topbar_reply").hide();
		});
		$(".navi_reply").hover(function() {
			$(".navi_news").removeClass("on");
			$(".navi_reply").addClass("on");
			$(".topbar_news").hide();
			$(".topbar_reply").show();
		});
		$('.small_search').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
			}
		});
		$('.fancybox-iframe').fancybox({
			'padding' : 0,
			'margin' : 0,
			'height' : 'auto',
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
		
		//Grifter初始化
		$(".gridster ul").gridster({
			 widget_margins: [10, 10],
			 widget_base_dimensions: [140, 140]
			 });
		
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
<title>wnJava--首页</title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<% out.print(ConstantsUtil.FW_DOMAIN+ConstantsUtil.DEFAULT_BG); %>">
	</div>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" id="sForm"
					action="<%=ConstantsUtil.FW_DOMAIN%>/action/system/search">
					<input name="s" id="s" value="站内搜索" class="small_search"
						type="text" />
				</form>
			</div>
			<h1>
				<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
					title="wnJava Logo"><img
					src="<%=ConstantsUtil.FW_DOMAIN%>/img/logo.png" alt="wnJava Logo" />
				</a>
			</h1>
			<p>
				不因感情,而影响行动,<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				不因得失,而惧怕前行.
			</p>
		</div>
		<div class="container">
			<div class="sidebar">
				<ul class="side_nav">
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a>
					</li>
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary"
						title="查看日志" id="diary">日志</a>
					</li>
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
						title="查看图册信息" id="picture">图册</a>
					</li>
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus"
						title="关于我以及本站" id="aboutus">about</a>
					</li>
				</ul>
			</div>
			<div class="main_wrap">
				<div class="main">
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
					<div id="indexMain">
						<div class="gridster ready">
							<ul style="height: 480px; position: relative;">
								<li data-sizey="1" data-sizex="2" data-col="1" data-row="1"
									class="gs_w"></li>
								<li data-sizey="1" data-sizex="1" data-col="1" data-row="3"
									class="gs_w"></li>

								<li data-sizey="1" data-sizex="2" data-col="2" data-row="3"
									class="gs_w"></li>
								<li data-sizey="2" data-sizex="2" data-col="3" data-row="1"
									class="gs_w"></li>

								<li data-sizey="1" data-sizex="1" data-col="5" data-row="1"
									class="try gs_w"></li>
								<li data-sizey="1" data-sizex="2" data-col="1" data-row="2"
									class="gs_w"></li>
								<li data-sizey="1" data-sizex="1" data-col="4" data-row="3"
									class="gs_w"></li>

								<li data-sizey="1" data-sizex="1" data-col="6" data-row="1"
									class="gs_w"></li>
								<li data-sizey="1" data-sizex="1" data-col="5" data-row="3"
									class="gs_w"></li>

								<li data-sizey="1" data-sizex="1" data-col="5" data-row="2"
									class="gs_w"></li>
								<li data-sizey="2" data-sizex="1" data-col="6" data-row="2"
									class="gs_w"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="section">
				<ul class="strengths">
					<li>
						<h3>友情链接</h3>
						<p>
							<a target="_blank" href="http://baipeng.alwaysdata.net">BAI
								Peng's</a>| <a target="_blank" href="http://www.eamonning.com">清泉逐流</a>

						</p>
					</li>
					<li>
						<h3>WnJava的说明</h3>
						<p>小站刚刚建立，许多功能等待完善，许多创意还没实现~，欢迎大家注册交流。</p>
					</li>
					<li class="last">
						<h3>Contact Me!</h3>
						<p>有任何对本站及我个人的想法，欢迎联系我！</p>
						<p>
							Telephone: 1581 011 2386 or <a href="mailto:semis2008@126.com">Email
								我 »</a>
						</p>
					</li>
				</ul>
			</div>
		</div>
</body>
</html>