<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Fresh Sliding Thumbnails Gallery with jQuery and PHP</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Fresh Sliding Thumbnails Gallery with jQuery and PHP" />
        <meta name="keywords" content="jquery, images, gallery, full page, thumbnails, scrolling, sliding, php, xml"/>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    </head>
    <style>
        span.reference{
            position:fixed;
            left:10px;
            bottom:0px;
            font-size:9px;
        }
        span.reference a{
            color:#aaa;
            text-decoration:none;
        }
        span.reference a:hover{
            color:#ddd;
            
        }

    </style>
    <body>
        <div class="albumbar">
            <span>
                <a href="http://www.flickr.com/photos/2dogs_productions/sets/72157594522520053/" target="_blank">
                    Vincent Boiteau's photostream
                </a>
            </span>
            <div id="albumSelect" class="albumSelect">
                <ul>
                    <?php
                    $firstAlbum = '';
                    $i=0;
                    if(file_exists('images')) {
                        $files = array_slice(scandir('images'), 2);
                        if(count($files)) {
                            natcasesort($files);
                            foreach($files as $file) {
                                if($file != '.' && $file != '..') {
                                    if($i===0)
                                        $firstAlbum = $file;
                                    else
                                        echo "<li><a>$file</a></li>";
                                    ++$i;
                                }
                            }
                        }
                    }
                    ?>
                </ul>
                <div class="title down"><?php echo $firstAlbum;?></div>
            </div>
        </div>
        <div id="loading"></div>
        <div id="preview">
            <div id="imageWrapper">               
            </div>  
        </div>
        <div id="thumbsWrapper">
        </div>
        <div class="infobar">
            <span id="description"></span>
            <span class="reference">
                <a href="http://tympanus.net/codrops/2010/05/23/fresh-sliding-thumbnails-gallery-with-jquery-php">&copy;Codrops</a>
            </span>
        </div>
        <!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="jquery.gallery.js"></script>
    </body>
</html>