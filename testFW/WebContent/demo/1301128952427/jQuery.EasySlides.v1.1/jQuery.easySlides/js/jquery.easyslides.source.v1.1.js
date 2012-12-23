/*
    jQuery Easy Slides v1.1 - Possibly the easiest to use jQuery plugin for
    making slideshows!
    Copyright (C) 2010  Dale Davies

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see http://www.gnu.org/licenses/.
*/


(function($){ 
$.fn.easySlides = function(options) {

    // Set default variables in an array
    var defaults = {
        noImages: 2,
        path: '',
        captions:null,
        links:null,
        linksOpen:'sameWindow',
        timerInterval: 6000,
	randomise:false
    };

    // Extend default variable array using supplied options, making opional arguments possible
    options = $.extend(defaults, options);

    // Initialse other global variables...
    var divNo=1;
    var imgNumber;
    var timer;
    var path;

    // Initialise image number...
    if (options.randomise===true){ // Has the user chosen to begin with a random image number?
        imgNumber = Math.ceil((options.noImages)*Math.random());  // Generate a number between 1 and noImages
    } else {
        imgNumber=1;  // Else just start at image number 1
    }
    
    // Cache some selectors...
    var container = $(this);

    // Create the elements we need to manipulate inside the main container...
    $(container).append('<div class="easy_slides_img1"></div><div class="easy_slides_img2"></div><div class="easy_slides_caption"></div>');

    // Cache some more selectors...
    var img1 = $('.easy_slides_img1',container);
    var img2 = $('.easy_slides_img2',container);
    var caption = $('.easy_slides_caption',container);

    // Define a function to be run using setInterval...
    function fi(firstRun){

        // Initialise firstRun variable...
        firstRun = typeof(firstRun) != 'undefined' ? firstRun : false;
        
        // Reset the image number if its greater than total number of images, so it loops back to 1...
        if( imgNumber>options.noImages ){ imgNumber=1; }

        // Create new image object
        var img = new Image();

        // Construct image path from the path provided by user and the image number, but should this really be hardcoded to just .jpg?
        path = options.path+imgNumber+'.jpg';

        // Is this the first time the function has been run?
        if (firstRun===true){
            
            // Load image number 1 and show it...
            $(img).load(function(){
                img1.append(img); // Append the image object to #img1
                if (options.links!==null && options.links[imgNumber]!=''){
                        cacheImgNumber=imgNumber;
                         $('img',img1).css('cursor','pointer').click(function(){
                            if (options.linksOpen==='newWindow'){
                                window.open(options.links[cacheImgNumber]);
                            } else {
                                window.location.href=options.links[cacheImgNumber];
                            }
                        });
                    }
                    img1.fadeIn(function(){
                        if (options.captions!==null){ // Check if captions have been suplied or not
                            caption.html(options.captions[imgNumber]).fadeIn(); // Bring up the caption
                        }
                        // Increment image number. Got to be here or it increments before fadeOut happens.
                        imgNumber++;
                    });
            })
            .error(function () {
                container.html('<b>Error Loading Image:</b> '+path); // If there is an error display a message
            })
            .attr('src', path); // attatch the image and action the stuff above like the fade in.

        } else { // If this isnt the first run...
            
            // Load image
            $(img).load(function(){

                // Toggle between the two container divs
                if (divNo==1){
                    upperImg = img1;
                    lowerImg = img2;
                } else {
                    upperImg = img2;
                    lowerImg = img1;
                }

                // To begin with we assume the following css has been applied in the stylesheet...
                // #img1{z-index:2} #img2{z-index:1;display:none;}
                lowerImg.append(img).show();                // Make image container 2 visible
                if (options.links!==null && options.links[imgNumber]!=''){
                    cacheImgNumber=imgNumber;
                    $('img',lowerImg).css('cursor','pointer').click(function(){
                        if (options.linksOpen==='newWindow'){
                            window.open(options.links[cacheImgNumber]);
                        } else {
                            window.location.href=options.links[cacheImgNumber];
                        }
                    });
                }
                upperImg.fadeOut(function(){                // Fade out container 1 to show container 2
                     upperImg.css('z-index','1');           // Put container 1 to the back
                     $('img',upperImg).remove();            // Remove the image in container 1
                     lowerImg.css('z-index','2');           // Bring container 2 to the front
                     if (options.captions!==null){       // Check if captions have been suplied or not
                         caption.fadeOut(function(){    // Do the caption
                            $(this).html(options.captions[imgNumber]).fadeIn();
                            // Increment image number. Got to be here or it increments before fadeOut happens.
                            imgNumber++;
                         });
                     } else {
                         imgNumber++;
                     }
                 });
                
            }).error(function () {
                clearInterval(timer);                       // Stop repeating!
                container.html('<b>Error Loading Image:</b> '+path); // If there is an error display a message
            })
            .attr('src', path);                             // attatch the image and action the stuff above
        }

        // Some stuff to toggle & reset the divNo counter....
        if (divNo==2){
            divNo=1;
        } else {
            divNo=2;
        }
    }

    // Finally we can run everything...
    return this.each(function() {

        fi(true); // Initially run the main function setting firstRun to true.
        timer = setInterval(fi , options.timerInterval); // Continue running it without firstRun option (this delaults to firstRun=false).

    });

};
})(jQuery);