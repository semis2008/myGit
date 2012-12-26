$(function(){
    /* name of the selected album */
    var album 				= '';
    /* index of li where there is the selected image */
    var current				= -1;
	
    /* 1 step : Load the Albums */
    loadAlbums();

    function loadAlbums(){
        var $loader = $('#albums_container').find('.loader');
        $loader.show();
        var url 		= 'ajax/albums.php';
        /*
        gets the names of the albums with an AJAX request to the PHP side
        */
        $.get(url, function(data) {
            $loader.hide();
            $('#albums').html(data).show();
        },'html');
    }

    /*
    clicking on an album:
    we keep track of which album is currently selected by
    getting the id (album name) of the cliked row
    */
    $('#albums_container').delegate('li','click tap',function(e){
        var $this 	= $(this);
        album 		= $this.attr('id');
    });

    /*
    load thumbs when the panel thumbs_container slides in;
    hides the thumbs_container when it slides out
    */
    $('#thumbs_container').bind('pageAnimationEnd', function(e, info){
        if (info.direction == 'in'){
            loadThumbs();
        }else{
            $('#thumbs').hide();
        }
    });

    /*
    gets the photos information with an AJAX request to the PHP side
    then creates and loads each one of the images,
    and appends it to the DOM
    after that, we need to center the grid of the images
    based on how many fit per row
    */
    function loadThumbs(){
        var $thumbscontainer = $('#thumbs_container');
        var $loader = $thumbscontainer.find('.loader');
        $loader.show();
		
        var url = 'ajax/thumbs.php?album='+album;
        $.get(url, function(data) {
            var countImages = data.length;
            var $ul = $('#thumbs').empty();
            var counter = 0;
            for(var i = 0; i < countImages; ++i){
                try{
                    var description = data[i].desc[0];
                }catch(e){
                    description = '';
                }
                if(description == undefined)
                    description = '';
                $('<img alt="'+data[i].alt+'" title="'+description+'"/>').load(function(){
                    ++counter;
                    var $this = $(this);
                    /*
                    we need to make sure the grid thumbs are no bigger than 75 px
                    */
                    resizeGridImage($this);
                    var $li = $('<li/>',{
                        className	: 'pic'
                    });
                    var $a = $('<a/>',{
                        href	:	'#photo_container'
                    });
                    $ul.append($li.append($a.append($this)));
                    if(counter == countImages){
                        $loader.hide();
                        $thumbscontainer.append($ul.show());
                        autoCenterPhotos();
                    }
                }).attr('src',data[i].src);
            }
        },'json');
    }

    /*
    we need to make sure the grid thumbs are no bigger than 75 px
    */
    function resizeGridImage($image){
        var theImage 	= new Image();
        theImage.src 	= $image.attr("src");
        var imgwidth 	= theImage.width;
        var imgheight 	= theImage.height;
		
        var containerwidth  = 75;
        var containerheight = 75;
		
        if(imgwidth	> containerwidth){
            var newwidth = containerwidth;
            var ratio = imgwidth / containerwidth;
            var newheight = imgheight / ratio;
            if(newheight > containerheight){
                var newnewheight = containerheight;
                var newratio = newheight/containerheight;
                var newnewwidth =newwidth/newratio;
                theImage.width = newnewwidth;
                theImage.height= newnewheight;
            }
            else{
                theImage.width = newwidth;
                theImage.height= newheight;
            }
        }
        else if(imgheight > containerheight){
            var newheight = containerheight;
            var ratio = imgheight / containerheight;
            var newwidth = imgwidth / ratio;
            if(newwidth > containerwidth){
                var newnewwidth = containerwidth;
                var newratio = newwidth/containerwidth;
                var newnewheight =newheight/newratio;
                theImage.height = newnewheight;
                theImage.width= newnewwidth;
            }
            else{
                theImage.width = newwidth;
                theImage.height= newheight;
            }
        }
        $image.css({
            'width':theImage.width,
            'height':theImage.height
            });
    }
	
    /*
    when clicking on an image we keep track of the index
    of the image, which is in the alt attribute of the thumb
    */
    $('#thumbs_container').delegate('li','click tap',function(){
        current	= $(this).index();
    });
				
    /*
    load the large image when the panel photo_container slides in;
    empty the contents of the image element when it slides out
    */
    $('#photo_container').bind('pageAnimationEnd', function(e, info){
        if (info.direction == 'in'){
            var $thumb 		= $('#thumbs_container li:nth-child('+parseInt(current+1)+')').find('img');
            if(!$thumb.length) return;
            loadPhoto($thumb);
        }
        else{
            $('#theimage').empty();
            $('#description').empty();
            $('#prev,#next').hide();
        }
    });

    /* loads a large photo */
    function loadPhoto($thumb){
        var $loader 	= $('#photo_container').find('.loader');
        $loader.show();
        var $theimage 	= $('#theimage');
        $('<img/>').load(function(){
            var $this 	= $(this);
            resize($this);
            $loader.hide();
            var $a=$('<a/>');/*for swipe*/
            $theimage.empty().append($a.append($this));
            $('#description').empty().html($thumb.attr('title'));
            $('#prev,#next').show();
        }).attr('src',$thumb.attr('alt'));
    }

    /* swipe image - navigate right/left */
    $('#theimage').swipe(function(evt, data) {
        if(data.direction=='left')
            navigateNext();
        else
            navigatePrevious();
    });
	
    /*
    Events for navigating through the images
    The current gives us our current photo,
    so we need to get the next / previous one
    from the thumbs container - these have
    the source for the large photo in the
    alt attribute
    */
    $('#next').bind('click tap',function(){
        navigateNext();
    });
    $('#prev').bind('click tap',function(){
        navigatePrevious();
    });
	
    /* goes to next image */
    function navigateNext(){
        ++current;
        var $thumb = $('#thumbs_container li:nth-child('+parseInt(current+1)+')').find('img');
        if(!$thumb.length) {
            --current;
            return;
        }
        loadPhoto($thumb);
    }
	
    /* goes to previous image */
    function navigatePrevious(){
        --current;
        var $thumb = $('#thumbs_container li:nth-child('+parseInt(current+1)+')').find('img');
        if(!$thumb.length) {
            ++current;
            return;
        }
        loadPhoto($thumb);
    }

    /* centers the thumbs grid, based on how many photos fit per row */
    function autoCenterPhotos() {
        var photosLength = $('.pic').size();
        if(photosLength > 0) {
            var photosPerRow = Math.floor(($(window).width()-0)/80);
            //0 of paddings (if you want more...)
            var left = Math.floor(($(window).width()-(photosPerRow*80))/2);
            $('.pic').each(function(i){
                var $this = $(this);
                if(i%photosPerRow == 0) {
                    $this.css('margin-left',left+'px');
                }
                else {
                    $this.css('margin-left','0px');
                }
            });
        }
    }

    /*
    when we resize the window, the image needs to be resized,
    and also the grid should be centered
    */
    $(window).bind('resize', function() {
        autoCenterPhotos()
        if($('#theimage').find('img').length)
            resize($('#theimage').find('img'));
    });

    /*
    resize the image, based on windows width and height
    */
    function resize($image){
        var widthMargin		= 10
        var heightMargin 	= 80;
		
        var windowH      = $(window).height()-heightMargin;
        var windowW      = $(window).width()-widthMargin;
        var theImage     = new Image();
        theImage.src     = $image.attr("src");
        var imgwidth     = theImage.width;
        var imgheight    = theImage.height;

        if((imgwidth > windowW)||(imgheight > windowH)){
            if(imgwidth > imgheight){
                var newwidth = windowW;
                var ratio = imgwidth / windowW;
                var newheight = imgheight / ratio;
                theImage.height = newheight;
                theImage.width= newwidth;
                if(newheight>windowH){
                    var newnewheight = windowH;
                    var newratio = newheight/windowH;
                    var newnewwidth =newwidth/newratio;
                    theImage.width = newnewwidth;
                    theImage.height= newnewheight;
                }
            }
            else{
                var newheight = windowH;
                var ratio = imgheight / windowH;
                var newwidth = imgwidth / ratio;
                theImage.height = newheight;
                theImage.width= newwidth;
                if(newwidth>windowW){
                    var newnewwidth = windowW;
                    var newratio = newwidth/windowW;
                    var newnewheight =newheight/newratio;
                    theImage.height = newnewheight;
                    theImage.width= newnewwidth;
                }
            }
        }
        $image.css({
            'width':theImage.width+'px',
            'height':theImage.height+'px'
            });
    }
	
    /*
    Orientation callback event
    When we flip the device we need the image to be resized,
    and also the grid should be centered
    */
    $('body').bind('turn', function(e, data){
        autoCenterPhotos()
        if($('#theimage').find('img').length){
            resize($('#theimage').find('img'));
        }
    });
});