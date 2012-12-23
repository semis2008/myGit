(function($){

	$.fn.jqFlick = function(options){
		
		// Default options:
		
		options = $.extend({
			width:500,
			height:500,
			maxFetch:50,
			captions:false,
			autoAdvance:false,
			advancePeriod:5000
		},options);
		
		// Using YQL and the flickr.photosets.photos table to query the Flickr API.
		
		var YQL = 'http://query.yahooapis.com/v1/public/yql?q={QUERY}&format=json&callback=?',
			query = "SELECT * FROM flickr.photosets.photos({MAX}) WHERE photoset_id='{PHOTOSET}'";
		
		// Replacing the "{EXAMPLE}" keywords from the strings:
		
		YQL = templateReplace(YQL,{
			"query": encodeURIComponent(
				templateReplace(query,{
					photoset : options.photosetID,
					max	: options.maxFetch
				}
			))
		});
		
		// Template for building Flickr's image URLs:
		
		var flickrSRC = 'http://farm{FARM}.static.flickr.com/{SERVER}/{ID}_{SECRET}.jpg',
			flickrSlider = this;
		
		flickrSlider.trigger('jqFlickRemove');
		
		// Fetching the images using Flickr's API:
		
		$.getJSON(YQL,function(r){
			if(!r || !r.query || !r.query.count){
				throw "There is no such photoset!";
			}

			var currentPos = 1,
				cnt = r.query.count;

			var caption = $('<span>',{
				className: 'caption'
			}).appendTo(flickrSlider);

			var ul = $('<ul>',{
				css:{
					width: options.width*r.query.count,
					height:options.height
				}
			});
			
			// Looping through the photo results:
			
			$.each(r.query.results.photo,function(){
				data = this;
			
				// Creating a new LI element with the photo as its
				// centered background image:
				
				$('<li>',{
					css : {
						backgroundImage: 'url('+templateReplace(flickrSRC,data)+')',
						width: options.width
					}
				}).appendTo(ul);
			});

			flickrSlider.addClass('flickrSliderHolder')
						.width(options.width)
						.height(options.height+25)
						.append(ul);
			
			// Binding a custom "slide" event.
			// You can then flickrSlider.trigger("slide",2)
			// to go to the second slide:
			
			flickrSlider.bind('slide',function(e,slide){
				if(slide < 1 || slide > cnt || ul.is(':animated')){
					return false;
				}
				
				ul.animate({
					left:-(slide-1)*options.width
				},{
					easing: 'easeInOutCirc',
					duration: 300
				});
				
				if(options.captions){
					
					// Animating the transition between
					// the captions (if enabled):
					
					caption.fadeOut(150,function(){
						caption.html(r.query.results.photo[slide-1].title);
					}).fadeIn(150);
				}
				
				currentPos = slide;
			});
			
			var arrows = $('<div>',{
				className: 'arrows'
			});
			
			// Creating the previous / next arrows, and
			// binding event listeners for the click events:
			
			var arrowPrev = $('<a>',{
				className: 'previous',
				href: '#',
				click : function(){
					var toShow = currentPos - 1;
					if(toShow < 1){
						toShow = cnt;
					}
					
					flickrSlider.trigger('slide',[toShow]);
					return false;
				}
			}).appendTo(arrows);

			var arrowNext = $('<a>',{
				className: 'next',
				href: '#',
				click : function(){
					var toShow = currentPos + 1;
					if(toShow > cnt){
						toShow = 1;
					}
					
					flickrSlider.trigger('slide',[toShow]);
					return false;
				}
			}).appendTo(arrows);
			
			arrows.appendTo(flickrSlider);

			// Showing the first slide by default:
			
			flickrSlider.trigger('slide',[1]);
			
			if(options.autoAdvance){
				
				// If auto advance is enabled, listen for
				// the load event and schedule a periodic slide change.
				//
				// Read more here: 
				// http://tutorialzine.com/2011/01/how-to-make-auto-advancing-slideshows/
				
				$(window).load(function(){

					$.fn.jqFlick.timeOut = null;
				
					arrowPrev.add(arrowNext).click(function(e,simulated){
						if(!simulated){
							clearTimeout($.fn.jqFlick.timeOut);
						}
					});
				
					(function autoAdvance(){
						if($.fn.jqFlick.timeOut){
							arrowNext.trigger('click',[true]);
						}
						$.fn.jqFlick.timeOut = setTimeout(autoAdvance,options.advancePeriod);		
					})();
				});
			}
		});

		// This custom event removes all event listeners,
		// and empties the slider holder:

		flickrSlider.bind('jqFlickRemove',function(){
			if($.fn.jqFlick.timeOut){
				clearTimeout($.fn.jqFlick.timeOut);
			}
			
			flickrSlider.empty().unbind('jqFlickRemove slide');
			
		});

		return flickrSlider;
		
	};
	
	// Helper function for replacing "{KEYWORD}" with
	// the respectful values of an object:
	
	function templateReplace(template,data){
		return template.replace(/{([^}]+)}/g,function(match,group){
			return data[group.toLowerCase()];
		});
	}
	
	// A custom easing functon. For more info visit:
	// http://gsgd.co.uk/sandbox/jquery/easing/
	
	$.easing.easeInOutCirc = function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	};
	
})(jQuery);