<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
	List<DiaryBO> diaryList = (List<DiaryBO>)request.getAttribute("diaries");
	if(diaryList==null) {
		diaryList = new ArrayList<DiaryBO>();
	}
	boolean hasLogin = false;
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
	}

	String hasNext = "yes";
	String hasPre = "yes";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/diary.css" rel="stylesheet" type="text/css" />
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
</script>
<title>日志</title>
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
					src="<%=ConstantsUtil.FW_DOMAIN%>/img/easyfw.png" alt="TestFW Logo" />
				</a>
			</h1>
			<p>
				不因感情,而影响行动,<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					不因得失,而惧怕前行. 
			</p>
		</div>
		<div class="container">
			<div class="m-floatBar">
				<a id="J-goToTop" title="返回顶部" onclick="goToTop() "
					class="m-top-spacial f-trans" style="z-index: 10; right: -45px;" />
				<%
					if ("yes".equals(hasNext)) {
				%>
				<a id="J-nextGroup" title="下一页" class="m-front f-trans"
					style="z-index: 10; right: 20px;" />
				<%
					}
					if ("yes".equals(hasPre)) {
				%>
				<a id="J-preGroup" title="上一页" class="m-back f-trans"
					style="z-index: 10; right: 85px;" />
				<%
					}
				%>
			</div>
			<div class="sidebar">
				<ul class="side_nav">
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a></li>
					<li class="active"><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary"
						title="查看日志" id="diary">日志</a></li>
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
						title="查看图册信息" id="picture">图册</a></li>
					<li><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus"
						title="关于我以及本站" id="aboutus">about</a></li>
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
						if(diaryList.size()==0) {
							out.print("<h3> 没有日志可供查看~~</h3>");
						}else {
							for(DiaryBO diary:diaryList) {						
						%>
						<div class="artical" id="post-1">
							<div class="art-cats">
								<ul>
									<li class="blogNum"><a title="<%=diary.getTitle() %>" href="#"><%=diary.getId() %></a>
									</li>
									<%
									String[] tags = diary.getTags().split("_");
									for(String tag:tags) {
									%>
									<li class="tag"><a title="<%=tag %>" href="#"><%=tag %></a>
									</li>
									<%} %>
								</ul>
							</div>
							<div class="art-header">
								<h1 class="art-title">
									<a title="<%=diary.getTitle() %>"
										href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/1"><%=diary.getTitle() %>
										 </a>
								</h1>
								<p class="comment-count">
									<a title="回复数" href="#"><%=diary.getReply() %></a>
								</p>
								<div class="art-meta">
									Posted on <a title="发布日期" href="#"><%=DateUtil.formatDate(diary.getPublish_time(),3) %></a><span
										class="byline"> by <span class="author"><a
											title="查看他发布的所有博文" href="#"><%=diary.getAuthor_name() %></a> </span> </span>
								</div>
							</div>
							<div class="art-content">
								<p><%=StringUtil.cutString(diary.getContent(),200) %></p>
								<p>
									<a class="more-link"
										href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/1">查看全文
										<span>↓</span> </a>
								</p>
							</div>
						</div>
						<%
							}
						}%>
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