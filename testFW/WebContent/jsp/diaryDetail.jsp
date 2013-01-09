<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page import="com.testFW.bo.UserBO"%>
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
<link href="/css/diaryDetail.css" rel="stylesheet" type="text/css" />
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
<title>日志详情</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" id="sForm"
					action="<%=ConstantsUtil.FW_DOMAIN%>/action/system/search">
					<input name="s" id="s" value="站内搜索" class="small_search fixedTip"
						type="text" title="输入内容后，敲击回车可以在全站内搜索相关信息" />
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
			<div class="sidebar">
				<ul class="side_nav">
					<li <%if ("mainpage".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a></li>
					<li <%if ("diary".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/"
						title="查看日志" id="diary">日志</a></li>
					<li <%if ("picture".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
						title="查看图册信息" id="picture">图册</a></li>
					<li <%if ("aboutus".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
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
						<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
							title="点击进入主页"><%=user.getName()%></a>
						<%
							}
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/message.html">留言</a>
					</div>
					<div class="artical" id="post-1">
						<div class="art-cats">
							<ul>
								<li class="blogNum"><a title="测试博文" href="#">1</a></li>
								<li class="tag"><a title="标签1" href="#">标签one</a></li>
								<li class="tag"><a title="标签2" href="#">标签two</a></li>
							</ul>
						</div>
						<div class="art-header">
							<h1 class="art-title">
								<a title="测试博文标题"
									href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/1">测试博文标题test
									blog-title</a>
							</h1>
							<p class="comment-count">
								<a title="测试博文回复数" href="#">3</a>
							</p>
							<div class="art-meta">
								Posted on <a title="12:10 pm" href="#">December 14, 2012</a><span
									class="byline"> by <span class="author"><a
										title="查看他发布的所有博文" href="#">作者1</a> </span> </span>
							</div>
						</div>
						<div class="art-content">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;测试博文内容测试博文内容测试博文内容测试博文内容测试博文内容测试博文内容
								Jennifer M. Dodd joined the bbPress 按时大大大大大顶顶顶顶顶顶顶顶顶顶
								按时大大大大大顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶 按时大大大大大顶顶顶顶顶顶顶顶顶顶的 core commit team this
								week after contributing to the project since the plugin version
								of bbPress was introduced. bbPress lead John James Jacoby said,</p>
							<p>asddddddddddddddddddddddddddddddddddddddddddddddddddd
								asdassssssssssss</p>
						</div>
					</div>
					<div id="comments">
						<h2 class="comments-title">
							日志“<a href="#">测试博文标题test blog-title</a>”有7条回复
						</h2>
						<div class="cmt head">
							<div class="user">
								<img alt="#"
									src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_girl.jpg" />
								<textarea id="cmt_area">发表回复...</textarea>
								<div class="proceed">
									<button class="btn" type="submit">回复</button>
								</div>
							</div>
							<div class="guest">
								<img alt="#"
									src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser.jpg" />
								<textarea id="cmt_area">发表回复...</textarea>
								<div class="proceed">
									<button class="btn" type="submit">回复</button>
								</div>
								<input type="text" value="name" /><input type="text"
									value="email" /><input type="text" value="webSite" />
							</div>
						</div>
						<div id="comment-1" class="cmt top">
							<img alt="#"
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_boy.jpg" />
							<div class="commentR">
								<a href="#" class="name">Kalor</a><a href="#" class="reply">回复</a>
								<p class="time">08.07 12:45</p>
								<div>在这里，直接和我说话吧</div>
							</div>
							<div id="reply-2" class="cmt replyForm">
								<div class="user">
									<img alt="#"
										src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_girl.jpg" />
									<textarea id="cmt_area">发表回复...</textarea>
									<div class="proceed">
										<button class="btn" type="submit">回复</button>
									</div>
								</div>
								<div class="guest">
									<img alt="#"
										src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser.jpg" />
									<textarea id="cmt_area">发表回复...</textarea>
									<div class="proceed">
										<button class="btn" type="submit">回复</button>
									</div>
									<input type="text" value="name" /><input type="text"
										value="email" /><input type="text" value="webSite" />
								</div>
							</div>
							<div id="comment-2" class="cmt child">
								<img alt="#"
									src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_girl.jpg" />
								<div class="commentR">
									<a href="" class="name">水晶</a><a rel="188" href="#"
										class="reply">回复</a>
									<p class="time">09.15 03:49</p>
									<div>
										<a class="parent" href="#comment-1">@Kalor</a>&nbsp;&nbsp;快点吧
									</div>
								</div>
								<div id="comment-2" class="cmt child">
									<img alt="#"
										src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_boy.jpg" />
									<div class="commentR">
										<a href="" class="name">馒头</a><a rel="188" href="#"
											class="reply">回复</a>
										<p class="time">09.15 03:49</p>
										<div class="txt">
											<a class="parent" href="#comment-1">@Kalor</a>&nbsp;&nbsp;快点吧
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="comment-1" class="cmt top">
							<img alt="#"
								src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_boy.jpg" />
							<div class="commentR">
								<a href="#" class="name">Kalor</a><a href="#" class="reply">回复</a>
								<p class="time">08.07 12:45</p>
								<div>在这里，直接和assssssssssssdassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss我说话吧</div>
							</div>
							<div id="comment-2" class="cmt child">
								<img alt="#"
									src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_girl.jpg" />
								<div class="commentR">
									<a href="" class="name">水晶</a><a rel="188" href="#"
										class="reply">回复</a>
									<p class="time">09.15 03:49</p>
									<div>
										<a class="parent" href="#comment-1">@Kalor</a>&nbsp;&nbsp;快点adsasdasda啊水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水水吧
									</div>
								</div>
								<div id="comment-2" class="cmt child">
									<img alt="#"
										src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_girl.jpg" />
									<div class="commentR">
										<a href="" class="name">水晶</a><a rel="188" href="#"
											class="reply">回复</a>
										<p class="time">09.15 03:49</p>
										<div class="txt">
											<a class="parent" href="#comment-1">@Kalor</a>&nbsp;&nbsp;快点吧
										</div>
									</div>
								</div>
							</div>
						</div>
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
	</div>
</body>
</html>