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
<!-- gridster css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/gridter/jquery.gridster.min.css"
	rel="stylesheet" media="screen" />
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<!-- Gridter js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/gridter/jquery.gridster.min.js"></script>

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

		var gridster = $(".gridster ul").gridster({
			widget_margins : [ 10, 10 ],
			widget_base_dimensions : [ 140, 140 ]
		});

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
		//图片轮播
		marquee("marquee");

		$(".marqHideTip").hover(function() {
			$(".marqHideTip").show();
		});
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
	 
	//图片轮播
	function marquee(id) {
		try {
			document.execCommand("BackgroundImageCache", false, true);
		} catch (e) {
		}
		;
		var container = document.getElementById(id), original = container
				.getElementsByTagName("dt")[0], clone = container
				.getElementsByTagName("dd")[0], speed = arguments[1] || 15;
		clone.innerHTML = original.innerHTML;
		container.scrollLeft = clone.offsetLeft;
		var rolling = function() {
			if (container.scrollLeft == 0) {
				container.scrollLeft = clone.offsetLeft;
			} else {
				container.scrollLeft--;
			}
		};
		var timer = setInterval(rolling, speed);//设置定时器
		container.onmouseover = function() {
			clearInterval(timer);
			$(".marqHideTip").show();
		};//鼠标移到marquee上时，清除定时器，停止滚动
		container.onmouseout = function() {
			timer = setInterval(rolling, speed);
			$(".marqHideTip").hide();
		};//鼠标移开时重设定时器
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
			<a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/index">首页</a><span>不因得失而惧怕前行</span>
		</div>
		<p>
			Telephone: 1581 011 2386<a href="http://weibo.com/semis">@semis</a>
		</p>
	</div>
	<div class="go_back">
		<%
		if(!"index".equals(fun)) {
		%>
		<img src="<%=ConstantsUtil.FW_DOMAIN %>/img/go_back.png" alt="" />
		<%
		}
		%>
	</div>
	<div class="wrap">
		<div class="container">
			<div class="main_wrap">
				<div class="main">
					<div id="indexMain">
						<div class="gridster ready">
							<ul style="height: 480px; position: relative;">
								<!-- 图册轮播
								 -->
								<li data-sizey="1" data-sizex="2" data-col="2" data-row="3"
									class="gs_w">
									<div id="marquee" class="marquee">
										<dl>
											<dt>
												<a href="javascript:void(0)"><img
													src="<%=imgPath%>2_1.jpg" /> </a> <a href="javascript:void(0)"><img
													src="<%=imgPath%>2_2.jpg" /> </a> <a href="javascript:void(0)"><img
													src="<%=imgPath%>2_3.jpg" /> </a> <a href="javascript:void(0)"><img
													src="<%=imgPath%>2_4.jpg" /> </a> <a href="javascript:void(0)"><img
													src="<%=imgPath%>2_5.jpg" /> </a>
											</dt>
											<dd></dd>
										</dl>
									</div>
									<div class="marqHideTip">
										<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture">进入图册列表</a>
									</div>
								</li>

								<!-- 申请外链 -->
								<li data-sizey="1" data-sizex="1" data-col="1" data-row="3"
									class="gs_w" id="applyLinkDiv">
									<h2 id="applylink">申请外链</h2> <a
									href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/36#reply-div"
									id="index_link"></a></li>

								<!-- 时间显示 -->
								<li data-sizey="1" data-sizex="2" data-col="4" data-row="1"
									class="gs_w">
									<div class="clock">
										<div id="Date"></div>
										<div id="hours"></div>
										<div id="point">:</div>
										<div id="min"></div>
										<div id="point">:</div>
										<div id="sec"></div>
									</div>
								</li>
								<li data-sizey="2" data-sizex="2" data-col="1" data-row="1"
									class="gs_w"></li>
								<!-- 图册统计 -->
								<li data-sizey="1" data-sizex="1" data-col="4" data-row="3"
									class="gs_w albumCount">
									<h1>图册</h1>
									<h2>
										&nbsp;<a
											href="#">2</a>
									</h2>
									<div class="albumHideTip">共有图册2篇，<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture">点击查看</a></div></li>
								<li data-sizey="1" data-sizex="2" data-col="2" data-row="3"
									class="gs_w"></li>
								<!-- 关于 -->
								<li data-sizey="1" data-sizex="1" data-col="5" data-row="3"
									class="gs_w aboutMe"><span>About Me</span>
								<div class="aboutHideTip"><a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus">关于本站及作者</a></div>	
									</li>

								<!-- 拖动提示图标 -->
								<li data-sizey="1" data-sizex="1" data-col="6" data-row="1"
									class="gs_w try"></li>

								<!-- 日志统计 -->
								<li data-sizey="1" data-sizex="1" data-col="5" data-row="2"
									class="gs_w diaryCount">
									<h1>日志</h1>
									<h2>
										&nbsp;<a
											href="#">21</a>
									</h2>
									<div class="diaryHideTip">共有日志21篇，<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary">点击查看</a></div></li>

								<li data-sizey="1" data-sizex="1" data-col="3" data-row="1"
									class="gs_w">
									<h1>懒熊</h1>De
									<h2>部落格</h2>
								</li>

								<!-- 会员信息 -->
								<li data-sizey="2" data-sizex="1" data-col="6" data-row="2"
									class="gs_w">
									<h2>会员&nbsp;15</h2>
									<div class="userList">
										<a title="用户1" href="" id="user1" class="userLi"> <img
											src="http://www.wnjava.com/img/head/default/anime/6.jpg" /><span></span>
										</a> <a title="用户2" href="" id="user2" class="userLi"> <img
											src="http://www.wnjava.com/img/head/default/anime/4.jpg" /><span></span>
										</a> <a title="用户3" href="" id="user3" class="userLi"> <img
											src="http://www.wnjava.com/img/head/default/anime/3.jpg" /><span></span>
										</a> <a title="用户4" href="" id="user4" class="userLi"> <img
											src="http://www.wnjava.com/img/head/default/anime/1.jpg" /><span></span>
										</a> <a title="用户5" href="" id="user5" class="userLi"> <img
											src="http://www.wnjava.com/img/head/default/anime/2.jpg" /><span></span>
										</a>
									</div>
								</li>
							</ul>
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
			<span class="flink">友情链接：<a target="_blank" href="http://baipeng.alwaysdata.net">BAI
				Peng's</a>| <a target="_blank" href="http://www.eamonning.com">清泉逐流</a></span><span class="copyright">&copy; 2013 京ICP备13011487号. all designed by <a href="<%=ConstantsUtil.FW_DOMAIN %>/action/system/user/1">Kalor</a></span>
		</p>
	</div>
</body>
</html>