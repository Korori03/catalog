<?php
/*
	* API Class
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Api
	* @Since 4.4.7
*/	
class Api{
	
	public static  		$_SessionApi;
						
	public static		$_items,	
						$_callList 
					= 	array();
	
/*
	* Constructor for API Class
	* @ Version 1.0.0
	* @ Param (Object,String)
*/		
	private function __construct(){
	
		//Grab Body Raw Json from POST/PUT/DELETE
		$data = json::decode(file_get_contents("php://input"),true);

		//If Post Data has Session
		if(isset($data->session)){
			$check =  self::checkSession(self::_GetIP(),$data->session);
			if($check)
				self::$_SessionApi = $data->session;
			else
				self::UserCheck();
		}

		//If Post Data has Username or Password		
		else if(isset($data->username) && isset($data->password)){
			self::UserCheck();
		}
	}

/*
	* Session Check for API Class
	* @ Version 1.0.0
	* @ Param (Strin,String)
*/		
	public static function checkSession($ip,$session){
		$sql = "SELECT * FROM ". Config::get('table/users') . " WHERE ip = '".$ip."' and session ='".$session."' LIMIT 1;";
		$check = Database::getInstance()->query($sql);
		return ($check->count()> 0?true:false);
	}
/*
	* Set Session ID
	* @ Version 1.0.0
	* @ Param (String,String)
*/
	public static function _SetSessionID($username,$password){
		return Hash::make(
			Config::get('api/key').
			$username .
			$password .
			self::_GetIP(false) .
			date("Ymdhis"));
	
	}

/*
	* Get IP
	* @ Version 1.0.0
	* @ Param (String)
*/
	public static function _GetIP($local=false)
	{
		$ip ='';
		if (!empty($_SERVER['HTTP_CLIENT_IP']))
		  $ip	=	$_SERVER['HTTP_CLIENT_IP'];
		elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   
		  $ip	=	$_SERVER['HTTP_X_FORWARDED_FOR'];
		else
		  $ip	=	$_SERVER['REMOTE_ADDR'];

		return $ip;
	}

/*
	* Json Format
	* @ Version 1.0.0
	* @ Param (Boolean,Object,Integer)
*/
	public static function jsonFormat($status,$object,$code=203){
		
		http_response_code($code);
		self::$_items["status"] = $status;
		self::$_items["object"] = $object;
		self::$_items["session"] = self::$_SessionApi;
		header('Content-Type: application/json');
		echo json::encode(
			self::$_items,
			JSON_PRETTY_PRINT 
		);
	}

/*
	* Not Found Format
	* @ Version 1.0.0
	* @ Param (Integer)
*/
	public static function NotFound($string){
		self::jsonFormat(false,$string,400);
	}

/*
	* Json Error
	* @ Version 1.0.0
*/	
	public static function JSONERROR(){
		switch (json_last_error()) {
			case JSON_ERROR_NONE:
				echo ' - No errors';
			break;
			case JSON_ERROR_DEPTH:
				echo ' - Maximum stack depth exceeded';
			break;
			case JSON_ERROR_STATE_MISMATCH:
				echo ' - Underflow or the modes mismatch';
			break;
			case JSON_ERROR_CTRL_CHAR:
            echo ' - Unexpected control character found';
			break;
			case JSON_ERROR_SYNTAX:
				echo ' - Syntax error, malformed JSON';
			break;
			case JSON_ERROR_UTF8:
				echo ' - Malformed UTF-8 characters, possibly incorrectly encoded';
			break;
			default:
				echo ' - Unknown error';
			break;
		}
	}

/*
	* utf8ize
	* @ Version 1.0.0
	* @ Param (Object/Array/string)
*/
	public static function utf8ize($dat) {
		if (is_string($dat)) {
			return utf8_encode($dat);
      	} elseif (is_array($dat)) {
			$ret = [];
			foreach ($dat as $i => $d) $ret[ $i ] = self::utf8ize($d);
			return $ret;
      	} elseif (is_object($dat)) {
			foreach ($dat as $i => $d) $dat->$i = self::utf8ize($d);
			return $dat;
      } else {
			return $dat;
      }
	}
	
/*
	* Check If User has Access
	* @ Version 1.0.0
*/
	public static function UserCheck(){
		$products_arr = array();
		
		$validate = new Validate();
		$data = json::decode(file_get_contents("php://input"),true);

		$validation = $validate->check($data,array(
			'username'	=>	array('name'=>'Username','required'=>true),
			'password'	=>	array('name'=>'Password','required'=>true)
			));
		
		if($validation->passed()){
			$user = new User();
			$username = $data['username'];
			$password =  $data['password'];
			
			$login = $user->login($username,$password);

			if($login){
				$products_arr["status"]		= "true";
				$products_arr["object"]		= (object)["message"=>"Login Session Created Successfully"];
				$products_arr["session"]	=  self::_SetSessionID($username,$password);
				
				$sql = "Update " . Config::get('table/users'). " 
							SET `ip` = '" . self::_GetIP(false) . "', 
							`session` = '". $products_arr["session"] . "'
							WHERE `username` ='".$username."';";
							
				Database::getInstance()->query($sql);
				self::$_SessionApi = $products_arr["session"];
				Session::set('session_api',$products_arr["session"]);
			}else{
				$products_arr["status"] 	= "Sorry, logging in failed";
				$products_arr["object"] 	= "false";
				$products_arr["session"]	= '';
			}	
		}else{
			$products_arr["status"]	= impode(',',$validation->errors());
			$products_arr["object"]	= "false";
			$products_arr["session"]	= '';
		}
		return $products_arr;
	}
	
/*
	* Get API Type
	* @ Version 1.0.0
*/	
	public static function GetAPI(){
		$data = json::decode(file_get_contents("php://input"));
		if(Input::get('login')){
			$return = self::UserCheck();
			if(Input::get('login')){
				self::jsonFormat($return['status'],$return['object']);
				return false;
			}
		}

		if(isset($data->session)){
			$check =  self::checkSession(self::_GetIP(),$data->session);
			if($check)
				self::$_SessionApi = $data->session;
			else{
				$return = self::UserCheck();
				if(Input::get('login')){
					self::jsonFormat($return->status,$return->object);
					return false;
				}
			}
		}
		else if(Session::exists("session_api")){
			$check =  self::checkSession(self::_GetIP(),Session::get("session_api"));
			if($check)
				self::$_SessionApi = Session::get("session_api");
			else{
				$return = self::UserCheck();
				if(Input::get('login')){
					self::jsonFormat($return->status,$return->object);
					return false;
				}
			}
		}
		else{
			if(empty(self::$_SessionApi)){
				if(isset($data->username) && isset($data->password)){
					$return = self::UserCheck();
					if(Input::get('login')){
						self::jsonFormat($return->status,$return->object);
						return false;
					}
				}
				else{
					$object = new stdClass();
					$object->message = "Please sign in to create session API ID";
					self::jsonFormat(true,$object,500);
					return false;
				}
			}
		}

		//Session validation
		header("Access-Control-Allow-Origin: *");
		header("Content-Type: application/json; charset=UTF-8");

		if ($_SERVER['REQUEST_METHOD'] === 'POST' || 
			$_SERVER['REQUEST_METHOD'] === 'DELETE' || 
			$_SERVER['REQUEST_METHOD'] === 'PUT') {
				header("Access-Control-Allow-Methods: POST");
				header("Access-Control-Max-Age: 3600");
				header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
		}

		// get posted data
		$data = json::decode(file_get_contents("php://input"));
		$table_ref = ucfirst($data->table);
		$method = $data->method;
		
		if(!empty($data)){
			if(class_exists($table_ref)) {
				if(method_exists($table_ref,$method)){
					$obj = new $table_ref();
					if(list($dynamicCall,$object) = call_user_func_array(array($obj,$method),array($data))){//call_user_func(array($table_ref,$method),$data)){
						if($dynamicCall)
							self::jsonFormat(true,$object);
						else
							self::jsonFormat(false,$object,503);
					}
					else
						self::jsonFormat(false,"Unable to call function for API (". $table_ref."::" .$method .")",400);
				}
				else
					self::jsonFormat(false,"Method " . $method." is not found.",400);
			}
			else
				self::jsonFormat(false,"'" . ucfirst($table_ref) . "' Class does not exist",400);
		}
		else
			self::jsonFormat(false,"Unable to create product. Data is incomplete.",400);
		
	}

/*
	* Setup Where or Set
	* @ Version 1.0.0
	* @ Param (Array,Object,String)
*/		
	public static function APISetup($columns,$data,$type = 'where'){

		$update = array();
		$where = array();

		//Check for updates
		foreach ($data as $key => $value) {
			if (isset($data->{$key}->update)) {
				if($data->{$key}->update == true)
					$update[$key] = $data->{$key};
			}
			else
				$where[$key] = $data->{$key};
		}

		//Setup Update Bind
		$updates = array();
		for($x= 0;$x <count($columns);$x++){
            if (array_key_exists($columns[$x], $update)) 
				$updates[] = '`' . $columns[$x] . "`=:$columns[$x]";
		}

		//Setup Where Bind
		$wheres = array();
		for($x= 0;$x <count($columns);$x++){
            if (array_key_exists($columns[$x], $where)) 
				$wheres[] = '`'.$columns[$x] .'`'. (!empty($data->{$columns[$x]}->operator)?' ' .$data->{$columns[$x]}->operator . ' ':'=') .":$columns[$x]";
		}
		$concat = ($type ==='where'?', ':' AND ');
		
		return array(implode(' AND ', $wheres),implode($concat, $updates));
	}

/*
	* Submit Function
	* @ Version 1.0.0
	* @ Param (Object,Array,String)
*/	
	public static function submit($data,$columns,$query){
		$stmt = Database::getInstance()->queryAPI($query,$data->data,$columns);
		$object = new stdClass();

		$success = (int)$stmt->error() === 0?true:false;
		$results = ($success?$stmt->results():$stmt->errorMsg());

		switch(explode(' ' ,strtoupper($query))[0]){
			case 'DELETE':
				$results = ($success?$object->message = "Successfully deleted record":$stmt->errorMsg());
				break;
			case 'INSERT':
				$results = ($success?$object->message = "Successfully inserted record":$stmt->errorMsg());
				break;
			case 'UPDATE':
				$results = ($success?$object->message = "Successfully updated record":$stmt->errorMsg());
				break;
		}
		
		return array($success,$results);
	}

/*
	* Call API
	* @ Version 1.0.0
	* @ Param (String,String,Array,Array)
*/
	public static function CallAPI($method, $url, $data =[],$headers = [])
	{
		$_header 	=	(object)['Content-Type: application/json'];
		$curl 		=	curl_init();
		
		switch (strtoupper($method))
		{
			case 'POST':
				curl_setopt($curl, CURLOPT_POST, true);
				curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
				break;
			case 'GET':
				curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'GET');
				if ($data)
					curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
				break;	
			case 'DELETE':
				curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'DELETE');
				curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
				break;	
			case 'PUT':
				curl_setopt($curl, CURLOPT_PUT, true);
				curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
				break;
		}

		if($headers)
			array_push($_header, (object)$headers);
		
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_HTTPHEADER,$_header);
		// if api with HTTPS
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		
		$result = curl_exec($curl);
		
		$httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		
		curl_close($curl);
		$error_status = '';
		switch ($httpCode) {
			case 404:
				$error_status = '404: API Not found';
				break;
			case 500:
				$error_status = '500: servers replied with an error.';
				break;
			case 502:
				$error_status = '502: servers may be down or being upgraded.';
				break;
			case 503:
				$error_status = '503: service unavailable.';
				break;
		}
		
	if($error_status)
		return '{"status": "false","object": "'.$error_status.'"}';
	else
		return '{"status": "true","object": '.$result."}";
	}
}
