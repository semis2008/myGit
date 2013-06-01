<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.vo.DynamicVO"%>
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
	Integer diaryCount = (Integer)request.getAttribute("diaryCount");
	if(diaryCount == null) {
		diaryCount = 0;
	}

	List<DiaryBO> diaries = (ArrayList<DiaryBO>)request.getAttribute("diaries");
	if(diaries==null) {
		diaries = new ArrayList<DiaryBO>();
	}
	List<DiaryBO> notices = (ArrayList<DiaryBO>)request.getAttribute("notices");
	if(notices==null) {
		notices = new ArrayList<DiaryBO>();
	}
	DynamicVO dynamicVO = (DynamicVO)request.getAttribute("dynamics");
	if(dynamicVO==null) {
		dynamicVO = new DynamicVO();
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
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/slicebox/slicebox.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/slicebox/custom.css" />
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/slicebox/modernizr.custom.46884.js"></script>
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/slicebox/jquery.slicebox.js"></script>
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

		//幻灯片
		var Page = (function() {
			var $navArrows = $('#nav-arrows').hide(), $navDots = $('#nav-dots')
					.hide(), $nav = $navDots.children('span'), $shadow = $(
					'#shadow').hide(), slicebox = $('#sb-slider').slicebox({
				onReady : function() {
					$navArrows.show();
					$navDots.show();
					$shadow.show();
				},
				onBeforeChange : function(pos) {
					$nav.removeClass('nav-dot-current');
					$nav.eq(pos).addClass('nav-dot-current');

				}
			}),
			init = function() {
				initEvents();
			}, initEvents = function() {
				// add navigation events
				$navArrows.children(':first').on('click', function() {
					slicebox.next();
					return false;
				});
				$navArrows.children(':last').on('click', function() {
					slicebox.previous();
					return false;
				});
				$nav.each(function(i) {
					$(this).on('click', function(event) {
						var $dot = $(this);
						if (!slicebox.isActive()) {
							$nav.removeClass('nav-dot-current');
							$dot.addClass('nav-dot-current');
						}
						slicebox.jump(i + 1);
						return false;
					});
				});
			};
			return {
				init : init
			};
		})();
		Page.init();
		fadeIn(1);
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
	//主页信息框淡入淡出
	function fadeIn(id){
		$(".contentTitle").fadeOut(600);
		$(".contentHide").fadeOut(600);
		$("#"+id+"_title").fadeIn(1500);
		$("#content_"+id).fadeIn(1500);
		$(".activeSlide").removeClass("activeSlide");
		$("#paper_"+id).addClass("activeSlide");
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
						 		<h2 id="1_title" class="contentTitle" >会员动态</h2> 
								<h2 id="2_title" class="contentTitle" >公告</h2>
								<h2 id="3_title" class="contentTitle" >日志</h2>
								<h2 id="4_title" class="contentTitle" >图册</h2>
								<ul>
									<li class="contentHide" id="content_1">
										<div class="work-lt">
											<p>注册之后你也可以出现在这里哦~，还可以发表自己的日志，以及更方便的和大家交流~~</p>
										</div>
										<div class="work-rt">
											<ul>
											<%
											for(DiaryBO bo:dynamicVO.getDynamicPart1()) {
												%>
												<li>
													<h3>
														<span><%=DateUtil.formatDate(bo.getPublish_time(),4) %>:</span><%=bo.getAuthor_name() %>
													</h3>
													<p>
														写了一篇名叫<a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/diarydetail/<%=bo.getId() %>">《<%=bo.getTitle() %>》</a>的日志，赶紧去<a
															href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/diarydetail/<%=bo.getId() %>">看看</a>吧
													</p>
												</li>
												<%
											}											
											for(UserBO bo:dynamicVO.getDynamicPart2()) {
												%>
												<li>
													<h3>
														<span><%=DateUtil.formatDate(bo.getReg_time(),4) %>:</span><%=bo.getName() %>
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p>
												</li>
												<%
											}
											%>
											</ul>
										</div></li>
									<li class="contentHide" id="content_2">
										<div class="work-lt">
											<p>系统管理员发布的关于~懒熊·部落格~的一些说明和通知~</p>
										</div>
										<div class="work-rt">
											<ul>
											<%for(DiaryBO notice:notices) { %>
												<li>
													<h3>
														<span>公告:</span>&nbsp;|&nbsp;<%=DateUtil.formatDate(notice.getPublish_time(),2) %> <a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/diarydetail/<%=notice.getId() %>">《<%=notice.getTitle() %>》</a>
													</h3></li>
												<%} %>
											</ul>
										</div></li>
									<li class="contentHide" id="content_3">
										<div class="work-lt">
											<p>最新的日志信息，点击查看。</p>
										</div>
										<div class="work-rt">
											<ul>
											<%for(DiaryBO diary:diaries) { %>
												<li>
													<h3>
														<span><%=DateUtil.formatDate(diary.getPublish_time(),4) %>:</span><%=diary.getAuthor_name() %>
													</h3>
													<p>
														发表了名为<a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/diarydetail/<%=diary.getId() %>">《<%=StringUtil.cutString(diary.getTitle(),30) %>》</a>的日志，去看看吧~<span>[<%=diary.getReply_num() %>评/<%=diary.getRead_num() %>阅]</span>
													</p></li>
													<%} %>
											</ul>
										</div></li>
									<li class="contentHide" id="content_4">
										<div class="work-lt">
											<p>系统的图册信息，目前尚未对普通用户开放上传功能~。</p>
										</div>
										<div class="work-rt">
											<ul id="sb-slider" class="sb-slider">
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_1.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>时光镜面</h3>
													</div>
												</li>
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_2.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>第一版的首页，界面布局什么的.....留作纪念吧</h3>
													</div>
												</li>
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_3.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>第二版的主页，目前保留做个人主页了。</h3>
													</div>
												</li>
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_4.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>第三版的首页...基本接近我预想的效果了，不过还是被舍弃了理由是...太乱？</h3>
													</div>
												</li>
											</ul>
											<div id="nav-arrows" class="nav-arrows">
												<a href="#">Next</a> <a href="#">Previous</a>
											</div>
											<div class="shadow" id="shadow" style="display: block;"></div>
											<div id="nav-dots" class="nav-dots">
												<span class="nav-dot-current"></span> <span></span> <span></span>
												<span></span>
											</div>
										</div>
									</li>
								</ul>
								<div class="work-pager">
									 <a href="javascript:fadeIn(1);" onmouseover="fadeIn(1)" id="paper_1">1</a><a id="paper_2" href="javascript:fadeIn(2);" onmouseover="fadeIn(2)" class="activeSlide">2</a><a
										href="javascript:fadeIn(3);" onmouseover="fadeIn(3)" id="paper_3">3</a><a  id="paper_4" href="javascript:fadeIn(4);" onmouseover="fadeIn(4)">4</a>
								</div>
							</div>
							<div class="aside">
								<ul>
									<li class="diaryCount " onclick="location.href='/action/system/diary'"><em class="ico_diary"></em>
										<span> <b>日志</b> &nbsp;|&nbsp; 共<%=diaryCount %> 篇 </span></li>
									<!-- 图册统计 -->
									<li class="albumCount" onclick="location.href='/action/system/picture'"><em class="ico_album"></em> <span>
											<b>图册</b> &nbsp;|&nbsp; 共2册 </span></li>
									<!-- WNChat-->
									<li class="aboutMe" onclick="location.href='/action/chat/test'"><em class="ico_about"></em> <span>
											<b>WN Chat</b> </span></li>		
									<!-- 关于 -->
									<li class="aboutMe" onclick="location.href='/action/system/aboutus'"><em class="ico_about"></em> <span>
											<b>About Me</b> </span></li>
									<!-- 会员信息 -->
									<li class="userList "><em class="ico_users"></em> <span>
											<b>会员</b> &nbsp;|&nbsp;目前有注册成员<%=users.size()%>名 </span>
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
										</div></li>
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
				target="_blank" href="http://www.eamonning.com">清泉逐流</a> </span><span
				class="copyright">&copy; 2013 京ICP备13011487号. all designed by
				<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/1">偷懒的熊</a>
			</span>
		</p>
	</div>
</body>
</html>