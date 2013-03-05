<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.testFW.util.*"%>
<%@page import="com.testFW.bo.*"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	UserBO user = (UserBO) request.getAttribute("loginUser");
	UserBO visitedUser = (UserBO) request.getAttribute("visitedUser");
	List<LeaveMsgBO> leaveMsgList = (List<LeaveMsgBO>) request
			.getAttribute("leaveMsgList");
	List<DiaryBO> newDiaryList = (List<DiaryBO>) request
			.getAttribute("newDiaryList");

	UserInfoBO info = (UserInfoBO) request
			.getAttribute("visitedUserInfo");
	String hobbyStr = "";
	if (info == null) {
		info = new UserInfoBO();
	} else {
		hobbyStr = info.getHobby().replace(" ", "_");
	}
	boolean hasLogin = false;
	if (visitedUser == null) {
		visitedUser = new UserBO();
	}
	if (leaveMsgList == null) {
		leaveMsgList = new ArrayList<LeaveMsgBO>();
	}
	if (newDiaryList == null) {
		newDiaryList = new ArrayList<DiaryBO>();
	}
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

		//设置userinfo显示与否
		initInfoShow();

	});

	function initInfoShow() {
		var publicstr = $("#userinfo_iframe_publicstr").val();
		if (publicstr.indexOf("hobby") != -1) {
			$("#hobby_main").show();
		}
		if (publicstr.indexOf("contact") != -1) {
			$("#contact_main").show();
		}
		if (publicstr.indexOf("birthday") != -1) {
			$("#birthday_main").show();
		}
		if (publicstr.indexOf("relname") != -1) {
			$("#relname_main").show();
		}
		if (publicstr.indexOf("homeprovince") != -1) {
			$("#homeprovince_main").show();
		}
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
</script>
<title>wnJava--<%=visitedUser.getName()%>的个人主页</title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<%=ConstantsUtil.FW_DOMAIN %>/img/bg_glass2.jpg">
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
					<li class="active"><a class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a></li>
					<li><a class="fixedTip"
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
					<div class="topbar_left">
						<h1><%=visitedUser.getName()%></h1>
						<h2><%=UserUtil.getUserLevelMsg(visitedUser.getUser_level())%></h2>
						<div id="picture-profile">
							<img
								src="<%=ConstantsUtil.FW_DOMAIN%><%=visitedUser.getPhoto()%>" />
							<%
								if (user.getId() == visitedUser.getId()) {
							%>
							<div class="setHead">
								<a class="fancybox-iframe"
									href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/setHead.html">编辑头像</a>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<div class="topbar_right">
						<div class="topbar_info">
							<ul>
								<li>加入日期：<a href="#"><%=DateUtil.formatDate(visitedUser.getReg_time(), 2)%></a>
								</li>
								<li>日志：<a href="#"><em>12</em>&nbsp;篇</a>
								</li>
								<li>图册：<a href="#"><em>9</em>&nbsp;集</a>
								</li>
								<li id="hobby_main" style="display: none;">兴趣：<a href="#">
										<%
											if (info.getHobby() == null || "".equals(info.getHobby())) {
												out.print("");
											} else {
												out.print(info.getHobby().replace(" ", ","));
											}
										%> </a>
								</li>
								<%
									if (info.getContact() != null && !"".equals(info.getContact())) {
								%>
								<li id="contact_main" style="display: none;"><%=info.getContact().split("_")[0]%>：<a
									href="#"><%=info.getContact().split("_")[1]%></a>
								</li>
								<%
									}
								%>
								<li id="homeprovince_main" style="display: none;">所在地：<a
									href="#"><%=info.getHome_province()%></a>
								</li>
								<li id="birthday_main" style="display: none;">生日：<a
									href="#"> <%
 	if (info.getBirthday() != null
 			&& !ConstantsUtil.BIRTHDAY_NONE.equals(info.getBirthday()
 					.toString())) {
 		out.print(DateUtil.formatDate(info.getBirthday(), 2));
 	}
 %> </a>
								</li>
								<li id="relname_main" style="display: none;">真实姓名：<a
									href="#"><%=info.getRel_name()%></a>
								</li>
							</ul>
							<%
								if (visitedUser.getId() == user.getId()) {
							%>
							<a class="fancybox-iframe" id="setInfoHref"
								href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/setInfo.html"><img
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/set_info.png" alt="设置"
								class="set_info_btn" /> </a>
							<%
								}
							%>
							<!-- 隐藏域，用于iframe获取用户详细信息值 -->
							<input id="userinfo_iframe_name" style="display: none;"
								value="<%=user.getName()%>" /> <input
								id="userinfo_iframe_relname" style="display: none;"
								value="<%if (info.getRel_name() == null) {
				out.print("");
			} else {
				out.print(info.getRel_name());
			}%>" />
							<input id="userinfo_iframe_gender" style="display: none;"
								value="<%=info.getGender()%>" /> <input
								id="userinfo_iframe_homeprovince" style="display: none;"
								value="<%=info.getHome_province()%>" /> <input
								id="userinfo_iframe_birthday" style="display: none;"
								value="<%=info.getBirthday()%>" /> <input
								id="userinfo_iframe_hobby" style="display: none;"
								value="<%if (info.getHobby() == null) {
				out.print("");
			} else {
				out.print(info.getHobby());
			}%>" />
							<input id="userinfo_iframe_contact" style="display: none;"
								value="<%=info.getContact()%>" /> <input
								id="userinfo_iframe_publicstr" style="display: none;"
								value="<%=info.getPublic_info()%>" />
						</div>
						<div class="topbar_msg">
							<div class="topbar_navi">
								<a href="#" title="回复" class="navi_reply on"></a> <a href="#"
									title="动态" class="navi_news"></a>
							</div>
							<div class="topbar_content">
								<div class="topbar_news">
									<ul>
										<%
											for (DiaryBO newDiary : newDiaryList) {
										%>
										<li>
											<div class="news_cont">
												<b><%=newDiary.getAuthor_name()%></b>在<em><%=DateUtil.getPassedTime(newDiary.getPublish_time())%></em>发表了日志<a
													title="<%=newDiary.getTitle()%>"
													href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=newDiary.getId()%>">《<%=newDiary.getTitle()%>》</a><span>[<%=newDiary.getReply_num()%>评/<%=newDiary.getRead_num()%>阅]</span>
											</div></li>
										<%
											}
										%>
										<!-- 
									<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>3小时前</em>上传了1张图片到图册<a href="#">《冬日美景》</a><span>[35评/93阅]</span>
											</div>
										</li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>3小时前</em>上传了3张图片到图册<a href="#">《冬日美景》</a><span>[35评/93阅]</span>
											</div>
										</li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>12小时前</em>发表了日志<a href="#">《天空从来都不是蓝色的》</a><span>[67评/122阅]</span>
											</div>
										</li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>12月16日</em>发表了日志<a href="#">《岁末，碎末》</a><span>[67评/122阅]</span>
											</div>
										</li>
									 -->
									</ul>
								</div>
								<div class="topbar_reply">
									<ul>
										<%
											for (LeaveMsgBO leaveMsg : leaveMsgList) {
										%>
										<li><img
											src="<%=ConstantsUtil.FW_DOMAIN + leaveMsg.getUser_photo()%>"
											alt="" />
											<div class="reply_r">
												<%
													if ("login".equals(leaveMsg.getType())) {
												%>
												<a
													href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/<%=leaveMsg.getUser_id()%>"
													class="name"><%=leaveMsg.getName()%></a>
												<%
													} else {
												%>
												<a href="#" class="name"><%=leaveMsg.getName()%></a>
												<%
													}
												%>
												<p class="time">
													<em><%=DateUtil.dateToCalendar(leaveMsg.getLeave_time())
						.get(Calendar.MONTH) + 1%>/</em><%=DateUtil.dateToCalendar(leaveMsg.getLeave_time())
						.get(Calendar.DAY_OF_MONTH)%>
												</p>
												<p class="cont">
													:&nbsp;<a title="<%=leaveMsg.getMsg()%>" href="#"><%=StringUtil.cutString(leaveMsg.getMsg(), 33)%></a>
												</p>
											</div>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="content-gallery" style="display: none;">
						<div class="gallery-item" id="post-116">
							<h2>
								<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
									<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
							</h2>
						</div>
						<div class="gallery-item" id="post-134">
							<a title="测试图册缩略图" href="#"> <img width="219" height="219"
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/default/anime/1.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
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
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/default/anime/1.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
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
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/default/anime/1.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
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
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/default/anime/1.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
							</a>
							<h2>测试图册缩略图</h2>
						</div>
					</div>
					<!-- content-gallery -->
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
</body>
</html>