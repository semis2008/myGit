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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 网站公用顶部 -->
<jsp:include page="/jsp/common/head.jsp" flush="true">
	<jsp:param value="<%=hasLogin %>" name="hasLogin" />
	<jsp:param value="<%=user.getName() %>" name="userName" />
	<jsp:param value="<%=user.getId() %>" name="userId" />
</jsp:include>
<link href="/css/picturePage.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript">
	$(function() {

	});
</script>
<title>图册</title>
</head>
<body>
	<div class="bookmark">
		<ul class="breadcrumb">
			<li><a href="<%=ConstantsUtil.FW_DOMAIN%>">首页</a> <span
				class="divider">/</span></li>
			<li class="active">图册</li>
		</ul>
	</div>
	<div class="container padding-middle">
		<ul class="thumbnails">
			<li class="span3 panel">
				<div class="thumbnail">
					<img data-src="holder.js/300x200" class="scrollLoading img-rounded" alt=""
						data-url="<%=imgPath%>1_1.jpg" />
					<h3>【风景】</h3>
					<p class="alert alert-info">这是一组风景图册，记录了旅行途中的景色。</p>
					<button class="reply-btn btn-block btn btn-mini btn-info"
						onclick="location.href='<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture/1'">
						查看详情
						<icon class="icon-list icon-white"></icon>
					</button>
				</div>
			</li>
			<li class="span3 panel">
				<div class="thumbnail">
					<img data-src="holder.js/300x200" class="scrollLoading img-rounded" alt=""
						data-url="<%=imgPath%>2_1.jpg" />
					<h3>【我自己】</h3>
					<p class="alert alert-info">我自己相关的照片~</p>
					<button class="reply-btn btn-block btn btn-mini btn-info"
						onclick="location.href='<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture/1'">
						查看详情
						<icon class="icon-list icon-white"></icon>
					</button>
				</div>
			</li>
		</ul>
	</div>
	<!-- 底部 -->
	<jsp:include page="/jsp/common/bottom.jsp" flush="true" />
</body>
</html>