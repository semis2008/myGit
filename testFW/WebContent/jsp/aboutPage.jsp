<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@page import="com.testFW.util.ConstantsUtil"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/about.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/demo/atooltip/css/atooltip.css"
	rel="stylesheet" media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/demo/atooltip/js/jquery.atooltip.js"></script>
<script language="javascript" type="text/javascript">
	$(function() {
		$('.small_search').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
			}
		});
		$('.small_search').blur(function() {
			if (this.value == '') {
				this.value = this.defaultValue;
			}
		});
		$('a.fixedTip').aToolTip();
		$('input.fixedTip').aToolTip();
	});
</script>
<title>关于</title>
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
					<div class="group" id="paging">
						<a title="Page 1" href="#">登录</a> <a title="Page 1" href="#">留言</a>
					</div>
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
								<li style="width: 20%; left: 5%;">构建开发环境<em>(12/07~14)</em></li>
								<li style="width: 22%; left: 15%;">完成主体框架<em>(12/10~19)</em></li>
								<li style="width: 25%; left: 28.4%;">前台页面设计<em>(12/18~now)</em>
								</li>
							</ul>
							<ul class="intervals">
								<li class="first">2012-12-01</li>
								<li>2012-12-10</li>
								<li>2012-12-20</li>
								<li class="last">now</li>
							</ul>
							<!-- end .intervals -->
						</div>

					</div>
				</div>
				<div class="section_wrap more_padding">
					<h3>
						<strong>1989</strong> Keep learning &amp; Remain Modest.
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