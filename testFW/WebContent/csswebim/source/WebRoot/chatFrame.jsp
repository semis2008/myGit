<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IM Chat</title>
<meta http-equiv="author" content="hoojo">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/org/cometd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/org/cometd/AckExtension.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/org/cometd/ReloadExtension.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/jquery/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/jquery/jquery.cometd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/csswebim/jquery/jquery.cometd-reload.js"></script>
<script type="text/javascript" src="csswebim/js/send.message.editor-1.0.js"></script>
<script type="text/javascript" src="csswebim/js/local.chat-2.0.js"></script>
<script type="text/javascript" src="csswebim/jquery/jquery.treeview.js"></script>
<script type="text/javascript" src="csswebim/jquery/jquery.treeview.async.js"></script>
<script type="text/javascript" src="csswebim/jquery/jquery.treeview.edit.js"></script>
<script type="text/javascript" src="csswebim/js/application.js"></script>	
<script src="csswebim/jquery/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="csswebim/css/chat.css" />
<link rel="stylesheet" type="text/css" href="csswebim/jquery/css/ui.all.css">	
<link rel="stylesheet" type="text/css" href="csswebim/jquery/css/jquery.treeview.css">
<style type="text/css">
    .wp-searchbox input {
        background-color: #FFFFFF;
        background-position: 8px -289px;
        border-color: #AAAAAA;
        border-bottom-left-radius: 12px;
        border-bottom-right-radius: 12px;
        border-bottom-style: solid;
        border-top-color: #AAAAAA;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
        border-top-style: solid;
        border-width: 1px;
        height: 24px;
        line-height: 24px;
        padding-bottom: 0;
        padding-left: 26px;
        padding-top: 0;
		background-image: url("csswebim/images/wp-base-ico.png");
		background-repeat: no-repeat;
		margin-left: 10px;
		margin-top: 10px;
		margin-right: 10px;
     }

</style>
<script type="text/javascript">
	var i = 1;
	var maxZindex = 1;
	var config = {
			contextPath: '<%=request.getContextPath()%>'
	};
	$(function() {
		
		$("#webpager_friend_search")
				.bind('keyup',function() {
							if ($('#webpager_friend_search').val() == "") {
								$('#tree').show();
								$('#queryTree').hide();
							} else {
								$('#tree').hide();
								$('#queryTree').show();
								var newnodes = $(
										"<li><span class='folder'>New Sublist</span><ul>"
												+ "<li><span class='file'>"
												+ $('#webpager_friend_search')
														.val()
												+ "</span></li>"
												+ "<li><span class='file'>Item2</span></li></ul></li>")
										.appendTo("#tree");
								$("#queryTree").html(newnodes);
								$("#queryTree").treeview();
							}
						});
		$("li .row_leaf").live('click',function(event) {
					event.stopPropagation();
					var docs = [];
    	            $.each($("iframe[name^='receiveMessage" + $(event.currentTarget).attr("id") + "']"), function(){
    	                docs.push($(this.contentWindow.document));
    	            });
    	            $(docs).each(function(k,v){
    	            	v.show();
    	            });
    	            if(docs.length != 0){
    	            	return;
    	            } 
					$.WebIM({
						sender : user,
						receiver : $(event.currentTarget).attr("id"),
						userJID : $(event.currentTarget).attr("id") + "_" + new Date().getTime(),
						sendHandler : function($chatMain) {
							var doc = $chatMain.find("iframe[name^='sendMessage']").get(0).contentWindow.document;
				            var content = doc.body.innerHTML;
				            content = $.trim(content);
				            content = content.replace(new RegExp("<br>", "gm"), "");
				            var styleTpl = $.IM.defaultOptions.sendMessageStyle.getStyleTpl();
				            content = ["<span style='", styleTpl, "'>", content, "</span>"].join("");
				            if(content){
				            	var sender = $chatMain.attr("sender");
				                var receiverId = $chatMain.attr("receiver");
				                
								if(!$.cometd.isDisconnected()){
									$.cometd.publish('/service/privatechat', { senderId:sender ,receiverIds:[receiverId],content:content,'class': 'com.css.webim.message.ChatMessage'});
								}
						 		$.IM.defaultOptions.writeReceiveMessage(receiverId, sender, content,false);
				            }
					 		$(doc).find("body").html("");
						}
					});
					$(".chat-main").show(800);
					$(".chat-main").draggable({
						start : function(event, ui) {
							event.stopPropagation();
							$(event.currentTarget).css("z-index", ++maxZindex);
						}
					}); 
					return false;
				});
		$("li .row_leaf").live('mouseover',function (event){
			event.stopPropagation();
			$(event.currentTarget).addClass('row_mouse_over');
		});
		$("li .row_leaf").live('mouseout',function (event){
			event.stopPropagation();
			$(event.currentTarget).removeClass('row_mouse_over');
		});
		$("#tree").treeview({
			url : "chat?method=UserTreeControl"
		});
		
		//$("#tree").shake(20,10,4000);
	});
</script>
</head>
<body>
	<div id="body"></div>
	<div id='joinPar'>
		<input type="text" id="join" height="300px" width="300px"> <input
			type="button" id="joinBtn" value="握手">
	</div>
	<div style="border: solid 2px #94CADF; width: 200px; height: 600px">
		<div class="wp-searchbox">
			<form  action="#" method="post">
				<input id="webpager_friend_search" type="text" style="color: rgb(136, 136, 136); width: 140px">
			</form>
		</div>
		<div id="tree"></div>
		<div id="queryTree"></div>
	</div>
</body>
</html>