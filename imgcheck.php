<?php

/*
	* Catalog
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
	Missing Images
*/


	require_once 'core/init.php';
	$directory = dirname(__FILE__) .'/content/uploads';
	if (!is_dir($directory)) {
        exit('Invalid diretory path');
    }

    $files = array();
    foreach (scandir($directory) as $file) {
        if ($file !== '.' && $file !== '..') {
			$id = current(explode("_", $file));
            array_push($files, $id);
        }
    }
	$array = implode("','",$files);
	$query= Database::getInstance()->query("SELECT id,name,brand,`system` as t,region FROM games WHERE id NOT IN ('".$array."')");
	foreach($query->results() as $item) {
		echo $item->id . ',' .$item->name .  ',' . $item->brand .  ' ' . $item->t . ',' . $item->region .',' . Slug::_url($item->id . ' ' .$item->name .' ' .($item->region == 'United States'?'usa':$item->region)) . '</br>';
	}
?>