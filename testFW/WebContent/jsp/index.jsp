<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script>
<script language="javascript" type="text/javascript">
	function showMsg() {
		$.ajax({
			type : "POST",
			url : "/test.do",
			data : {fun:"showMsgAjax"},
			dataType:"text",
			success : function(msg) {
				$("#showMsg").text(msg);
			}
		});
	}
</script>
</head>
<body>
	<div>
		<input type="button" onclick="showMsg()" value="点击获取后台信息"/>
		<span id="showMsg"></span>
		<a href='http://www.testFW.com/action/system/mainpage'>主页</a>
	</div>
</body>
</html>