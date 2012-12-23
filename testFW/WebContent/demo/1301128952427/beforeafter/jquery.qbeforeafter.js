// Queness Before & After jQuery Plugin 
// Created by Kevin Liew from Queness.com
// Permission is given to use this plugin in whatever way you want :)

	(function($){
    $.fn.extend({
        //plugin name - qbeforeafter
        qbeforeafter: function(options) {
 
            var defaults = {
            	defaultgap: 50,            
            	leftgap: 10,
            	rightgap: 10,
            	caption: false,
            	reveal: 0.5
            };
             
            var options = $.extend(defaults, options);
         
            return this.each(function() {

	            var o = options;
	            var i = $(this);
				var img_mask = i.children('img:eq(0)').attr('src');
				var img_bg = i.children('img:eq(1)').attr('src');
				var img_cap_one = i.children('img:eq(0)').attr('alt');
			
				var width = i.children('img:eq(0)').width();
				var height = i.children('img:eq(0)').height();
				
				i.children('img').hide();		
				
				i.css({'overflow': 'hidden', 'position': 'relative'});
				i.append('<div class="ba-mask"></div>');
				i.append('<div class="ba-bg"></div>');			
				i.append('<div class="ba-caption">' + img_cap_one + '</div>');
				
				i.children('.ba-mask, .ba-bg').width(width);
				i.children('.ba-mask, .ba-bg').height(height);
				i.children('.ba-mask').animate({'width':width - o.defaultgap}, 1000);
			
				i.children('.ba-mask').css('backgroundImage','url(' + img_mask + ')');
				i.children('.ba-bg').css('backgroundImage','url(' + img_bg + ')');	

				if (o.caption) i.children('.ba-caption').show();

            }).mousemove(function (e) {

				var o = options;
				var i = $(this);
				
				pos_img = i.position()['left'];
				pos_mouse = e.pageX;		
				new_width = pos_mouse - pos_img;
				img_width = i.width();
				img_cap_one = i.children('img:eq(0)').attr('alt');
				img_cap_two = i.children('img:eq(1)').attr('alt');				

				if (new_width > o.leftgap && new_width < (img_width - o.rightgap)) {			
					i.children('.ba-mask').width(new_width);
				}
				
				if (new_width < (img_width * o.reveal)) {			
					i.children('.ba-caption').html(img_cap_two);
				} else {
					i.children('.ba-caption').html(img_cap_one);			
				}					
			
			});
        }
    });
	})(jQuery);	
