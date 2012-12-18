<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script>
<script language="javascript" type="text/javascript">


</script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" action="http://www.testFW.com/">
					<input name="s" id="s" value="站内搜索" class="small_search"
						type="text" />
				</form>
			</div>
			<h1>
				<a href="http://www.testFW.com" title="testFW main page"><img
					src="<%=request.getContextPath()%>/img/testfw.jpg" alt="TestFW MainPage" />
				</a>
			</h1>
			<p>
				不因感情,而影响<br>行动;不因得失,而惧怕前行.
			</p>
		</div>
		<div class="container">
			<div class="sidebar">

				<ul class="side_nav">
					<li><a href="http://www.testFW.com/" id="mainpage">主页</a>
					</li>
					<li><a href="http://www.testFW.com/diary/" id="diary">日志</a>
					</li>
					<li><a href="http://www.testFW.com/picture"
						id="picture">图册</a>
					</li>
					<li><a href="http://www.testFW.com/"
						id="aboutus">about</a>
					</li>
				</ul>

			</div>
			<div class="main_wrap">
				<div class="main">
	            </div>
			</div>
		</div>
	</div>
</body>
</html>