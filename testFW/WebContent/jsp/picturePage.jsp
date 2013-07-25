<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.testFW.util.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testFW.bo.AlbumBO"%>
<%@page import="java.util.List"%>
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
	String userDiaryNum = "0";
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
		userDiaryNum = (String) request.getAttribute("userDiaryNum");
	}
		
	List<AlbumBO> albums = (List<AlbumBO>)request.getAttribute("albums");
	if(albums == null) {
		albums = new ArrayList<AlbumBO>();
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
	<jsp:param value="<%=userDiaryNum %>" name="userDiaryNum" />
</jsp:include>
<link href="/css/picturePage.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript">
	$(function(
	) {

	});
	</script>
<title>图册</title>
</head>
<body>
	<div class="bookmark">
		<ul class="breadcrumb">
			<li><a href="<%=ConstantsUtil.FW_DOMAIN%>">首页</a> <span
				class="divider">/</span>
			</li>
			<li class="active">图册</li>
		</ul>
	</div>
	<div class="container padding-middle">
		<ul class="thumbnails">
			<% 
				for(AlbumBO album:albums) {
			%>
			<li class="span3 panel">
				<div class="thumbnail">
					<img data-src="holder.js/300x200" class="scrollLoading img-rounded"
						alt="" data-url="<%=ConstantsUtil.FW_DOMAIN%><%=album.getFront_cover() %>" />
					<h3>【<%=album.getTitle() %>】</h3>
					<p class="alert alert-info"><%=StringUtil.cutString(album.getDescription(),40)%></p>
					<button class="reply-btn btn-block btn btn-mini btn-info"
						onclick="location.href='<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture/<%=album.getId() %>'">
						查看详情
						<icon class="icon-list icon-white"></icon>
					</button>
				</div></li>
			<%
				}
			%>
		</ul>
	</div>
	<!-- 底部 -->
	<jsp:include page="/jsp/common/bottom.jsp" flush="true" />
</body>
</html>