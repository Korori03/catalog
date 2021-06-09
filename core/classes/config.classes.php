<?php


/*
	* Korori-Gaming
	* Config Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/

/*
	* Setup Config Class
	* @since 4.0.0
*/
class Config{

/*
	* Get Config
	* @ Version 1.0.0
	* @ Since 4.0.0
	* @ Param (String Path)
*/		
	public static function get($path=null){
		if($path){
			$config = $GLOBALS['config'];
			$path =explode('/',$path);
			
			foreach($path as $bit){
				if(isset($config[$bit]))
					$config = $config[$bit];	
			}
			return is_array($config)?'':$config;
		}
		return false;
	}
}


/*
	* Setup Options Class
	* @since 4.0.1
*/
class Options{

/*
	* Get Config
	* @Version 1.0.0
	* @since 4.0.1
	* @Param (String Path)
*/		
	public static function get($path=null){
		if($path){
			$config = $GLOBALS['options'];
			$path =explode('/',$path);
			
			foreach($path as $bit){
				if(isset($config[$bit]))
					$config = $config[$bit];	
			}
			return is_array($config)?'':$config;
		}
		return false;
	}
}
?>