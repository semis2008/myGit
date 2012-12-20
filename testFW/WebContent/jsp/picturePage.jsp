<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	String imgPath = request.getContextPath() + "/album/1/1/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/album.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/fancybox/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/plugin/fancybox/jquery.fancybox-thumbs.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/fancybox/jquery.fancybox-thumbs.js"></script>
<script language="javascript" type="text/javascript">
	$(function() {
		$('.small_search').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
			}
		});
		/*fancybox-start*/
		$('.small_search').blur(function() {
			if (this.value == '') {
				this.value = this.defaultValue;
			}
		});
		$('.fancybox').fancybox();
		$('.fancybox-thumbs').fancybox({
			prevEffect : 'none',
			nextEffect : 'none',
			closeBtn : false,
			arrows : false,
			nextClick : true,
			helpers : {
				title : {
					type : 'over'
				},
				thumbs : {
					width : 50,
					height : 50
				}
			}
		});
		/*fancybox-end*/
	});
</script>
<title>图册</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" id="sForm"
					action="<%=request.getContextPath()%>/action/system/search">
					<input name="s" id="s" value="站内搜索" class="small_search"
						type="text" />
				</form>
			</div>
			<h1>
				<a href="<%=request.getContextPath()%>/action/system/mainpage"
					title="testFW Logo"><img
					src="<%=request.getContextPath()%>/img/testfw.jpg"
					alt="TestFW Logo" /> </a>
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
						href="http://www.testFW.com/action/system/mainpage" id="mainpage">主页</a>
					</li>
					<li <%if ("diary".equals(fun)) {%> class="active" <%}%>><a
						href="http://www.testFW.com/action/system/diary/" id="diary">日志</a>
					</li>
					<li <%if ("picture".equals(fun)) {%> class="active" <%}%>><a
						href="http://www.testFW.com/action/system/picture" id="picture">图册</a>
					</li>
					<li <%if ("aboutus".equals(fun)) {%> class="active" <%}%>><a
						href="http://www.testFW.com/action/system/aboutus" id="aboutus">about</a>
					</li>
				</ul>
			</div>
			<div class="main_wrap">
				<div class="main">
					<div class="top_bar"></div>
					<div id="post-1" class="album">
						<div class="iLikeThis" id="iLikeThis-1">
							<span class="counter">4<a onclick="likeThis(1);">Like</a>
							</span>
						</div>
						<p>
							<a class="fancybox-thumbs" title="这是测试图册的封面"
								data-fancybox-group="thumb1" href="<%=imgPath%>4_b.jpg"><img
								width="200" height="200" class="aligncenter size-medium"
								src="<%=imgPath%>4_s.jpg" alt="这是测试图册的封面" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>3_b.jpg"><img
								src="<%=imgPath%>3_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>2_b.jpg"><img
								src="<%=imgPath%>2_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb1" href="<%=imgPath%>1_b.jpg"><img
								src="<%=imgPath%>1_s.jpg" alt="这是测试图片" /> </a>
						</p>
						<a class="btn_details_only"
							href="<%=request.getContextPath()%>/action/system/picture">Details</a>
						<a title="预览" class="btn_preview_w_details"
							onclick="javascript:$('.fancybox-thumbs').click();">Preview</a>
					</div>
					<div id="post-2" class="album">
						<div class="iLikeThis" id="iLikeThis-2">
							<span class="counter">4<a onclick="likeThis(2);">Like</a>
							</span>
						</div>
						<p>
							<a class="fancybox-thumbs" title="这是测试图册的封面"
								data-fancybox-group="thumb2" href="<%=imgPath%>4_b.jpg"><img
								width="200" height="200" class="aligncenter size-medium"
								src="<%=imgPath%>4_s.jpg" alt="这是测试图册的封面" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>3_b.jpg"><img
								src="<%=imgPath%>3_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>2_b.jpg"><img
								src="<%=imgPath%>2_s.jpg" alt="这是测试图片" /> </a> <a
								style="display: none" title="这是测试图片" class="fancybox-thumbs"
								data-fancybox-group="thumb2" href="<%=imgPath%>1_b.jpg"><img
								src="<%=imgPath%>1_s.jpg" alt="这是测试图片" /> </a>
						</p>
						<a class="btn_details_only"
							href="<%=request.getContextPath()%>/action/system/picture">Details</a>
						<a title="预览" class="btn_preview_w_details"
							onclick="javascript:$('.fancybox-thumbs').click();">Preview</a>
					</div>
				</div>
				<div class="section_wrap more_padding">
					<h3>
						<strong>1989</strong> Keep learning &amp; Remain Modest.
					</h3>
					<small>&copy; Copyright 2012 TestFW. All rights reserved.
						Designed by <a target="_blank"
						href="http://www.testFW.com/action/user/1">Kalor</a> </small><br><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>