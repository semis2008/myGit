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

	List<UserBO> users = (List<UserBO>) request.getAttribute("users");
	if (users == null) {
		users = new ArrayList<UserBO>();
	}

	boolean hasLogin = false;
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
	}
	if (visitedUser == null) {
		visitedUser = new UserBO();
	}
	String imgPath = ConstantsUtil.FW_DOMAIN + "/album/1/1/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/index.css" rel="stylesheet" type="text/css" />

<!-- google jquery link 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->

<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
<!-- gridster css 
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/gridter/jquery.gridster.min.css"
	rel="stylesheet" media="screen" />
	-->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<!-- Gridter js
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/gridter/jquery.gridster.min.js"></script>
 -->
<script type="text/javascript">
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

		//随机翻转
		setInterval(function() {
			var userNum = 5;
			var id = Math.floor(Math.random() * userNum) + 1;
			toogleDiv('user' + id);
		}, 3000);
		setInterval(function() {
			var userNum = 5;
			var id = Math.floor(Math.random() * userNum) + 1;
			toogleDiv('user' + id);
		}, 4000);

		//时钟js
		// Create two variable with the names of the months and days in an array
		var monthNames = [ "January", "February", "March", "April", "May",
				"June", "July", "August", "September", "October", "November",
				"December" ];
		var dayNames = [ "Sunday", "Monday", "Tuesday", "Wednesday",
				"Thursday", "Friday", "Saturday" ];

		// Create a newDate() object
		var newDate = new Date();
		// Extract the current date from Date object
		newDate.setDate(newDate.getDate());
		// Output the day, date, month and year   
		$('#Date').html(
				dayNames[newDate.getDay()] + " " + newDate.getDate() + ' '
						+ monthNames[newDate.getMonth()] + ' '
						+ newDate.getFullYear());

		setInterval(function() {
			// Create a newDate() object and extract the seconds of the current time on the visitor's
			var seconds = new Date().getSeconds();
			// Add a leading zero to seconds value
			$("#sec").html((seconds < 10 ? "0" : "") + seconds);
		}, 1000);

		setInterval(function() {
			// Create a newDate() object and extract the minutes of the current time on the visitor's
			var minutes = new Date().getMinutes();
			// Add a leading zero to the minutes value
			$("#min").html((minutes < 10 ? "0" : "") + minutes);
		}, 1000);

		setInterval(function() {
			// Create a newDate() object and extract the hours of the current time on the visitor's
			var hours = new Date().getHours();
			// Add a leading zero to the hours value
			$("#hours").html((hours < 10 ? "0" : "") + hours);
		}, 1000);
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

	//翻转
	function toogleDiv(divId) {
		$("#" + divId + " img").animate({
			width : "0px",
			left : "1.8px"
		}, 220);
		$("#" + divId + " img").animate({
			width : "44px",
			left : "1.8px"
		}, 220);
	}
