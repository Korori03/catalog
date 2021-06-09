<?php

/*
	* Korori-Gaming
	* Session Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Setup Session Class
	* @since 4.0.0
*/
class Session{

/*
	* Session Exists
	* @since 4.0.0	
	* @param (String Name)
*/		
	public static function exists($name){
		return (isset($_SESSION[$name]))?true:false;
	}

/*
	* Session Put/Set
	* @since 4.0.0	
	* @param (String Name)
*/	
	public static function put($name,$value){
		return $_SESSION[$name] = $value;
	}
	public static function set($name,$value){
		self::put($name,$value);
	}
	
/*
	* Session Put/Set PDF
	* @since 4.0.1	
	* @param (String Name)
*/		
	public static function putPDF($name,$value){
		return $_SESSION['pdf'][$name] = $value;
	}
	
	public static function setPDF($name,$value){
		self::putPDF($name,$value);
	}

/*
	* Session Get
	* @since 4.0.1	
	* @param (String Name)
*/		
	public static function getPDF($name){
		return $_SESSION['pdf'][$name];
	}

/*
	* Session Delete PDF
	* @since 4.0.1	
	* @param (String Name)
*/		
	public static function deletePdfAll(){
		if(self::exists('pdf')){
			unset($_SESSION['pdf']);
		}
	}
/*
	* Session Get
	* @since 4.0.0	
	* @param (String Name)
*/	
	public static function get($name){
		return $_SESSION[$name];
	}
	
/*
	* Session Delete
	* @since 4.0.0	
	* @param (String Name)
*/	
	public static function delete($name){
		if(self::exists($name)){
			unset($_SESSION[$name]);
		}
	}

/*
	* Session Flash
	* @since 4.0.0	
	* @param (String Name,String)
*/	
	public static function flash($name,$string=''){
		if(self::exists($name)){
			$session=self::get($name);
			self::delete($name);
			return $session;
		}
		else{
			self::put($name,$string);
		}
	}
}
?>