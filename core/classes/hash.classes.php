<?php

/*
	* Korori-Gaming
	* Hash Class Set
	* @Version 4.0.1
	* Developed by: Ami (亜美) Denault
*/
/*
	* Setup Hash Class
	* @since 4.0.0
*/

class Hash{

/*
	* Hash Creation
	* @since 4.0.1	
	* @Param (String Name)
*/	
	public static function make($string){
		
		$temp = md5(htmlentities(Sanitize::clean($string)));
		
		$substring = Config::get('hash/makeHash');
			
		$temp = hash('sha256',$temp . self::saltedHash($temp) . $substring . self::saltedHash($substring));
		return $temp;
	}

/*
	* Salting Creation
	* @since 4.0.0	
	* @Param (String Length)
*/	
	public static function salt($length){
		return self::make(random_bytes($length));
	}

/*
	* Hash Salted
	* @since 4.0.0	
	* @Param (String Input)
*/
	public static function saltedHash($input){
		$temp = substr($input, -1, 1);
		return  hash('sha256',md5(Config::get('hash/SaltedAlpha/'.$temp)));
		
	}
	public static function generateRandomString($length = 10) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		
		return substr(hash('sha256',$randomString),0,$length);
	}
}
?>