<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.testFW.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/css/bootstrap.css"  rel="stylesheet"/>
<link href="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/css/bootstrap-responsive.css"  rel="stylesheet"/>

<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/plugin/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		/* 随机背景 */
		var bg_num = Math.ceil(Math.random() * 5 + 1);
		$("#banner-head").addClass("hero-unit0" + bg_num);

	});

	function userQuit() {
		$.ajax({
			type : "POST",
			url : "/action/user/userquit",
			dataType : "text",
			success : function(msg) {
				location.reload();
			}
		});
	}
</script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a data-target=".nav-collapse" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> </a>
					
			 <a class="brand" href="<%=ConstantsUtil.FW_DOMAIN%>">&nbsp;&nbsp;&nbsp;&nbsp;WNJava&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<div class="nav-collapse collapse navbar-responsive-collapse">
					<ul class="nav">
						<li class="active"><a href="<%=ConstantsUtil.FW_DOMAIN%>"><i
								class="icon-home icon-white"></i> 首页</a>
						</li>
						<li><a
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary"><i
								class="icon-edit icon-white"></i> 日志</a>
						</li>
						<li><a
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"><i
								class="icon-picture icon-white"></i> 图册</a>
						</li>
						<li><a
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus"><i
								class="icon-home icon-white"></i> 关于</a>
						</li>
					</ul>
					<ul class="nav pull-right">
						<li><a href="#" data-toggle="modal"
							data-target="#registModal" data-keyboard="true"
							data-backdrop="true"><i class="icon-plus-sign icon-white"></i>
								注册</a></li>
						<li><a href="#" data-toggle="modal" data-target="#loginModal"
							data-keyboard="true" data-backdrop="true"><i
								class="icon-ok icon-white"></i> 登陆</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">偷懒的熊 <b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon-home icon-black"></i>
										个人主页</a></li>
								<li><a href="#"><i class="icon-edit icon-black"></i>
										日志：0篇</a></li>
								<li><a href="#"><i class="icon-picture icon-black"></i>
										图册：2个</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="icon-off icon-black"></i> 注销</a>
								</li>
							</ul>
						</li>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 弹出对话框 -->
	<!-- 登录 -->
	<div class="modal hide fade" id="loginModal">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>
				<span class="label label-info"><i
					class="icon-user icon-white"></i>欢迎您登录WNJava,开始轻松之旅~</span>
			</h3>
		</div>
		<div class="modal-body">
			<form class="well form-inline">
				<input type="text" class="input-medium" placeholder="帐号" /> <input
					type="password" class="input-medium" placeholder="密码" /> <label
					class="checkbox"> <input type="checkbox" /> 记住我 </label>
				<button type="submit" class="btn btn-primary">登录</button>
			</form>
		</div>
	</div>
	<!-- 注册 -->
	<div class="modal hide fade" id="registModal">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>
				<span class="label label-info offset1"><i
					class="icon-plus icon-white"></i>欢迎您注册WNJava，马上开始吧~</span>
			</h3>
		</div>
		<div class="modal-body span7">
			<form class="form-horizontal">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">您的尊姓大名</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i> </span><input
									type="text" size="16" id="input01" />
							</div>
							<p class="help-block">字母，数字，汉字皆可</p>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="input02">您的Email</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i> </span><input
									type="text" size="16" id="input02" />
							</div>
							<p class="help-block">邮箱将直接作为您登录的帐号哦</p>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input03">您要使用的密码</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-asterisk"></i> </span><input
									type="text" size="16" id="input03" />
							</div>
							<p class="help-block">字母，数字皆可</p>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input04">请再输入一次密码</label>
						<div class="controls">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-asterisk"></i> </span><input
									type="password" size="16" id="input04" />
							</div>
							<p class="help-block">两次密码输入必须一致</p>
						</div>
					</div>
					<div class="control-group">
						<button class="btn btn-primary offset1" type="submit">确认注册</button>
						<button class="btn">取消</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<header class="no-radius" id="banner-head">
	<div class="container text-center">
		<h1>
			<img alt="WN Java" src="<%=ConstantsUtil.FW_DOMAIN%>/img/logo.png">
		</h1>
	</div>
	</header>
</body>
</html>