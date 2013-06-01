<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
	<link
		href="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/css/bootstrap-responsive.css"
		rel="stylesheet">
	<link type="text/css"
		href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
		rel="stylesheet" media="screen" />
	<link type="text/css"
		href="<%=ConstantsUtil.FW_DOMAIN%>/css/chat/index.css"
		rel="stylesheet" media="screen" />
	<link rel="stylesheet" type="text/css"
		href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
		media="screen" />
	<title>WNChat首页</title>
</head>
<body>
	<div class="wrap">
		<!-- 导航条 -->
		<div class="navbar-wrapper">
			<div class="container">
				<div class="navbar navbar-inverse">
					<div class="navbar-inner">
						<button data-target=".nav-collapse" data-toggle="collapse"
							class="btn btn-navbar" type="button">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a href="#" class="brand">Chat
							Bear&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						<div class="nav-collapse collapse">
							<ul class="nav">
								<li class="active"><a href="#"><i
										class="icon-home icon-white"></i> 首页</a></li>
								<li><a href="#about"><i class="icon-list icon-white"></i>
										About</a></li>
								<li><a href="#contact"><i
										class="icon-envelope icon-white"></i> Contact</a></li>
								<li class="dropdown"><a data-toggle="dropdown"
									class="dropdown-toggle" href="#"><i
										class="icon-plus icon-white"></i> 更多<b class="caret"></b> </a>
									<ul class="dropdown-menu">
										<li><a href="#"><i class="icon-user"></i> 个人信息</a></li>
										<li><a href="#"><i class="icon-ok"></i> 登陆</a></li>
										<li><a href="#"><i class="icon-plus-sign"></i> 注册</a></li>
										<li class="divider"></li>
										<li class="nav-header">相关项目</li>
										<li><a href="<%=ConstantsUtil.FW_DOMAIN%>"
											target="_blank"><i class="icon-hand-right"></i>
												wnJava网络社区</a></li>
										<li><a href="#"><i class="icon-hand-right"></i>
												Kalor网</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 轮播 -->
		<div class="carousel slide" id="myCarousel">
			<div class="carousel-inner">
				<div class="item active">
					<img alt=""
						src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/slide-01.jpg">
						<div class="container">
							<div class="carousel-caption">
								<h1>简单即是美.</h1>
								<br></br>
								<p class="lead">即时的接收朋友们的信息，并简短的进行回复。你可以在无序的信息中，认识新的朋友；通过简单的说明，分享自己的生活点滴。</p>
								<a href="#" class="btn btn-large btn-primary">马上加入&nbsp;<i
									class="icon-user icon-white"></i> </a>
							</div>
						</div>
				</div>
				<div class="item">
					<img alt=""
						src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/slide-02.jpg">
						<div class="container">
							<div class="carousel-caption">
								<h1>敏于行.</h1>
								<br></br>
								<p class="lead">有一万个好点子，不如把其中最不起眼的那个变成现实。一步一步走，总有到达终点的那一刻。我是低头赶路的行者，脚下生根。</p>
								<a href="#" class="btn btn-large btn-primary">更多&nbsp;<i
									class="icon-plus icon-white"></i> </a>
							</div>
						</div>
				</div>
				<div class="item">
					<img alt=""
						src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/slide-03.jpg">
						<div class="container">
							<div class="carousel-caption">
								<h1>是什么呢.</h1>
								<br />
								<p class="lead">是一个不断push短消息供你阅读的仆人，是一个给你与陌生人自由交流机会的神秘女子，是一个不知道你究竟想要什么，但是却可以给你最近接答案的.....</p>
								<a href="#" class="btn btn-large btn-primary">了解WN
									Chat&nbsp;<i class="icon-th icon-white"></i> </a>
							</div>
						</div>
				</div>
			</div>
			<a data-slide="prev" href="#myCarousel" class="left carousel-control">‹</a>
			<a data-slide="next" href="#myCarousel"
				class="right carousel-control">›</a>
		</div>
		<!-- 主体 -->
		<div class="container marketing">
			<div class="row" id="intro">
				<div class="span4">
					<img data-src="holder.js/140x140" class="img-circle" alt="140x140"
						style="width: 140px; height: 140px;"
						src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/slide-03.jpg">
						<h2>是什么？</h2>
						<p class="text-info">是一个不断push短消息供你阅读的仆人，是一个给你与陌生人自由交流机会的神秘女子，是一个不知道你究竟想要什么，但是却可以给你最近接答案的.....</p>
						<p>
							<a href="#" class="btn">查看 »</a>
						</p>
				</div>
				<div class="span4">
					<img data-src="holder.js/140x140" class="img-circle" alt="140x140"
						style="width: 140px; height: 140px;"
						src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/slide-01.jpg">
						<h2>简单</h2>
						<p class="text-info">哪怕不用注册，也可以即时的获取朋友们发布的信息。系统会依据你的习惯来筛选消息。而如果你打算回应对方或者分享自己的心情，那么就需要简单的注册一下啦。</p>
						<p>
							<a href="#" class="btn">注册 »</a>
						</p>
				</div>
				<div class="span4">
					<img data-src="holder.js/140x140" class="img-circle" alt="140x140"
						style="width: 140px; height: 140px;"
						src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/slide-02.jpg">
						<h2>迅捷</h2>
						<p class="text-info">基于简单的设计思路，为你呈现出即时无序的反馈信息。我们不知道您喜欢看什么，可是我们知道您看什么看的多。更多本系统的设计过程，欢迎关注~</p>
						<p>
							<a href="#" class="btn">盯上 ChatBear »</a>
						</p>
				</div>
			</div>
			
			
			<!-- 关于About -->
			<div class="row" id="about">
				<div class="span12">
					<h2 class="icon-line">
						<span>About</span>
					</h2>
				</div>
				<div class="span12">
					<h2>
						<a href="#">ChatBear</a> 是什么呢？ <span class="muted"><small>下面做一个简单的说明.</small>
						</span>
					</h2>
					<p class="lead">它当然不是一只熊，它是我即兴起的名字...O(∩_∩)O哈哈~老实说我也不知道怎么介绍，或许这会是一个很独特的产品，但是单就目前而言，它离‘产品’差的还是比较远。</p>
					<p class="lead text-info">
						我是打算把ChatBear做成一个即时的即兴聊天平台。不知道这样定义准不准确，具体来说就是完成后的该平台具备下面的这些特征：</p>
					<div class="row">
						<div class="span3">
							<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/about1.png">
								<p class="text-success">不管是否登录，访问本网站的用户都可以接收来自系统自动推送的消息。</p>
						</div>
						<div class="span3">
							<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/about2.png">
								<p class="text-success">系统推送的消息，若用户不进行操作，则一段时间后自动隐藏。</p>
						</div>
						<div class="span3">
							<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/about3.png">
								<p class="text-success">消息是系统即时筛选的，并在一定过滤后推送给用户。</p>
						</div>
						<div class="span3">
							<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/about4.png">
								<p class="text-success">用户可以对接收到的任意消息进行回复。</p>
						</div>
					</div>

				</div>
			</div>
			
			<!-- 联系Contact -->
			<div class="row" id="contact">
				<div class="span12">
					<h2 class="icon-line">
						<span>Contact</span>
					</h2>
				</div>
				<div class="span12">

				</div>
			</div>
			
			
			
		</div>































		<!-- 底部 -->
		<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>作品</h5>
					<a target="_blank" href="<%=ConstantsUtil.FW_DOMAIN%>">wnJava社区</a><br>
						<a href="#">java迭代打包工具</a><br> <a href="#">Help</a><br>
								<a target="_blank" href="#">开发者 /API</a>
				</div>
				<div class="span3">
					<h5>About</h5>
					<a href="#">关于 WNChat</a> <br> <a href="#">历程</a> <br> <a
							href="#">Core Technology</a> <br>
				</div>
				<div class="span3">
					<h5>友情链接：</h5>
					<a target="_blank" href="http://baipeng.alwaysdata.net">BAI
						Peng's</a><br /> <a target="_blank" href="http://www.eamonning.com">清泉逐流</a>
				</div>
				<div class="span3">
					<p>
						<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/chat/bear.png"
							alt="Chat Bear" /><br />
					</p>
				</div>
			</div>
			<div class="row">
				<div class="span9">
					<hr class="featurette-divider">
						&copy; 2013
						京ICP备13011487号.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						all designed by <a
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/1">偷懒的熊</a>
				</div>
			</div>
		</div>
		</footer>




		<!-- js file -->
		<script language="javascript" type="text/javascript"
			src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
		<script type="text/javascript"
			src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
		<script type="text/javascript"
			src="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(function() {
				$('#myCarousel').carousel({
					interval : 6000
				})
			});
		</script>
</body>
</html>