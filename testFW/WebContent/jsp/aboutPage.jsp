<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/about.css" rel="stylesheet" type="text/css" />

<!-- google jquery link 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->

<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>

<script language="javascript" type="text/javascript">
	$(function() {
		$('.small_search').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
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
<title>关于</title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<%out.print(ConstantsUtil.FW_DOMAIN + ConstantsUtil.DEFAULT_BG);%>" />
	</div>
	<div id="hd">
		<div class="top_bar">
			<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/index">首页></a><a href="#">About</a><span>不因得失而惧怕前行</span>
		</div>
		<p>
			Telephone: 1581 011 2386<a href="http://weibo.com/semis">@semis</a>
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
					<div class="aboutMe">
						<h3>>关于我</h3>
						<p>
							我是本站的作者，89年生，刚毕业，程序员。<br />
							熟悉J2EE那套技术，为了工作曾粗略学习了SSH框架，一直觉得这些框架虽然在泛用性上很强大，但是对于特定的项目也就存在资源的浪费。<br />
							喜欢全局上构架网站，喜欢那种创造之后的喜悦，喜欢新技术。不擅长页面设计，CSS用的很一般。
							目前在北京生活，节奏比较快，在通往架构师的道路上不断学习着...
						</p>
					</div>
					<div class="aboutFW">
						<h3>>关于TestFW</h3>
						<p>
							TestFW这个项目是我临时起意做的，开始的目的是搭建一个JSP-Servlet-Spring的J2EE项目，在搭建的过程中学习基础而重要的J2EE架构知识。<br />
							这个小站有以前毕设的项目的基础，虽然舍弃了大部分功能。后来就打算干脆建一个完整的小站得了，要发布到网上去...<br />
							小站从最基础的地方起步，争取使用个人认为实用的技术，像URL隐式映射，干扰盐加密等等。小站刚刚起步，还有许多功能需要完善，还有许多样式需要调整，
							慢慢写吧~
						</p>
					</div>
					<div class="aboutProcess">
						<div class="timeline">
							<ul class="events">
								<li style="width: 15%; left: 5%;">构建开发环境<em>(12/07~14)</em>
								</li>
								<li style="width: 15%; left: 15%;">完成主体框架<em>(12/10~19)</em>
								</li>
								<li style="width: 24%; left: 24%;">前台页面设计<em>(12/18~1/13)</em>
								</li>
								<li style="width: 36%; left: 35%;">逻辑功能实现<em>(1/14~now)</em>
								</li>
								<li style="width: 21%; left: 50%;">beta版上线<em>(2/26~now)</em>
								</li>
							</ul>
							<ul class="intervals">
								<li class="first">2012-12-01</li>
								<li>2012-12-10</li>
								<li>2012-12-20</li>
								<li>2012-1-13</li>
								<li>2012-2-26</li>
								<li class="last">now</li>
							</ul>
							<!-- end .intervals -->
						</div>

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
			<span class="flink">友情链接：<a target="_blank"
				href="http://baipeng.alwaysdata.net">BAI Peng's</a>| <a
				target="_blank" href="http://www.eamonning.com">清泉逐流</a> </span><span
				class="copyright">&copy; 2013 京ICP备13011487号. all designed by
				<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/user/1">Kalor</a>
			</span>
		</p>
	</div>
</body>
</html>