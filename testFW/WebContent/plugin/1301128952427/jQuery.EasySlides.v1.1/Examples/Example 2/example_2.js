$(document).ready(function(){

    var myOptions = {
        noImages: 4,
        path: "Examples/Example 2/slideshow_images/",
        links: { 
            1:"http://www.jquery.com",
            2:"http://www.jquery.com",
            3:"http://www.jquery.com",
            4:"http://www.jquery.com"
        },
        timerInterval: 2500,
	randomise: true
    };

    // Woo! We have example number 2!
    $('#example_2_container').easySlides(myOptions);

})