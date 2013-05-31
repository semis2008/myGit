<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.util.UserUtil"%>
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
	Integer currentPage = (Integer) request.getAttribute("currentPage");
	if (currentPage == null) {
		currentPage = 1;
	}
	Integer totalPage = (Integer) request.getAttribute("totalPage");
	if (totalPage == null) {
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
	function deleteDiary(diaryid) {
		alert(diaryid);
		$.ajax({
			type : "POST",
			url : "/action/diary/delete",
			data: {
				diaryid:diaryid
			},
			dataType : "text",
			success : function(msg) {
				if(msg=='fail') {
					alert("删除失败！");
				}else {
					alert("删除成功！");				
					location.reload();
				}
			}
		});
	}
	function setEditDiaryId(diaryid) {
		$("#diary_edit_id").val(diaryid);
	}
</script>
<title>日志</title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<%out.print(ConstantsUtil.FW_DOMAIN + ConstantsUtil.DEFAULT_BG);%>" />
	</div>
	<div id="hd">
		<div class="top_bar">
			<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/index">首页></a><a href="#">日志</a><span>不因得失而惧怕前行</span>
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
					<div class="articles">
					<!-- 隐藏域，用于标识编辑的日志id -->
					<input type="hidden" id="diary_edit_id"/> 
					
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
							.get(Calendar.DAY_OF_MONTH)%></a>
									</li>
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
										<%
										if(user.getId()==diary.getAuthor_id()) {
										%>
										<a class="more-link fancybox-iframe" onclick="javascript:setEditDiaryId('<%=diary.getId() %>')"
										 href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/editDiary.html">编辑
										<span>✎</span> </a>
										<a class="more-link"
										href="#" onclick="javascript:deleteDiary('<%=diary.getId() %>')">删除
										<span>×</span> </a>
										<%
										}
										%>
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
	</div>
	<div id="ft">
		<p>
			<span class="flink">友情链接：<a target="_blank"
				href="http://baipeng.alwaysdata.net">BAI Peng's</a>| <a
				target="_blank" href="http://www.eamonning.com">清泉逐流</a>
			</span><span class="copyright">&copy; 2013 京ICP备13011487号. all
				designed by <a
				href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/1">偷懒的熊</a>
			</span>
		</p>
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
			id="totalPage" value="<%=totalPage%>" /> <input type="hidden"
			id="currentPage" value="<%=currentPage%>" />
	</div>
</body>
</html>