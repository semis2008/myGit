<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.testFW.bo.UserBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
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
	String imgPath = ConstantsUtil.FW_DOMAIN + "/album/1/1/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/pictureDetail.css" rel="stylesheet" type="text/css" />

<!-- google jquery link 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->

<script language="javascript" type="text/javascript" 
 	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script> 
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>
<!-- Add mousewheel plugin (this is optional) -->
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox-thumbs.css" />
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox-thumbs.js"></script>
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
		$('a.fixedTip').aToolTip();
		$('input.fixedTip').aToolTip();
		$('.fancybox').fancybox();
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
		$('input.fixedTip').aToo
		lTip();
	});
</script>
<title>图册详情</title>
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
					<li <%if ("mainpage".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a>
					</li>
					<li <%if ("diary".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary"
						title="查看日志" id="diary">日志</a>
					</li>
					<li <%if ("picture".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
						title="查看图册信息" id="picture">图册</a>
					</li>
					<li <%if ("aboutus".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus"
						title="关于我以及本站" id="aboutus">about</a>
					</li>
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
					<div class="albumDetail">
						<div class="hostinfo ">
							<div id="" class="face">
								<a title="进入AnRan的个人展区" href="http://anran0420.pp.163.com/">
									<img src="<%=imgPath%>4_b.jpg" alt="" /> </a>
							</div>
							<ul class="albuminfo">
								<li class="o-info">
									<h2 class="album-title">【Napa Valley酒庄之旅】</h2>
									<p>
										<b>[14张]</b>
									</p>
								</li>
								<li class="albumdesc">
									<p>器材： 佳能 - EOS 5D Mark II ， 适马 - 50 F1.4 拍摄于：海外 美国 ，
										发布于：2013.01.09 10:29</p></li>
								<li class="pic-cmtnum">
									<p>
										<b title="浏览量" class="ico-attention"></b> <span>948</span> <b
											title="评论" class="ico-cmt"></b> <span>4</span> <b title="喜欢"
											class="ico-like"></b><span>18</span>
									</p>
								</li>
								<li>
									<p class="album-author">
										&copy; <a title="进入Kalor的主页" href="#">Kalor</a> <span
											class="author-follow"><a href="#"><b>+</b>关注他</a><a
											href="#"> <b>√</b> 已关注</a> <a href="#">取消关注</a> </span> <span
											class="praise" href="#"><a href="#">赞他(128)</a> </span>
									</p>
								</li>
							</ul>
						</div>
						<div class="pics">
							<div class="left">
								<ul style="top: -4px; position: absolute;" class="tl_scrubber"
									id="tl_scrubber">
									<li class="focus"><a>美景</a>
									</li>
									<li><a>黄山</a>
									</li>
									<li><a>嵩山</a>
									</li>
									<li><a>长江</a>
									</li>
									<li><a>日出</a>
									</li>
									<li><a>水</a>
									</li>
								</ul>
							</div>
							<div class="right">
								<a style="overflow: visible;" class="tl_line"
									href="javascript:void(0);"> <span style="display: none;"
									class="tl_add"></span> </a>
								<div class="tab_block" id="tab_1">
									<a href="javascript:void(0)" class="tl_point haspic"></a>
									<div class="tab_div">
										<div class="tab_head">
											<a href="#">美景</a>
										</div>
										<div class="tab_photos">
											<div class="main-area">
												<div class="pic-area" style="">
													<img src="<%=imgPath%>4_b.jpg"
														style="width: auto; height: auto;" />
												</div>
												<div class="m-picAct">
													<div class="pic-descArea">
														<p class="pic-description">未标题-1</p>
													</div>
													<div class="pic-btnarea">
														<p>
															<a class="w-btnDimGray" onclick="return false;" href="#">喜欢(0)</a>
															<a class="w-btnWhiteSmoke w-btn-cancelLike f-hide"
																onclick="return false;" href="#"><b>已喜欢(0)</b><b>取消喜欢(0)</b>
															</a> <a class="w-btnWhiteSmoke f-ml10 "
																onclick="return false;" href="#">评论</a>
														</p>
													</div>
												</div>
											</div>
											<div class="main-area">
												<div class="pic-area" style="">
													<img src="<%=imgPath%>4_b.jpg"
														style="width: auto; height: auto;" />
												</div>
												<div class="m-picAct">
													<div class="pic-descArea">
														<p class="pic-description">未标题-1</p>
													</div>
													<div class="pic-btnarea">
														<p>
															<a class="w-btnDimGray" onclick="return false;" href="#">喜欢(0)</a>
															<a class="w-btnWhiteSmoke w-btn-cancelLike f-hide"
																onclick="return false;" href="#"><b>已喜欢(0)</b><b>取消喜欢(0)</b>
															</a> <a class="w-btnWhiteSmoke f-ml10 "
																onclick="return false;" href="#">评论</a>
														</p>
													</div>
												</div>
											</div>
											<div class="main-area">
												<div class="pic-area" style="">
													<img src="<%=imgPath%>4_b.jpg"
														style="width: auto; height: auto;" />
												</div>
												<div class="m-picAct">
													<div class="pic-descArea">
														<p class="pic-description">未标题-1</p>
													</div>
													<div class="pic-btnarea">
														<p>
															<a class="w-btnDimGray" onclick="return false;" href="#">喜欢(0)</a>
															<a class="w-btnWhiteSmoke w-btn-cancelLike f-hide"
																onclick="return false;" href="#"><b>已喜欢(0)</b><b>取消喜欢(0)</b>
															</a> <a class="w-btnWhiteSmoke f-ml10 "
																onclick="return false;" href="#">评论</a>
														</p>
													</div>
												</div>
											</div>
											<div class="main-area">
												<div class="pic-area" style="">
													<img src="<%=imgPath%>4_b.jpg"
														style="width: auto; height: auto;" />
												</div>
												<div class="m-picAct">
													<div class="pic-descArea">
														<p>未标题-1</p>
													</div>
													<div class="pic-btnarea">
														<p>
															<a class="w-btnDimGray" onclick="return false;" href="#">喜欢(0)</a>
															<a class="w-btnWhiteSmoke w-btn-cancelLike f-hide"
																onclick="return false;" href="#"><b>已喜欢(0)</b><b>取消喜欢(0)</b>
															</a> <a class="w-btnWhiteSmoke f-ml10 "
																onclick="return false;" href="#">评论</a>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab_none" id="tab_2">
									<a href="javascript:void(0)" class="tl_point haspic"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="section_wrap more_padding">
					<h3>
						<strong>1989</strong> Keep learning &amp; Remain Modest.
					</h3>
					<small>&copy; Copyright 2013 WnJava. All rights reserved.
						Designed by <a target="_blank"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/1">偷懒的熊</a> </small><br><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>