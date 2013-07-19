<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.util.UserUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testFW.bo.DiaryReplyBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.testFW.util.DateUtil"%>
<%@page import="com.testFW.bo.DiaryBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page import="com.testFW.bo.UserBO"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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


<link href="/css/newDiary.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/plugin/editor/editor.js"></script>

<script language="javascript" type="text/javascript">
	$('.editor').wysiwyg();
</script>
<title>wnJava--写日志</title>
</head>
<body>
	<div class="bookmark">
		<ul class="breadcrumb">
			<li><a href="<%=ConstantsUtil.FW_DOMAIN%>">首页</a> <span
				class="divider">/</span>
			</li>
			<li><a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary">日志</a>
				<span class="divider">/</span>
			</li>
			<li class="active">写日志</li>
		</ul>
	</div>
	<div class="container">
		<div class="span10 offset1 padding-small">
			<div class="btn-toolbar" data-role="editor-toolbar"
				data-target="#editor">
				<div class="btn-group">
					<a class="btn dropdown-toggle" data-toggle="dropdown" title="字体"
						data-original-title="Font"><i class="icon-font"></i><b
						class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a data-edit="fontName Micro YAHEI"
							style="font-family: 'Micro YAHEI'">微软雅黑</a></li>
						<li><a data-edit="fontName 楷体" style="font-family: '楷体'">楷体</a>
						</li>
						<li><a data-edit="fontName 黑体" style="font-family: '黑体'">黑体</a>
						</li>
						<li><a data-edit="fontName Serif"
							style="font-family: 'Serif'">Serif</a></li>
						<li><a data-edit="fontName Sans" style="font-family: 'Sans'">Sans</a>
						</li>
						<li><a data-edit="fontName Arial"
							style="font-family: 'Arial'">Arial</a></li>
						<li><a data-edit="fontName Comic Sans MS"
							style="font-family: 'Comic Sans MS'">Comic Sans MS</a></li>
						<li><a data-edit="fontName Helvetica"
							style="font-family: 'Helvetica'">Helvetica</a></li>
						<li><a data-edit="fontName Times New Roman"
							style="font-family: 'Times New Roman'">Times New Roman</a></li>
						<li><a data-edit="fontName Verdana"
							style="font-family: 'Verdana'">Verdana</a></li>
					</ul>
				</div>
				<div class="btn-group">
					<a class="btn dropdown-toggle" data-toggle="dropdown" title="字体大小"
						data-original-title="Font Size"><i class="icon-text-height"></i>&nbsp;<b
						class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a data-edit="fontSize 5"><font size="5">Huge</font>
						</a></li>
						<li><a data-edit="fontSize 3"><font size="3">Normal</font>
						</a></li>
						<li><a data-edit="fontSize 1"><font size="1">Small</font>
						</a></li>
					</ul>
				</div>
				<div class="btn-group">
					<a class="btn" data-edit="bold" title="粗体"
						data-original-title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i>
					</a> <a class="btn" data-edit="italic" title="斜体"
						data-original-title="Italic (Ctrl/Cmd+I)"><i
						class="icon-italic"></i> </a> <a class="btn" data-edit="strikethrough"
						title="" data-original-title="Strikethrough"><i
						class="icon-strikethrough"></i> </a> <a class="btn"
						data-edit="underline" title="下划线"
						data-original-title="Underline (Ctrl/Cmd+U)"><i
						class="icon-underline"></i> </a>
				</div>
				<div class="btn-group">
					<a class="btn" data-edit="insertunorderedlist" title=""
						data-original-title="Bullet list"><i class="icon-list-ul"></i>
					</a> <a class="btn" data-edit="insertorderedlist" title=""
						data-original-title="Number list"><i class="icon-list-ol"></i>
					</a> <a class="btn" data-edit="outdent" title=""
						data-original-title="Reduce indent (Shift+Tab)"><i
						class="icon-indent-left"></i> </a> <a class="btn" data-edit="indent"
						title="" data-original-title="Indent (Tab)"><i
						class="icon-indent-right"></i> </a>
				</div>
				<div class="btn-group">
					<a class="btn btn-info" data-edit="justifyleft" title=""
						data-original-title="Align Left (Ctrl/Cmd+L)"><i
						class="icon-align-left"></i> </a> <a class="btn"
						data-edit="justifycenter" title=""
						data-original-title="Center (Ctrl/Cmd+E)"><i
						class="icon-align-center"></i> </a> <a class="btn"
						data-edit="justifyright" title=""
						data-original-title="Align Right (Ctrl/Cmd+R)"><i
						class="icon-align-right"></i> </a> <a class="btn"
						data-edit="justifyfull" title=""
						data-original-title="Justify (Ctrl/Cmd+J)"><i
						class="icon-align-justify"></i> </a>
				</div>
				<div class="btn-group">
					<a class="btn dropdown-toggle" data-toggle="dropdown" title=""
						data-original-title="Hyperlink"><i class="icon-link"></i> </a>
					<div class="dropdown-menu input-append">
						<input class="span2" placeholder="URL" type="text"
							data-edit="createLink">
							<button class="btn" type="button">Add</button>
					</div>
					<a class="btn" data-edit="unlink" title=""
						data-original-title="Remove Hyperlink"><i class="icon-cut"></i>
					</a>

				</div>

				<div class="btn-group">
					<a class="btn" title="" id="pictureBtn"
						data-original-title="Insert picture (or just drag &amp; drop)"><i
						class="icon-picture"></i> </a> <input type="file"
						data-role="magic-overlay" data-target="#pictureBtn"
						data-edit="insertImage"
						style="opacity: 0; position: absolute; top: 0px; left: 0px; width: 41px; height: 30px;">
				</div>
				<div class="btn-group">
					<a class="btn" data-edit="undo" title=""
						data-original-title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i>
					</a> <a class="btn" data-edit="redo" title=""
						data-original-title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i>
					</a>
				</div>
				<input type="text" data-edit="inserttext" id="voiceBtn"
					x-webkit-speech="" style="display: none;">
			</div>

			<div class="editor" id="editor" contenteditable="true">Go
				ahead…</div>
		</div>
	</div>

	<!-- 底部 -->
	<jsp:include page="/jsp/common/bottom.jsp" flush="true" />
</body>
</html>