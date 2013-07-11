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
	Integer diaryCount = (Integer) request.getAttribute("diaryCount");
	if (diaryCount == null) {
		diaryCount = 0;
	}

	List<DiaryBO> diaries = (ArrayList<DiaryBO>) request
			.getAttribute("diaries");
	if (diaries == null) {
		diaries = new ArrayList<DiaryBO>();
	}
	List<DiaryBO> notices = (ArrayList<DiaryBO>) request
			.getAttribute("notices");
	if (notices == null) {
		notices = new ArrayList<DiaryBO>();
	}
	DynamicVO dynamicVO = (DynamicVO) request.getAttribute("dynamics");
	if (dynamicVO == null) {
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
<link
	href="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/css/bootstrap.css"
	rel="stylesheet" media="screen" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/index.css" rel="stylesheet" type="text/css" />


<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>
<title>懒熊de部落格</title>
</head>
<body>
	<jsp:include page="/jsp/common/head.jsp" flush="true">
		<jsp:param value="officeDodSendForm" name="userInfo" />
	</jsp:include>


	<article class="container"> <section class="row description"
		id="description"> <!-- 网站描述 -->
	<div
		class="span10 offset1 panel-description button-text-panel text-center">
		<div class="padding-middle">
			<img style="width: 110px; height: 110px"
				src="<%=ConstantsUtil.FW_DOMAIN%>/img/wn_head01.jpg"
				class="profile img-circle loading" />
			<h4>我是王宁，本站的作者，89年生于河北。毕业一年，程序员。</h4>
			<h5>喜欢创造的快乐，喜欢宅。有算不上远大的理想，有算不上智慧的想法。生活是一架天梯，一步一步走，总有到达终点的那一刻。我是低头赶路的行者，脚下生根。</h5>
			<hr class="soften" />
			<p>
				<span class="hidden-phone">这是我开发的网站，</span>欢迎访问<a target="_blank"
					href="http://weibo.com/semis">我的博客</a>和我的另一个作品：<a target="_blank"
					href="http://www.wnjava.com/action/chat/test">ChatBear平台</a>
			</p>
		</div>
	</div>

	</section> </article>

	<%-- 
	
	
	
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
								<h2 id="1_title" class="contentTitle">会员动态</h2>
								<h2 id="2_title" class="contentTitle">公告</h2>
								<h2 id="3_title" class="contentTitle">日志</h2>
								<h2 id="4_title" class="contentTitle">图册</h2>
								<ul>
									<li class="contentHide" id="content_1">
										<div class="work-lt">
											<p>注册之后你也可以出现在这里哦~，还可以发表自己的日志，以及更方便的和大家交流~~</p>
										</div>
										<div class="work-rt">
											<ul>
												<%
													for (DiaryBO bo : dynamicVO.getDynamicPart1()) {
												%>
												<li>
													<h3>
														<span><%=DateUtil.formatDate(bo.getPublish_time(), 4)%>:</span><%=bo.getAuthor_name()%>
													</h3>
													<p>
														写了一篇名叫<a
															href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=bo.getId()%>">《<%=bo.getTitle()%>》</a>的日志，赶紧去<a
															href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=bo.getId()%>">看看</a>吧
													</p></li>
												<%
													}
													for (UserBO bo : dynamicVO.getDynamicPart2()) {
												%>
												<li>
													<h3>
														<span><%=DateUtil.formatDate(bo.getReg_time(), 4)%>:</span><%=bo.getName()%>
													</h3>
													<p>新加入了~懒熊·部落格~这个大家庭，撒花欢迎~~</p></li>
												<%
													}
												%>
											</ul>
										</div>
									</li>
									<li class="contentHide" id="content_2">
										<div class="work-lt">
											<p>系统管理员发布的关于~懒熊·部落格~的一些说明和通知~</p>
										</div>
										<div class="work-rt">
											<ul>
												<%
													for (DiaryBO notice : notices) {
												%>
												<li>
													<h3>
														<span>公告:</span>&nbsp;|&nbsp;<%=DateUtil.formatDate(notice.getPublish_time(), 2)%>
														<a
															href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=notice.getId()%>">《<%=notice.getTitle()%>》</a>
													</h3>
												</li>
												<%
													}
												%>
											</ul>
										</div>
									</li>
									<li class="contentHide" id="content_3">
										<div class="work-lt">
											<p>最新的日志信息，点击查看。</p>
										</div>
										<div class="work-rt">
											<ul>
												<%
													for (DiaryBO diary : diaries) {
												%>
												<li>
													<h3>
														<span><%=DateUtil.formatDate(diary.getPublish_time(), 4)%>:</span><%=diary.getAuthor_name()%>
													</h3>
													<p>
														发表了名为<a
															href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diarydetail/<%=diary.getId()%>">《<%=StringUtil.cutString(diary.getTitle(), 30)%>》</a>的日志，去看看吧~<span>[<%=diary.getReply_num()%>评/<%=diary.getRead_num()%>阅]</span>
													</p>
												</li>
												<%
													}
												%>
											</ul>
										</div>
									</li>
									<li class="contentHide" id="content_4">
										<div class="work-lt">
											<p>系统的图册信息，目前尚未对普通用户开放上传功能~。</p>
										</div>
										<div class="work-rt">
											<ul id="sb-slider" class="sb-slider">
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_1.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>时光镜面</h3>
													</div></li>
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_2.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>第一版的首页，界面布局什么的.....留作纪念吧</h3>
													</div></li>
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_3.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>第二版的主页，目前保留做个人主页了。</h3>
													</div></li>
												<li><a
													href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
													target="_blank"><img
														src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/2_4.jpg"
														alt="image1" /> </a>
													<div class="sb-description">
														<h3>第三版的首页...基本接近我预想的效果了，不过还是被舍弃了理由是...太乱？</h3>
													</div></li>
											</ul>
											<div id="nav-arrows" class="nav-arrows">
												<a href="#">Next</a> <a href="#">Previous</a>
											</div>
											<div class="shadow" id="shadow" style="display: block;"></div>
											<div id="nav-dots" class="nav-dots">
												<span class="nav-dot-current"></span> <span></span> <span></span>
												<span></span>
											</div>
										</div></li>
								</ul>
								<div class="work-pager">
									<a href="javascript:fadeIn(1);" onmouseover="fadeIn(1)"
										id="paper_1">1</a><a id="paper_2" href="javascript:fadeIn(2);"
										onmouseover="fadeIn(2)" class="activeSlide">2</a><a
										href="javascript:fadeIn(3);" onmouseover="fadeIn(3)"
										id="paper_3">3</a><a id="paper_4" href="javascript:fadeIn(4);"
										onmouseover="fadeIn(4)">4</a>
								</div>
							</div>
							<div class="aside">
								<ul>
									<li class="diaryCount "
										onclick="location.href='/action/system/diary'"><em
										class="ico_diary"></em> <span> <b>日志</b> &nbsp;|&nbsp;
											共<%=diaryCount%> 篇 </span>
									</li>
									<!-- 图册统计 -->
									<li class="albumCount"
										onclick="location.href='/action/system/picture'"><em
										class="ico_album"></em> <span> <b>图册</b> &nbsp;|&nbsp;
											共2册 </span>
									</li>
									<!-- WNChat-->
									<li class="aboutMe" onclick="location.href='/action/chat/test'"><em
										class="ico_about"></em> <span> <b>WN Chat</b> </span>
									</li>
									<!-- 关于 -->
									<li class="aboutMe"
										onclick="location.href='/action/system/aboutus'"><em
										class="ico_about"></em> <span> <b>About Me</b> </span>
									</li>
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
										</div>
									</li>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<!-- 底部 -->
	<jsp:include page="/jsp/common/bottom.jsp" flush="true" />
</body>
</html>