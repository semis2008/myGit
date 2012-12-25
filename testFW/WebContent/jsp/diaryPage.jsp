<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script>
	<!-- aToolTip css -->
<link type="text/css"
	href="<%=request.getContextPath()%>/demo/atooltip/css/atooltip.css"
	rel="stylesheet" media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/demo/atooltip/js/jquery.atooltip.js"></script>
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
		});$('a.fixedTip').aToolTip();
		$('input.fixedTip').aToolTip();
	});
</script>
<title>图册</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" id="sForm"
					action="<%=request.getContextPath()%>/action/system/search">
					<input name="s" id="s" value="站内搜索" class="small_search fixedTip"
						type="text"  title="输入内容后，敲击回车可以在全站内搜索相关信息"/>
				</form>
			</div>
			<h1>
				<a href="<%=request.getContextPath()%>/action/system/mainpage"
					title="testFW Logo"><img
					src="<%=request.getContextPath()%>/img/easyfw.png"
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
						href="http://www.testFW.com/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a></li>
					<li <%if ("diary".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip" href="http://www.testFW.com/action/system/diary/"
						title="查看日志" id="diary">日志</a></li>
					<li <%if ("picture".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="http://www.testFW.com/action/system/picture" title="查看图册信息"
						id="picture">图册</a></li>
					<li <%if ("aboutus".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="http://www.testFW.com/action/system/aboutus" title="关于我以及本站"
						id="aboutus">about</a></li>
				</ul>
			</div>
			<div class="main_wrap">
				<div class="main">
					<div class="top_bar"></div>
					<div class="group" id="paging">
						<a title="Page 1" href="#">登录</a>
						<a title="Page 1" href="#">留言</a>
					</div>
					<h1>Comming&nbsp;&nbsp;Soon!</h1>
				</div>
				<div class="section_wrap more_padding">
					<h3>
						<strong>1989</strong> Keep learning &amp; Remain Modest.
					</h3>
					<small>&copy; Copyright 2012 TestFW. All rights
						reserved.  Designed by <a target="_blank"
						href="http://www.testFW.com/action/user/1">Kalor</a>
					</small><br><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>