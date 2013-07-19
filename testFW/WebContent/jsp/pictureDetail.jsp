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

	String imgPath = ConstantsUtil.FW_DOMAIN + "/album/1/2/";

	Integer currentPage = (Integer) request.getAttribute("currentPage");
	if (currentPage == null) {
		currentPage = 1;
	}
	Integer totalPage = (Integer) request.getAttribute("totalPage");
	if (totalPage == null) {
		totalPage = 1;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 网站公用顶部 -->
<jsp:include page="/jsp/common/head.jsp" flush="true">
	<jsp:param value="<%=hasLogin %>" name="hasLogin" />
	<jsp:param value="<%=user.getName() %>" name="userName" />
	<jsp:param value="<%=user.getId() %>" name="userId" />
</jsp:include>
<link href="/css/pictureDetail.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript">
 	function showInfoSpan(id) {
		$("#pic-info-ext-"+id).show();
	}
	function hideInfoSpan(id) {
		$("#pic-info-ext-"+id).hide();
	}
	
</script>
<title>图册详情</title>
</head>
<body>
	<div class="bookmark">
		<ul class="breadcrumb">
			<li><a href="<%=ConstantsUtil.FW_DOMAIN%>">首页</a> <span
				class="divider">/</span>
			</li>
			<li><a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture">图册</a>
				<span class="divider">/</span>
			</li>
			<li class="active">风景</li>
		</ul>
	</div>
	<div class="container">
		<div class="span10 offset1">
			<div class="well media">
				<a href="#" class="pull-left"> <img
					class="media-object img-polaroid"
					style="width: 180px; height: 180px;"
					src="<%=ConstantsUtil.FW_DOMAIN%>/album/1/1/1_1.jpg"
					data-src="holder.js/180x180" /> </a>
				<div class="media-body">
					<ul class="unstyled">
						<li>
							<h3>
								【07-13北戴河之旅】<small>[14张]</small>
							</h3></li>
						<li>
							<blockquote>
								<small>选了一个周末去了一趟北戴河，周六去的，周日回。看了大海，吹了海风。最后晒伤了.....虽然行程比较紧，不过还是留下了比较美好的回忆。</small>
							</blockquote></li>
						<li>
							<p>
								&copy; <a title="进入他的主页" href="#">偷懒的熊</a>
								<icon class="icon-heart"></icon>
								<a href="#">948</a>
								<icon class="icon-comment"></icon>
								<a href="#">4</a>
							</p>
						</li>
						<li><small class="muted">器材： 佳能 - ixus125 ， 拍摄于：秦皇岛
								中国 ， 发布于：2013.07.13 10:29</small> <span
							class="btn btn-info btn-mini pull-right" href="#"><icon
									class="icon-thumbs-up icon-white"></icon>赞一个(948)</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="span12 row">
			<ul class="thumbnails">
				<%
					for (int i = 0; i < 9; i++) {
						if (Math.ceil(Math.random() * 10) > 5) {
				%>
				<li class="padding-top-bottom-middle">
					<div class="span8 pos-relative">
						<img class="img-polaroid pic scrollLoading" alt=""
							data-url="<%=imgPath%>2_<%=i + 1%>.jpg" src="#" /> <span
							class="well pic-info-ext span2 padding-small"
							id="pic-info-ext-<%=i%>"> 这里是相片的描述~~ </span>
						<div class="span2">
							<span class="pic-info-span padding-mini badge"
								onmouseover="showInfoSpan(<%=i%>)"
								onmouseout="hideInfoSpan(<%=i%>)" style="visibility: visible;">
								<icon class="icon-info-sign icon-white"></icon> </span> <span
								class="pic-share-span padding-mini badge"
								style="visibility: visible;"> <icon
									class="icon-share icon-white"></icon> </span>
						</div>
					</div>
					<div class="span3 padding-mini well">
						<ul class="unstyled">
							<li class="row">
								<div class="btn-toolbar pull-right">
									<div class="btn-group">
										<button class="btn btn-mini btn-success" onclick="#">
											<icon class="icon-thumbs-up icon-white"></icon>
											顶
										</button>
										<button class="btn btn-mini btn-danger" onclick="#">
											<icon class="icon-thumbs-down icon-white"></icon>
											踩
										</button>
									</div>
									<button class="reply-btn btn btn-mini btn-info" onclick="">
										<icon class="icon-pencil icon-white"></icon>
										评论
									</button>
								</div></li>
							<li class="padding-small">
								<ul class="unstyled pic-reply-ul">
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li>
										<button class="btn span2 margin-small btn-block btn-info">
											查看全部
											<icon class="icon-resize-vertical icon-white"></icon>
										</button></li>
								</ul></li>
						</ul>
					</div>
				</li>
				<%
					} else {
				%>
				<li class="padding-top-bottom-middle">
					<div class="span3 padding-mini well">
						<ul class="unstyled">
							<li class="row">
								<div class="btn-toolbar pull-right">
									<div class="btn-group">
										<button class="btn btn-mini btn-success" onclick="#">
											<icon class="icon-thumbs-up icon-white"></icon>
											顶
										</button>
										<button class="btn btn-mini btn-danger" onclick="#">
											<icon class="icon-thumbs-down icon-white"></icon>
											踩
										</button>
									</div>
									<button class="reply-btn btn btn-mini btn-info" onclick="">
										<icon class="icon-pencil icon-white"></icon>
										评论
									</button>
								</div>
							</li>
							<li class="padding-small">
								<ul class="unstyled pic-reply-ul">
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li class="border-bottom-dash">
										<blockquote class="margin-top-bottom-mini">
											<p>这是一条回复~~</p>
											<small><span class="text-info">Kalor</span><em>2013/03/04
													14:33</em> </small>
										</blockquote>
									</li>
									<li>
										<button class="btn span2 margin-small btn-block btn-info">
											查看全部
											<icon class="icon-resize-vertical icon-white"></icon>
										</button></li>
								</ul>
							</li>
							<li></li>
						</ul>
					</div>
					<div class="span8 pos-relative">
						<img class="pic scrollLoading img-polaroid" alt=""
							data-url="<%=imgPath%>2_<%=i + 1%>.jpg" src="" /> <span
							class="well pic-info-ext span2 padding-small"
							id="pic-info-ext-<%=i%>"> 这里是相片的描述~~ </span>
						<div class="span2">
							<span class="pic-info-span padding-mini badge"
								onmouseover="showInfoSpan(<%=i%>)"
								onmouseout="hideInfoSpan(<%=i%>)" style="visibility: visible;">
								<icon class="icon-info-sign icon-white"></icon> </span> <span
								class="pic-share-span padding-mini badge"
								style="visibility: visible;"> <icon
									class="icon-share icon-white"></icon> </span>
						</div>
					</div>
				</li>
				<%
					}
					}
				%>
			</ul>
		</div>
	</div>

	<div class="pagination pagination-centered">
		<ul>
			<%
				if (currentPage != 1) {
			%>
			<li><a
				href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/<%=currentPage - 1%>">上一页</a>
			</li>
			<%
				}
				int i = 1;
				if (totalPage > 7) {
					i = currentPage;
				}
				for (; i < totalPage + 1; i++) {
					int count = 1;
					if (count > 7) {
			%>
			<li class="disabled"><a href="#">...</a></li>
			<%
				count++;
					} else {
			%>
			<li <%if (i == currentPage) {%> class="active" <%}%>><a
				href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/<%=i%>"><%=i%></a>
			</li>
			<%
				}
				}
				if (currentPage != totalPage) {
			%>
			<li><a
				href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary/<%=currentPage + 1%>">下一页</a>
			</li>
			<%
				}
			%>
		</ul>
	</div>

	<!-- 底部 -->
	<jsp:include page="/jsp/common/bottom.jsp" flush="true" />
</body>
</html>