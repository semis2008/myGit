<?php
if(file_exists('../images')){
	$files = array_slice(scandir('../images'), 2);
	if(count($files)){
		natcasesort($files);
		foreach($files as $file){
			if($file != '.' && $file != '..'){
				echo '<li id="'.$file.'" class="arrow"><a href="#thumbs_container">'.$file.'</a></li>';
			}
		}
	}
}
?>