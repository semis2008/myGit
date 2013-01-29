<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String hasNext = (String) request.getParameter("hasNext");
	String hasPre = (String) request.getParameter("hasPre");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<style rel="stylesheet" type="text/css">
.m-floatBar {
	bottom: 150px;
	height: 45px;
	position: fixed;
	right: 0;
	width: 149px;
}

.m-floatBar ul {
	position: relative;
}

element.style {
	right: -45px;
}

.m-floatBar .m-top-spacial {
	background: url("/img/common/top0.png") no-repeat scroll 0 0 transparent;
	cursor: pointer;
	height: 45px;
	position: absolute;
	right: -45px;
	transition-property: right;
	width: 45px;
	z-index: 10;
}

.f-trans {
	transition-duration: 0.2s;
	transition-property: all;
	transition-timing-function: linear;
	cursor: pointer;
}

.m-floatBar .m-front {
	background: url("/img/common/next0.png") no-repeat scroll 0 0
		transparent;
	cursor: pointer;
	height: 45px;
	position: absolute;
	right: -45px;
	top: 0;
	transition-duration: 0.4s;
	transition-property: right;
	width: 45px;
	z-index: 8;
}

.m-floatBar .m-back {
	background: url("/img/common/prev0.png") no-repeat scroll 0 0
		transparent;
	cursor: pointer;
	height: 45px;
	position: absolute;
	right: -45px;
	transition-duration: 0.6s;
	transition-property: right;
	width: 45px;
	z-index: 6;
}
</style>
<script type="text/javascript
	$(window).scroll(function() {
		var t = $(document).scrollTop();
		if (t >= 300) {
			showGoToTop();
		} else {
			hideGoToTop();
		}
	});
	function showGoToTop() {
		$("#J-goToTop").css("right", "22px");
		$("#J-nextGroup").css("right", "87px");
		$("#J-preGroup").css("right", "152px");
	}
	function hideGoToTop() {
		$("#J-goToTop").css("right", "-45px");
		$("#J-nextGroup").css("right", "20px");
		$("#J-preGroup").css("right", "85px");
	}
	function goToTop() {
		$('body,html').animate({
			scrollTop : 0
		}, 1000);
	}

</script>
<div>
	<div class="m-floatBar">
		<ul>
			<li id="J-goToTop" title="返回顶部" onclick="goToTop()"
				class="m-top-spacial f-trans" style="right: -45px;"></li>
			<%
				if ("yes".equals(hasNext)) {
			%>
			<li id="J-nextGroup" title="下一页" class="m-front f-trans"
				style="z-index: 10; right: 20px;"></li>
			<%
				}
			%>
			<%
				if ("yes".equals(hasPre)) {
			%>
			<li id="J-preGroup" title="上一页" class="m-back f-trans"
				style="z-index: 10; right: 85px;"></li>
			<%
				}
			%>
		</ul>
	</div>
</div>