</script>
<title>懒熊de部落格</title>
</head>
<body>
	<div id="backstretch"
		style="left: 0px; top: 0px; position: fixed; overflow: hidden; z-index: -9999;">
		<img style="position: relative; left: 0px;"
			src="<%out.print(ConstantsUtil.FW_DOMAIN + ConstantsUtil.DEFAULT_BG);%>" />
	</div>
	<div id="hd">
		<div class="top_bar">
			<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/index">首页</a><span>不因得失而惧怕前行</span>
		</div>
		<p>
			Telephone: 1581 011 2386<a href="http://weibo.com/semis">@Kalor</a>
		</p>
	</div>
	<div class="go_back">
		<%
			if (!"index".equals(fun)) {
		%>
		<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/go_back.png" alt="" />
		<%
			}
		%>
	</div>
	<div class="wrap">
		<div class="container">
			<div class="main_wrap">
				<div class="main">
					<div id="indexMain">
						<div class="intro">
							<div class="indexTitle">
								<p>懒熊·部落格</p>
								<h1>简单的记录生活，一点一滴的进步。小站刚刚起步，欢迎大家注册留言。</h1>
							</div>
							<!-- 时间显示 -->
							<div class="clock">
								<div id="Date"></div>
								<div id="hours"></div>
								<div id="point">:</div>
								<div id="min"></div>
								<div id="point">:</div>
								<div id="sec"></div>
							</div>
						</div>
						<div class="indexContent">
							<div class="content">
								<h2 id="dynamics_title" class="contentTitle" style="display: none;"> 会员动态</h2>
								<h2 id="notice_title" class="contentTitle" style="display: none;">公告</h2>
								<h2 id="diary_title" class="contentTitle" style="display: block;">日志</h2>
								<h2 id="contentTitle4" class="contentTitle" style="display: none;">会员动态</h2>
								<h2 id="contentTitle5" class="contentTitle" style="display: none;">会员动态</h2>
								<h2 id="contentTitle6" class="contentTitle" style="display: none;">会员动态</h2>
								<h2 id="contentTitle7" class="contentTitle" style="display: none;">会员动态</h2>
								<ul>
									<li class="contentHide" id="dynamics">
										<div class="work-lt">
											<p>注册之后你也可以出现在这里哦~，还可以发表自己的日志，以及更方便的和大家交流~~</p>
										</div>
										<div class="work-rt">
											<ul>
												<li>
													<h3>
														<span>6/25:</span>偷懒的熊
													</h3>
													<p>
														写了一篇名叫<a href="#">《JS取随机数相关》</a>的日志，这是他的第22篇了，赶紧去<a
															href="#">看看</a>吧
													</p></li>
												<li>
													<h3>
														<span>6/23:</span>CC
													</h3>
													<p>
														写了一篇名叫<a href="#">《JS取随机数相关》</a>的日志，这是他的第13篇了，赶紧去<a
															href="#">看看</a>吧
													</p></li>
												<li>
													<h3>
														<span>6/21:</span>偷懒的熊
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
												<li>
													<h3>
														<span>6/21:</span>CC
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
												<li>
													<h3>
														<span>6/21:</span>王廷
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
												<li>
													<h3>
														<span>6/21:</span>偷懒的熊
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
												<li>
													<h3>
														<span>6/21:</span>偷懒的熊
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
												<li>
													<h3>
														<span>6/21:</span>偷懒的熊
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
											</ul>
										</div>
									</li>
									<li class="contentHide" id="notice">
										<div class="work-lt">
											<p>系统管理员发布的关于~懒熊·部落格~的一些说明和通知~</p>
										</div>
										<div class="work-rt">
											<ul>
												<li>
													<h3>
														<span>公告:</span>&nbsp;|&nbsp;2013/01/01 <a href="#">《JS取随机数相关》</a>
													</h3>
												</li>
												<li>
													<h3>
														<span>公告:</span>&nbsp;|&nbsp;2013/11/12 <a href="#">《JS取随机数相关》</a>
													</h3>
												</li>
												<li>
													<h3>
														<span>公告:</span>&nbsp;|&nbsp;2013/02/01 <a href="#">《JS取随机数相关》</a>
													</h3>
												</li>
											</ul>
										</div>
									</li>
									<li class="contentShow" id="diary">
										<div class="work-lt">
											<p>最新的日志信息，点击查看。</p>
										</div>
										<div class="work-rt">
											<ul>
												<li>
													<h3>
														<span>05/12:</span>偷懒的熊
													</h3>
													<p>发表了名为<a href="#">《JS取随机数相关》</a>的日志，去看看吧~<span>[0评/45阅]</span></p>
												</li>
												<li>
													<h3>
														<span>05/12:</span>偷懒的熊
													</h3>
													<p>发表了名为<a href="#">《JS取随机数相关》</a>的日志，去看看吧~<span>[0评/45阅]</span></p>
												</li>
												<li>
													<h3>
														<span>05/12:</span>偷懒的熊
													</h3>
													<p>发表了名为<a href="#">《JS取随机数相关》</a>的日志，去看看吧~<span>[0评/45阅]</span></p>
												</li>
												<li>
													<h3>
														<span>05/12:</span>偷懒的熊
													</h3>
													<p>发表了名为<a href="#">《JS取随机数相关》</a>的日志，去看看吧~<span>[0评/45阅]</span></p>
												</li>
												<li>
													<h3>
														<span>05/12:</span>偷懒的熊
													</h3>
													<p>发表了名为<a href="#">《JS取随机数相关》</a>的日志，去看看吧~<span>[0评/45阅]</span></p>
												</li>
											</ul>
										</div>
									</li>
									 

								</ul>
								<div class="work-pager">
									<a href="#" class="activeSlide">1</a><a href="#" class=" ">2</a><a
										href="#" class="">3</a><a href="#">4</a><a href="#">5</a><a
										href="#">6</a><a href="#">7</a>
								</div>
							</div>
							<div class="aside">
								<ul>
									<!-- 申请外链
									<li id="applyLinkDiv" class="f">
										<h2 id="applylink">申请外链</h2> <a
										href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/36#reply-div"
										id="index_link"></a></li>
									 -->
									<li class="diaryCount " onclick="">
										<em class="ico_diary"></em>
										<span>
										<b>日志</b>
										&nbsp;|&nbsp;										
										共21	篇
										</span>
									</li>
									<!-- 图册统计 -->
									<li class="albumCount">
										<em class="ico_album"></em>
										<span>
										<b>图册</b>
										&nbsp;|&nbsp;										
										共2册
										</span>
									</li>
									<!-- 关于 -->
									<li class="aboutMe ">
										<em class="ico_about"></em>
										<span>
										<b>About Me</b>
										</span>
									</li>
									<!-- 会员信息 -->
									<li class="userList ">
										<em class="ico_users"></em>
										<span>
										<b>会员</b>
										&nbsp;|&nbsp;目前有注册成员<%=users.size()%>名
										</span>
										<div>
											<%
												for (UserBO reg_user : users) {
											%>
											<a title="<%=reg_user.getName()%>"
												href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/<%=reg_user.getId()%>"
												id="user<%=reg_user.getId()%>" class="userLi"> <img
												src="<%out.print(ConstantsUtil.FW_DOMAIN + reg_user.getPhoto());%>" /><span></span>
											</a>
											<%
												}
											%>
										</div>
									</li>
								</ul>

							</div>
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
				target="_blank" href="http://www.eamonning.com">清泉逐流</a>
			</span><span class="copyright">&copy; 2013 京ICP备13011487号. all
				designed by <a
				href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/1">偷懒的熊</a>
			</span>
		</p>
	</div>
</body>
</html>