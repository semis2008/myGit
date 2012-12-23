$(document).ready(function(){

    // Set up our options for the slideshow...
    var myOptions = {
        noImages: 6,
        path: "Examples/Example 1/slideshow_images/",  // Relative path with trailing slash.
        captions: {                 
            1:'<b>This is Easy Slides - Possibly the easiest to use jQuery plugin for making slideshows!</b> <div style="font-size:14px;margin-top:5px;">Thank you for trying it out, I hope you will find it useful.</div>',
            2:'<b>This is the first version of this plugin!</b> <div style="font-size:14px;margin-top:5px;">It features optional captions, linkable images and you can set a random starting image.</div>',
            3:'<b>It all sounds complicated but I designed it to be easy to use...</b> <div style="font-size:14px;margin-top:5px;">No complicated HTML, just a few lines of jQuery!</div>',
            4:'<b>There\'s not much more to say, read the documentation for usage examples.</b> <div style="font-size:14px;margin-top:5px;">Eventually I\'ll think of something interesting to write about here!</div>',
            5:'<b>So for now I\'ll say goodbye!</b<div style="font-size:14px;margin-top:5px;">Although there is still one caption left to fill...</div>',
            6:'<b>Thank you for reading this nonsense!</b> <div style="font-size:14px;margin-top:5px;">I realise it is just nonsense, but at least you can see how captions can look with some text in them.</div>'
        },
        links: { // Each image number must be listed here, unless no links are required at all, then links option can be ommitted.
            1:"http://www.google.com",
            2:"http://www.yahoo.com",
            3:"",
            4:"http://www.jquery.com",
            5:"http://www.youtube.com",
            6:""
        },
        linksOpen:'newWindow',
        timerInterval: 6500, // 6500 = 6.5 seconds
	randomise: false // Start with random image?
    };

    // Woo! We have a jquery slideshow plugin!
    $('#example_1_container').easySlides(myOptions);

})