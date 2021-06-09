<?php

/*
	* Korori-Gaming
	* Cookie Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Setup Cookie Class
	* @since 4.0.0
*/
class Cookie{

/*
	* Cookie Exists
	* @since 4.0.0	
	* @Param (String Name)
*/		
	public static function exists($name){
		return (isset($_COOKIE[$name]))?true : false;
	}

/*
	* Cookie Get Cookie
	* @since 4.0.0	
	* @Param (String Name)
*/	
	public static function get($name){
		return $_COOKIE[$name];
	}

/*
	* Cookie Put Cookie
	* @since 4.0.0	
	* @Param (String Name, String Value, String Expiring Time)
*/	
	public static function put($name,$value,$expiry){
		if(setcookie($name,$value,time() + $expiry,'/'))
			return true;
		return false;
	}

/*
	* Cookie Delete Cookie
	* @since 4.0.0	
	* @Param (String Name)
*/	
	public static function delete($name){
		self::put($name,'',time()-1);
	}
}
?>