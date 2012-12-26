$(document).ready(function(){
	
	// Creating a flickr slider. This is 
	// how you would probably use the plugin.
	
	$('#flickrSlider').jqFlick({
		photosetID: '72157625956932639',
		width:500,
		height:320,
		captions:true,
		autoAdvance:true
	});

	// Creating different flickr sliders,
	// depending on the select element value.

	$('select').change(function(){
		
		var options = {};
		
		switch(this.value){
			case '1':
				options = {
					photosetID: '72157625956932639',
					width:500,
					height:320,
					captions:true,
					autoAdvance:true
				};
				break;
			case '2':
				options = {
					photosetID:'42296',
					width:500,
					height:500,
					captions:true,
					autoAdvance:true
				};
				break;
			case '3':
				options = {
					photosetID:'72157625961099915',
					width:200,
					height:150
				}
		}

		$('#flickrSlider').jqFlick(options);
	});
	
});