<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.Calendar"%>
<%@page import="com.testFW.util.StringUtil"%>
<%@page import="com.testFW.util.DateUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testFW.bo.DiaryBO"%>
<%@page import="java.util.List"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page import="com.testFW.bo.UserBO"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	UserBO user = (UserBO) request.getAttribute("loginUser");
	List<DiaryBO> diaryList = (List<DiaryBO>) request
			.getAttribute("diaries");
	if (diaryList == null) {
		diaryList = new ArrayList<DiaryBO>();
	}
	boolean hasLogin = false;
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
	}
	Integer currentPage = (Integer)request.getAttribute("currentPage");
	if(currentPage == null) {
		currentPage = 1;
	}
	Integer totalPage = (Integer)request.getAttribute("totalPage");
	if(totalPage == null) {
		totalPage = 1;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/diary.css" rel="stylesheet" type="text/css" />

<!-- google jquery link 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->

<script language="javascript" type="text/javascript" 
 	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script> 
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
<!-- floatbar css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/common/floatbar.css"
	rel="stylesheet" media="screen" />

<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<!-- floatbar js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/common/floatbar.js"></script>
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
<title>日志</title>
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
					<li class="active"><a class="fixedTip"
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
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/newDiary.html">发表日志</a>
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
					<div class="articles">
						<%
							if (diaryList.size() == 0) {
								out.print("<h3> 没有日志可供查看~~</h3>");
							} else {
								for (DiaryBO diary : diaryList) {
						%>
						<div class="artical" id="post-1">
							<div class="art-cats">
								<ul>
									<li class="blogTime"><a title="<%=diary.getTitle()%>"
										href="#"><em><%=DateUtil.dateToCalendar(diary.getPublish_time())
							.get(Calendar.MONTH) + 1%>/</em><%=DateUtil.dateToCalendar(diary.getPublish_time())
							.get(Calendar.DAY_OF_MONTH)%></a></li>
									<%
										String[] tags = diary.getTags().split("_");
												for (String tag : tags) {
									%>
									<li class="tag"><a title="<%=tag%>" href="#"><%=tag%></a>
									</li>
									<%
										}
									%>
								</ul>
							</div>
							<div class="art-header">
								<h1 class="art-title">
									<a title="<%=diary.getTitle()%>"
										href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=diary.getId()%>"><%=diary.getTitle()%>
									</a>
								</h1>
								<p class="comment-count">
									<a title="回复数" href="#"><%=diary.getReply_num()%></a>
								</p>
								<div class="art-meta">
									Posted on <a title="发布日期" href="#"><%=DateUtil.formatDate(diary.getPublish_time(), 3)%></a><span
										class="byline"> by <span class="author"><a
											title="查看他发布的所有博文" href="#"><%=diary.getAuthor_name()%></a> </span>
									</span>
								</div>
							</div>
							<div class="art-content">
								<p><%=StringUtil.cutString(diary.getContent(), 200)%></p>
								<p>
									<a class="more-link"
										href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=diary.getId()%>">查看全文
										<span>↓</span> </a>
								</p>
							</div>
						</div>
						<%
							}
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
				<ul class="strengths">
					<li>
						<h3>友情链接</h3>
						<p><a target="_blank" href="http://baipeng.alwaysdata.net">BAI Peng's</a>|
						<a target="_blank" href="http://www.eamonning.com">清泉逐流</a>
						
						</p></li>
					<li>
						<h3>WnJava的说明</h3>
						<p>小站刚刚建立，许多功能等待完善，许多创意还没实现~，欢迎大家注册交流。</p></li>
					<li class="last">
						<h3>Contact Me!</h3>
						<p>有任何对本站及我个人的想法，欢迎联系我！</p>
						<p>
							Telephone: 1581 011 2386 or <a
								href="mailto:semis2008@126.com">Email 我 »</a>
						</p></li>
				</ul>
			</div>
	</div>
	<div class="m-floatBar">
		<a id="J-goToTop" title="返回顶部" onclick="goToTop() "
			class="m-top-spacial f-trans" style="z-index: 10; right: -45px;" />
		<a id="J-nextGroup" title="下一页" class="m-front f-trans"
			href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/<%=currentPage + 1%>"
			style="z-index: 10; right: 20px;" /> <a id="J-preGroup" title="上一页"
			class="m-back f-trans"
			href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/<%=currentPage - 1%>"
			style="z-index: 10; right: 85px;" /> <input type="hidden"
			id="totalPage" value="<%=totalPage %>" /> <input type="hidden" id="currentPage"
			value="<%=currentPage %>" />
	</div>
</body>
</html>