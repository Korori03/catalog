<?php
/*
	* Korori-Gaming
	* Files Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Files
	* @Since 5.0.0
*/	
class files{

	private static $dir_ignore = array('.git'),
			$files_ignore = array('.htaccess','.htpasswd','.gitignore');


/*
	* If File Exist
	* @Since 4.0.2
	* @Param (String)
*/
	public static function _exist($base_filename, $possible_extensions ='') {
		$possible_extensions = validate::_array($possible_extensions);
		if(strlen(pathinfo($base_filename)['extension']) == 0){
			foreach ($possible_extensions as $extension) {
				$file = "$base_filename.$extension";
				if (file_exists($file))
					return true;
			}
		}
		else{
			$file = $base_filename;
			if (file_exists($file))
				return true;
		}
		return false;
	}

	public static function _rmdir ($dirname) {
		if (!is_dir($dirname)) 
			return false;
		else{
			@rmdir($dirname);
			return true;
		}
	}
	
	public static function _rmfile ($filename) {
		if (!is_file($filename)) 
			return false;
		else{ 
			@unlink($filename);
			return true;
		}
	}
	
	
	public static function _list($dir= '.'){
		$list = array();

		if (is_dir($dir)){
			if ($handle = opendir($dir)) {
				while (false !== ($entry = readdir($handle))) {
					if ($entry != "." && $entry != ".." && !in_array($entry,self::$dir_ignore) && !in_array($entry,self::$files_ignore))
						array_push($list,$entry);
				}
				closedir($handle);
			}
		}
		
		return $list;
	}
}

?>