<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.util.UserUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testFW.bo.DiaryReplyBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.testFW.util.DateUtil"%>
<%@page import="com.testFW.bo.DiaryBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page import="com.testFW.bo.UserBO"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	UserBO user = (UserBO) request.getAttribute("loginUser");
	DiaryBO diary = (DiaryBO) request.getAttribute("diary");
	List<DiaryReplyBO> replies = (List<DiaryReplyBO>) request
			.getAttribute("replies");
	if (replies == null) {
		replies = new ArrayList<DiaryReplyBO>();
	}
	if (diary == null) {
		diary = new DiaryBO();
	}
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
<link href="/css/diaryDetail.css" rel="stylesheet" type="text/css" />

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

		//回复div的js效果
		$('.cmt_area').focus(function() {
			var value = $('.cmt_area').text();
			if (value == '发表回复...') {
				$('.cmt_area').text('');
			}
		});
		$('.cmt_area').blur(function() {
			var value = $('.cmt_area').text();
			if (value == '') {
				$('.cmt_area').text('发表回复...');
			}
		});
		$('.guest input').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
			}
		});
		$('.guest input').blur(function() {
			if (this.value == '') {
				this.value = this.defaultValue;
			}
		});
	});

	//游客回复,parentidw：回复日志：0，回复评论：评论id
	function commitReplyGuest(parentid) {
		var content = $('.cmt_area').val();
		var name = $("#guest_name").val();
		var email = $("#guest_email").val();
		var website = $("#guest_website").val();
		if ($.trim(content) == '' || $.trim(name) == '' || $.trim(email) == '') {
			return;
		}
		var emailRegExp = new RegExp(
				"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
		if (!emailRegExp.test(email) || email.indexOf('.') == -1) {
			$("#guest_email").css("color", "red");
			return;
		}
		if (website == 'webSite') {
			website = '';
		}
		var diaryid = $("#diaryId").val();
		$.ajax({
			type : "POST",
			url : "/action/diary/newreply",
			dataType : "text",
			data : {
				diaryid : diaryid,
				parentid : parentid,
				type : "guest",
				reply : content,
				name : name,
				email : email,
				website : website
			},
			success : function(msg) {
				//刷新回复列表，清空回复信息
				if (msg == 'fail') {
					alert("回复失败！");
				} else if (msg == 'success') {
					alert("回复成功！");
				}
			}
		});
	}
	//会员回复,parentidw：回复日志：0，回复评论：评论id
	function commitReplyUser(parentid) {
		var content = $('.cmt_area').val();
		var diaryid = $("#diaryId").val();
		$.ajax({
			type : "POST",
			url : "/action/diary/newreply",
			dataType : "text",
			data : {
				diaryid : diaryid,
				parentid : parentid,
				type : "user",
				reply : content
			},
			success : function(msg) {
				//刷新回复列表，清空回复信息
				if (msg == 'fail') {
					alert("回复失败！");
				} else if (msg == 'success') {
					alert("回复成功！");
				}
			}
		});
	}
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
	//回复评论时候，显示所回复的节点信息到quote内
	function showParentDiv(replyid) {
		var quotehtml = $("#comment"+replyid).html();
		$(".quote").html(quotehtml);
		$(".quote .commentR .reply").text("取消回复");
		$(".quote .commentR .reply").removeAttr("onclick");
		$(".quote .commentR .reply").attr("href","javascript:hideParentDiv()");
		$(".quote").slideDown(800);
	}
	function hideParentDiv() {
		$(".quote").slideUp(500);
	}
</script>
<title>wnJava--<%=diary.getTitle()%></title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<%=ConstantsUtil.FW_DOMAIN%>/img/bg_glass2.jpg">
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
					<div class="artical" id="post-1">
						<div class="art-cats">
							<ul>
								<li class="blogTime"><a title="<%=diary.getTitle()%>"
									href="#"><em><%=DateUtil.dateToCalendar(diary.getPublish_time()).get(
					Calendar.MONTH) + 1%>/</em><%=DateUtil.dateToCalendar(diary.getPublish_time()).get(
					Calendar.DAY_OF_MONTH)%></a>
								</li>
								<%
									String[] tags = diary.getTags().split("_");
									for (String tag : tags) {
								%>
								<li class="tag"><a title="<%=tag%>" href="#"><%=tag%></a></li>
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
										title="查看他发布的所有博文" href="#"><%=diary.getAuthor_name()%></a> </span> </span>
							</div>
						</div>
						<div class="art-content">
							<p><%=diary.getContent()%></p>
						</div>
						<!-- Baidu Button BEGIN -->
						<!-- Baidu Button BEGIN -->
						<div id="bdshare" style="float: right;" class="bdshare_t bds_tools get-codes-bdshare">
							<span class="bds_more">分享到：</span> <a class="bds_qzone"></a> <a
								class="bds_tsina"></a> <a class="bds_tqq"></a> <a
								class="bds_renren"></a> <a class="bds_t163"></a> <a
								class="shareCount"></a>
						</div>
						<script type="text/javascript" id="bdshare_js"
							data="type=tools&amp;uid=240802"></script>
						<script type="text/javascript" id="bdshell_js"></script>
						<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script>
						<!-- Baidu Button END -->

					</div>
					<div id="comments">
						<div class="comments-title">
							日志“<a href="#"><%=diary.getTitle()%></a>”
							<%
							if (diary.getReply_num() == 0l) {
						%>
							还没有人回复哦，来做第一个<a href="#reply-div">回复</a>的吧~
						</div>
						<%
							} else {
						%>
						有<%=diary.getReply_num()%>条回复
					</div>
					<%
						for (DiaryReplyBO reply : replies) {
								if (reply.getParent_id() == 0l) {
					%>
					<div id="comment<%=reply.getId()%>" class="cmt top">
						<%
							} else if (reply.getParent_id() > 0l) {
						%>
						<div id="comment<%=reply.getId()%>" class="cmt child">
							<%
								}
							%>
							<img alt="#"
								src="<%=ConstantsUtil.FW_DOMAIN + reply.getUser_photo()%>" />
							<div class="commentR">
								<a
									href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/<%=reply.getUser_id()%>"
									class="name"><%=reply.getUser_name()%></a><a href="#reply-div"
									onclick="showParentDiv(<%=reply.getId()%>)" class="reply">回复</a>
								<p class="time"><%=DateUtil.formatDate(reply.getReply_time(), 3)%></p>
								<div><%=reply.getReply()%></div>
							</div>
						</div>
						<%
							}
							}
						%>

						<div class="cmt head" id="reply-div">
							<div class="quote" style="display: none"></div>
							<%
								if (hasLogin) {
							%>
							<div class="user">
								<img alt="#"
									src="<%=ConstantsUtil.FW_DOMAIN%><%=user.getPhoto()%>" />
								<textarea class="cmt_area">发表回复...</textarea>
								<div class="proceed">
									<button class="btn" type="submit" onclick="commitReplyUser()">回复</button>
								</div>
							</div>
							<%
								} else {
							%>
							<div class="guest">
								<img alt="#"
									src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/default/defaultGuest.jpg" />
								<textarea class="cmt_area">发表回复...</textarea>
								<div class="proceed">
									<button class="btn" type="submit" onclick="commitReplyGuest(0)">回复</button>
								</div>
								<input type="text" id="guest_name" value="称呼" /><input
									type="text" id="guest_email" value="邮箱" /><input type="text"
									value="网站" id="guest_website" />
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- 隐藏域，提供日志id信息 -->
				<input id="diaryId" value="<%=diary.getId()%>" type="hidden" />
			</div>
		</div>
		<div class="section">
			<ul class="strengths">
				<li>
					<h3>友情链接</h3>
					<p>
						<a target="_blank" href="http://baipeng.alwaysdata.net">BAI
							Peng's</a>| <a target="_blank" href="http://www.eamonning.com">清泉逐流</a>

					</p></li>
				<li>
					<h3>WnJava的说明</h3>
					<p>小站刚刚建立，许多功能等待完善，许多创意还没实现~，欢迎大家注册交流。</p></li>
				<li class="last">
					<h3>Contact Me!</h3>
					<p>有任何对本站及我个人的想法，欢迎联系我！</p>
					<p>
						Telephone: 1581 011 2386 or <a href="mailto:semis2008@126.com">Email
							我 »</a>
					</p></li>
			</ul>
		</div>
	</div>
</body>
</html>