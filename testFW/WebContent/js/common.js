function regist() {
		$.ajax({
			type : "POST",
			url : "/action/user/regist",
			dataType:"text",
			success : function(msg) {
				$("#showMsg").text(msg);
			}
		});
}
function login() {
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
function login() {
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