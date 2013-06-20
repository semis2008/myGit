;
(function($){
	
    if (/1\.(0|1|2)\.(0|1|2)/.test($.fn.jquery) || /^1.1/.test($.fn.jquery)) {
        alert('WebIM requires jQuery v1.2.3 or later!  You are using v' + $.fn.jquery);
        return;
    }
    var _im = $.IM = {};
    _im.version = 2.0;
    var faceTimed, count = 0;
    _im.defaultOptions = {
        chat: "#chat",
        chatEl: function(){
            var $chat = _im.defaultOptions.chat;
            if ((typeof _im.defaultOptions.chat) == "string") {
                $chat = $(_im.defaultOptions.chat);
            }
            else 
                if ((typeof _im.defaultOptions.chat) == "object") {
                    if (!$chat.get(0)) {
                        $chat = $($chat);
                    }
                }
            return $chat;
        },
        sendMessageIFrame: function(receiverId){
            return $("iframe[name='sendMessage" + receiverId + "']").get(0).contentWindow;
        },
        receiveMessageDoc: function(receiverId){
            receiverId = receiverId || "";
            var docs = [];
            $.each($("iframe[name^='receiveMessage" + receiverId + "']"), function(){
                docs.push($(this.contentWindow.document));
            });
            return docs;
            //return $($("iframe[name^='receiveMessage" + receiverId + "']").get(0).contentWindow.document);       
        },
        sender: "", // 发送者       
        receiver: "", // 接收者      
        setTitle: function(chatEl){
            var receiver = this.getReceiver(chatEl);
            chatEl.find(".title").html("和" + receiver + "聊天对话中");
        },
        getReceiver: function(chatEl){
            var receiver = chatEl.attr("receiver");
            if (~ receiver.indexOf("@")) {
                receiver = receiver.split("@")[0];
            }
            return receiver;
        },
        // 接收消息iframe样式     
        receiveStyle: ['<html>', '<head><style type="text/css">', 'body{border:0;margin:0;padding:3px;height:98%;cursor:text;background-color:white;font-size:12px;font-family:Courier,serif,monospace;}', '.msg{margin-left: 1em;}p{margin:0;padding:0;}.me{color: blue;}.you{color:green;}', '</style></head>', '<body></body>', '</html>'].join(""),
        writeReceiveStyle: function(receiverId){
            this.receiveMessageDoc(receiverId)[0].get(0).write(this.receiveStyle);
        },
        /***         * 发送消息的格式模板                             * flag = true 表示当前user是自己，否则就是对方         **/
        receiveMessageTpl: function(userName, styleTpl, content, flag,datetime){
            var userCls = flag ? "me" : "you";
            // 设置当前发送日前          
            if(!datetime){
            	var date = new Date();
            	datetime = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate();
            	datetime = " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            }
            if (styleTpl && flag) {
                content = ["<span style='", styleTpl, "'>", content, "</span>"].join("");
            }
            return ['<p class="', userCls, '">', datetime, '  ', userName, ':</p>', '<p class="msg">', content, '</p>'].join("");
        },
        // 工具类按钮触发事件返回html模板       
        sendMessageStyle: {
            cssStyle: {
                bold: "font-weight: bold;",
                underline: "text-decoration: underline;",
                italic: "font-style: oblique;"
            },
            setStyle: function(style, val){
                if (val) {
                    _im.defaultOptions.sendMessageStyle[style] = val;
                }
                else {
                    var styleVal = _im.defaultOptions.sendMessageStyle[style];
                    if (styleVal === undefined || !styleVal) {
                        _im.defaultOptions.sendMessageStyle[style] = true;
                    }
                    else {
                        _im.defaultOptions.sendMessageStyle[style] = false;
                    }
                }
            },
            getStyleTpl: function(){
                var tpl = "";
                $.each(_im.defaultOptions.sendMessageStyle, function(style, item){ 
				//alert(style + "#" + item + "#" + (typeof item));      
                    if (item === true) {
                        tpl += _im.defaultOptions.sendMessageStyle.cssStyle[style];
                    }
                    else 
                        if ((typeof item) === "string") {
                            //alert(style + "-------------" + sendMessageStyle[style]);     
                            tpl += style + ":" + item + ";";
                        }
                });
                return tpl;
            }
        },
        // 向接收消息iframe区域写消息     
        writeReceiveMessage: function(receiverId, userName, content, flag,datetime){
            if (content) {
                var styleTpl = _im.defaultOptions.sendMessageStyle.getStyleTpl();
                var receiveMessageDoc = _im.defaultOptions.receiveMessageDoc(receiverId);
                $.each(receiveMessageDoc, function(){
                    var $body = this.find("body");
                    // 向接收信息区域写入发送的数据                 
                    $body.append(_im.defaultOptions.receiveMessageTpl(userName, styleTpl, content, flag,datetime));
                    // 滚动条滚到底部     
                    this.scrollTop(this.height());
                });
            }
        },
        // 发送消息        
        sendHandler: function($chatMain){
            var doc = $chatMain.find("iframe[name^='sendMessage']").get(0).contentWindow.document;
            var content = doc.body.innerHTML;
            content = $.trim(content);
            content = content.replace(new RegExp("<br>", "gm"), "");
            // 获取即将发送的内容            
            if (content) {
                var sender = $chatMain.attr("sender");
                var receiverId = $chatMain.attr("receiver");
                // 接收区域写消息              
                _im.defaultOptions.writeReceiveMessage(receiverId, sender, content, true); //############# XXX                
                var receiver = $chatMain.find("#to").val();
                //var receiver = $chatMain.attr("receiver");             
                // 判断是否是手机端会话，如果是就发送纯text，否则就发送html代码      
                var flag = _im.defaultOptions.isMobileClient(receiver);
                if (flag) {
                    var text = $(doc.body).text();
                    text = $.trim(text);
                    if (text) {
                        // 远程发送消息                        //remote.jsjac.chat.sendMessage(text, receiver);     
                    }
                }
                else {
                    // 非手机端通信 可以发送html代码       
                    var styleTpl = _im.defaultOptions.sendMessageStyle.getStyleTpl();
                    content = ["<span style='", styleTpl, "'>", content, "</span>"].join("");
                    //remote.jsjac.chat.sendMessage(content, receiver);       
                }
                // 清空发送区域               
                $(doc).find("body").html("");
            }
        },
        faceImagePath: "csswebim/images/faces/",
        faceElTpl: function(i){
            return ["<img src='", this.faceImagePath, (i - 1), ".gif' gif='", this.faceImagePath, (i - 1), ".gif'/>"].join("");
        },
        // 创建表情html elements       
        createFaceElement: function($chat){
            var faces = [];
            for (var i = 2; i < 100; i++) {
                faces.push(this.faceElTpl(i));
                if (i % 11 == 0) {
                    faces.push("<br/>");
                }
            }
            $chat.find("#face").html(faces.join(""));
            this.faceHandler($chat);
        },
        // 插入表情      
        faceHandler: function($chat){
            $chat.find("#face img").click(function(){
                $chat.find("#face").hide(150);
                var imgEL = "<img src='" + $(this).attr("gif") + "'/>";
                var $chatMain = $(this).parents(".chat-main");
                var win = $chatMain.find("iframe[name^='sendMessage']").get(0).contentWindow;
                var doc = win.document;
                sendMessageEditor.insertAtCursor(imgEL, doc, win);
            });
            // 表情隐藏           
            $chat.find("#face, #face img").mouseover(function(){
                window.clearTimeout(faceTimed);
            }).mouseout(function(){
                window.clearTimeout(faceTimed);
                faceTimed = window.setTimeout(function(){
                    $chat.find("#face").hide(150);
                }, 700);
            });
        }, /***         * 发送消息工具栏按钮事件方法         **/
        toolBarHandler: function(){
            var $chat = $(this).parents(".chat-main");
            var targetCls = $(this).attr("class");
            if (targetCls == "face") {
                $chat.find("#face").show(150);
                window.clearTimeout(faceTimed);
                faceTimed = window.setTimeout(function(){
                    $chat.find("#face").hide(150);
                }, 1000);
            }
            else 
                if (this.tagName == "DIV") {
                    _im.defaultOptions.sendMessageStyle.setStyle(targetCls);
                }
                else 
                    if (this.tagName == "SELECT") {
                        _im.defaultOptions.sendMessageStyle.setStyle($(this).attr("name"), $(this).val());
                        if ($(this).attr("name") == "color") {
                            $(this).css("background-color", $(this).val());
                        }
                    }
            // 设置sendMessage iframe的style css          
            _im.defaultOptions.writeSendStyle();
        },
        // 设置sendMessage iframe的style css       
        writeSendStyle: function(){
            var styleTpl = _im.defaultOptions.sendMessageStyle.getStyleTpl();
            var styleEL = ['<style type="text/css">body{', styleTpl, '}</style>'].join("");
            $("body").find("iframe[name^='sendMessage']").each(function(){
                var $head = $(this.contentWindow.document).find("head");
                if ($head.find("style").size() > 1) {
                    $head.find("style:gt(0)").remove();
                }
                if (styleTpl) {
                    $head.append(styleEL);
                }
            });
        },
        isMobileClient: function(receiver){
            return false;
        },
        chatLayoutTemplate: function(userJID, sender, receiver, product, flag){
            var display = "";
            if (flag) {
                display = "style='display: none;'";
            }
            return ['<div class="chat-main" id="', userJID, '" sender="', sender, '" receiver="', receiver, '">',           
            '<div id="chat"><div class="radius">',
			'<table>', '<tr>', '<td colspan="3" class="title"></td>',
			'</tr>', '<tr>', '<td class="receive-message">', 
			'<iframe name="receiveMessage', userJID, '" frameborder="0" width="100%" height="100%"></iframe>',
			 '</td>', '<td rowspan="4" class="split" ', display, '>&nbsp;</td>', 
			 '<td rowspan="4" class="product-info" ', display, '>', '<ul>', 
			 '<div class="header">&nbsp;</div>', '<li class="pic">',
			  '<img src="', product.pic, '"/></li>', '<li class="product-name">', product.name, '</li>', 
			  '<li class="price"><span>', product.price, '</span></li>',
			   '<li class="market-price"><s><i>', product.marketPrice, '</i></s></li>', '<li>', product.deliverOrgs, '</li>', '<li>', product.wareHouses, '</li>', product.skuAttrs, '</ul>', '</td>', '</tr>', '<tr class="tool-bar">', '<td>', '<select name="font-family" class="family">', '<option>宋体</option>', '<option>黑体</option>', '<option>幼圆</option>', '<option>华文行楷</option>', '<option>华文楷体</option>', '<option>华文楷体</option>', '<option>华文彩云</option>', '<option>华文隶书</option>', '<option>微软雅黑</option>', '<option>Fixedsys</option>', '</select>', '<select name="font-size">', '<option value="12px">大小</option>', '<option value="10px">10</option>', '<option value="12px">12</option>', '<option value="14px">14</option>', '<option value="16px">16</option>', '<option value="18px">18</option>', '<option value="20px">20</option>', '<option value="24px">24</option>', '<option value="28px">28</option>', '<option value="36px">36</option>', '<option value="42px">42</option>', '<option value="52px">52</option>', '</select>', '<select name="color">', '<option value="" selected="selected">颜色</option>', '<option value="#000000" style="background-color:#000000"></option>', '<option value="#FFFFFF" style="background-color:#FFFFFF"></option>', '<option value="#008000" style="background-color:#008000"></option>', '<option value="#800000" style="background-color:#800000"></option>', '<option value="#808000" style="background-color:#808000"></option>', '<option value="#000080" style="background-color:#000080"></option>', '<option value="#800080" style="background-color:#800080"></option>', '<option value="#808080" style="background-color:#808080"></option>', '<option value="#FFFF00" style="background-color:#FFFF00"></option>', '<option value="#00FF00" style="background-color:#00FF00"></option>', '<option value="#00FFFF" style="background-color:#00FFFF"></option>', '<option value="#FF00FF" style="background-color:#FF00FF"></option>', '<option value="#FF0000" style="background-color:#FF0000"></option>', '<option value="#0000FF" style="background-color:#0000FF"></option>', '<option value="#008080" style="background-color:#008080"></option>', '</select>', '<div class="bold"></div>', '<div class="underline"></div>', '<div class="italic"></div>', '<div class="face"></div>', '<div class="history">消息记录</div>', '</td>', '</tr>', '<tr class="send-message">', '<td>', '<iframe name="sendMessage', userJID, '" width="100%" height="80px" frameborder="0"></iframe>', '</td>', '</tr>', '<tr class="bottom-bar">', '<td><input type="text" id="to" name="to" value="hoojo" style="width: 100px; display: none;"/><input type="button" value="关闭" id="close"/>&nbsp;', '<input type="button" value="发送(Enter)" id="send"/> </td>', '</tr>', '</table></div>', '<div id="face"></div>', '</div>', '</div>'].join("");
        },
        initWebIM: function(userJID, receiver){
            var product = {
                

            };
            var chatEl = $(_im.defaultOptions.chatLayoutTemplate(userJID, _im.defaultOptions.sender, receiver, product));
            $("body").append(chatEl); // 拖拽           
            //$("#" + userJID).easydrag();            
			// 初始化sendMessageEditor相关信息         
            sendMessageEditor.iframe = this.sendMessageIFrame(userJID);
            sendMessageEditor.init(userJID);
            this.setTitle(chatEl);
            this.writeReceiveStyle(userJID);
            this.writeSendStyle();
            this.createFaceElement(chatEl);
            // 查看更多详情           
            chatEl.find(".more").click(function(){
                var $ul = $(this).parents("ul");
                $ul.find(".more").toggle();
                $ul.find(".info").toggle();
                $ul.find(".pic").toggle();
            });
            // 收缩详情          
            chatEl.find(".split").toggle(function(){
                $(".product-info").hide();
                $(this).parents(".radius").css("border-right-width", "0");
            }, function(){
                $(".product-info").show();
                $(this).parents(".radius").css("border-right-width", "8px");
            });
            // 工具类绑定事件 settings.toolBarHandler            
            chatEl.find(".tool-bar td").children().click(this.toolBarHandler);
            chatEl.find("#send").click(function(){
                var $chatMain = $(this).parents(".chat-main");
                _im.defaultOptions.sendHandler($chatMain);
            });
            chatEl.find("#close").click(function(){
                var $chatMain = $(this).parents(".chat-main");
                $chatMain.remove();
            });
            $(this.sendMessageIFrame(userJID).document).keyup(function(event){
                var e = event || window.event;
                var keyCode = e.which || e.keyCode;
                if (keyCode == 13) {
                    var $chatMain = $("#" + $(this).find("body").attr("jid"));
                    _im.defaultOptions.sendHandler($chatMain);
                }
            });
        },
        // 取消闪动提示        
        cancelFlashTip: function(jid){
            var $chat = $(".chat-main[id='" + jid + "']:hidden");
            if ($chat.get(0)) {
                $chat.show();
            }
            //$chatMessage.removeAttr("jid");       
            if ($(".chat-main:hidden").size() == 0) {
                $(".have-msg").hide();
                $(".no-msg").show();
            }
        },
        // 消息提示       
        messageTip: function(){
            if (count % 2 == 0) {
                window.focus();
                document.title = "你来了新消息，请查收！";
            }
            else {
                document.title = "";
            }
            if (count > 4) {
                document.title = "";
                count = 0;
            }
            else {
                window.setTimeout(_im.defaultOptions.messageTip, 1000);
                count++;
            }
        }
    };
    $.extend({
        WebIM: function(opts){
            opts = opts || {};
            // 覆盖默认配置          
            _im.defaultOptions = $.extend(_im.defaultOptions, _im.defaultOptions, opts);
            var settings = $.extend({}, _im.defaultOptions, opts);
            settings.initWebIM(settings.userJID, settings.receiver);
        }
    });
})(jQuery);
