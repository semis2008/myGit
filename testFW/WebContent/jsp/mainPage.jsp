<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.bo.UserBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link href="/css/mainpage.css" rel="stylesheet" type="text/css" />
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
</script>
<title>主页</title>
</head>
<body>
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
						<%
							if (!hasLogin) {
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/login.html">登录</a>
						<%
							} else {
						%>
						<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
							title="点击进入主页"><%=user.getName()%></a>
						<%
							}
						%>
						<a class="fancybox-iframe" href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/message.html">留言</a>
					</div>
					<div id="foreword">
						<div id="sidebar_top">
							<h1>卡莱尔</h1>
							<h2>测试人员</h2>
							<div id="picture-profile">
								<img alt="Ricardo Castillo"
									src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/profile.jpg">
							</div>
							<ul>
								<li>加入日期：<a href="#">2012/12/20</a></li>
								<li>日志：<a href="#"><em>12</em>&nbsp;篇</a></li>
								<li>图册：<a href="#"><em>9</em>&nbsp;集</a></li>
								<li>专修：<a href="#">java,C++</a></li>
								<li>联系方式：<a href="#">不公开</a></li>
							</ul>
						</div>
					</div>
					<div class="content">
						<div id="content-gallery">
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
							<div class="gallery-item" id="post-116">
								<h2>
									<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
										<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
								</h2>
							</div>
							<div class="gallery-item" id="post-134">
								<a title="测试图册缩略图" href="#"> <img width="219" height="219"
									class=""
									src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
								</a>
								<h2>测试图册缩略图</h2>
							</div>
						</div>
						<!-- content-gallery -->
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