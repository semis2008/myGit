
var user = null;
var toUser = null;
(function($)
{
    var cometd = $.cometd;

    $(document).ready(function($)
    {
    			
        function _connectionEstablished()
        {
          /*  $('#body').append('<div>CometD Connection Established</div>');*/
            $("#" + user).removeClass("leaf_unline");
            $("#" + user).addClass("leaf_online");
            $("#" + user).css({"opacity":1});
        }

        function _connectionBroken()
        {
           /* $('#body').append('<div>CometD Connection Broken</div>');*/
        }

        function _connectionClosed()
        {
           /* $('#body').append('<div>CometD Connection Closed</div>');*/
        }

        // Function that manages the connection status with the Bayeux server
        var _connected = false;
        function _metaConnect(message)
        {
            if (cometd.isDisconnected())
            {
                _connected = false;
                _connectionClosed();
                return;
            }

            var wasConnected = _connected;
            _connected = message.successful === true;
            if (!wasConnected && _connected)
            {
                _connectionEstablished();
            }
            else if (wasConnected && !_connected)
            {
                _connectionBroken();
            }
        }

        // Function invoked when first contacting the server and
        // when the server has lost the state of this client
        function _metaHandshake(handshake)
        {
            if (handshake.successful === true)
            {
                cometd.batch(function()
                {
                   /* cometd.subscribe('/hello', function(message)
                    {
                        $('#body').append('<div>Server Says: ' + message.data.greeting + '</div>');
                    });
                    // Publish on a service channel since the message is for the server only
                    cometd.publish('/service/hello', { name: 'World' });*/
                });
            }
        }

        // Disconnect when the page unloads
        $(window).unload(function()
        {
            cometd.disconnect(true);
        });

        var cometURL = location.protocol + "//" + location.host + config.contextPath + "/cometd";
        cometd.configure({
            url: cometURL,
            logLevel: 'debug'
        });

        cometd.addListener('/meta/handshake', _metaHandshake);
        cometd.addListener('/meta/connect', _metaConnect);
        
        $('#joinBtn').click(function() { 
        	
        	if(!_connected){
        		user = $('#join').val();
        		//offline:[{name:"/services/demo",receiveType:{name;batch,groupby:senderId}]
    			$.cometd.handshake({userId:user,type:"client",offline:[{channel:"/service/privatechat",receiveType:{"class":"com.css.webim.BatchOffineMsgProcessor",groupBy:"senderId"}}]});
    			
    			$.cometd.publish("/broadcast/online", {
    				userId: user
    			});
    			
    			$.cometd.publish("/service/selfchat", {
    				chat: "get onlineUsers has joined"
    			});
    			
                
    			$.cometd.addListener('/service/privatechat', function(messages) {
    				$.each(messages.data,function(index,message){
    					var docs = [];
    					$.each($("iframe[name^='receiveMessage" + message.senderId + "']"), function(){
    						docs.push($(this.contentWindow.document));
    					});
    					if(docs.length == 0){
    						$("#" + message.senderId).children().click();
    					}
    					$.IM.defaultOptions.writeReceiveMessage(message.senderId,message.senderId, message.content,false);
    					
    				});
    	            
    			});
    			
    			$.cometd.addListener("/service/selfchat",receive );
    			$.cometd.subscribe("/broadcast/online", receiveOnline);
    			$.cometd.addListener("/broadcast/online", receiveOnline);
    			$.cometd.subscribe("/broadcast/unline", receiveUnline);
    			$.cometd.addListener("/broadcast/unline", receiveUnline);
    			$.cometd.subscribe("/broadcast/publicchat", receive);
    			$.cometd.addListener("/broadcast/publicchat", receive);
    		}
    		
    		$('#joinPar').hide();
        });
        
        function receive(message) {
    		var fromUser = message.data.userId;
    		if(fromUser == null){
    			var fromUsers = message.data.onlineUsers;
    			for(var i=0;i<fromUsers.length;i++){
    				fromUser = fromUsers[i];
    				if(fromUser != user){
    					$("#" + fromUser).addClass("leaf_online");
    					$("#" + fromUser).removeClass("leaf_unline");
    					$("#" + fromUser).css({"opacity":1});
    				}
    			}
    		}else{
    			if(fromUser != user){
    				$("#" + fromUser).addClass("leaf_online");
    				$("#" + fromUser).removeClass("leaf_unline");
    				$("#" + fromUser).css({"opacity":1});
    			}
    		}
    		
    	};
    	
    	function receiveOnline(message) {
    		var fromUser = message.data.userId;
			if(fromUser != user){
				$("#" + fromUser).addClass("leaf_online");
				$("#" + fromUser).removeClass("leaf_unline");
				$("#" + fromUser).css({"opacity":1});
			}
    		
    	};
    	
    	function receiveUnline(message) {
    		var fromUser = message.data.userId;
			if(fromUser != user){
				$("#" + fromUser).removeClass("leaf_online");
				$("#" + fromUser).addClass("leaf_unline");
				$("#" + fromUser).css({"opacity":0.5});
			}
    		
    	};
    	
    	
    });
})(jQuery);
