$(document).ready(function(){
	$('.liketag').click(function(){
		var action;
		var link = $(this);
		if($(link).hasClass('liked')){
			action = 'dislike';
		}
		else{
			action = 'like';
		}
		$.get($(this).attr('href')+'&action='+action,function(data){
			if(data == 'success'){
				var likecount = $(link).children('span.likecount').text();			
				if(action == 'like'){
					$(link).children('span.likecount').text(parseInt(likecount)+1);	
					$(link).addClass('liked');	
				}
				else{
					$(link).children('span.likecount').text(parseInt(likecount)-1);	
					$(link).removeClass('liked');
				}
			}
		});
		return false;
	});
});