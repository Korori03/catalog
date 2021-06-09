<?php

/*
	* Korori-Gaming
	* Input Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
class Input{

/*
	* Input Exists
	* @since 4.0.0	
	* @Param (String Type {Post or Get})
*/			
		public static function exists($type ='post'){
			switch($type){
				case 'post':
					return (!empty($_POST))?true:false;
					break;
				case 'get':
					return (!empty($_GET))?true:false;
					break;
				default:
					return false;
					break;
			}
		}

/*
	* Get Input Item
	* @since 4.0.0	
	* @Param (String Item)
*/		
	public static function get($item){
		if(isset($_POST[$item])){
			return Sanitize::clean($_POST[$item]);
		}else if(isset($_GET[$item])){
			return Sanitize::clean($_GET[$item]);
		}
		return '';
	}
}
?>