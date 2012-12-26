$().ready(function() {
	$('.dv1').Drags({
		handler: '.handler',
		onMove: function(e) {
			$('.content').html('current pos:(Left:' + e.pageX + ' ,Top:' + e.pageY + ')');
		},
		onDrop: function(e){
			$('.content').html('box dropped! <br />current pos:(Left:<strong>' + e.pageX + '</strong> ,Top:<strong>' + e.pageY + '</strong>)');
		}
	});

	$('.dv2').Drags({
		handler: '.gb',                
		zIndex:200,
		opacity:.9
	});
});