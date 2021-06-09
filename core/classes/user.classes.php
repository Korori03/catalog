<?php 

/*
	* Korori-Gaming
	* User Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Setup User Class
	* @since 4.0.0
*/
class User{

/*
	* Private Variables
	* @since 4.0.0
*/	
	private $_db,
			$_data,
			$_sessionName,
			$_sessionVal,
			$_isLoggedIn,
			$_permissions,
			$_useritem,
			$_usersettings;

/*
	* Construct User
	* @since 4.0.0
	* @Param (String/Integer User)
*/
	public function __construct($user = null){
		$this->_db = Database::getInstance();
		$this->_sessionName = Cookie::exists('session/user')?Cookie::get('session/user'):'';
		$this->_sessionVal =  Cookie::exists('session/sessionid')?Cookie::get('session/sessionid'):'';
		
		if(!empty($this->_sessionName) && !empty($this->_sessionVal)){
			$data = $this->_db->query("SELECT * FROM " . Config::get('table/users') . " WHERE `session` ='" . $this->_sessionVal . "' AND `username` = '" . $this->_sessionName . "' LIMIT 1;");
			if($data->count()){
				$this->_isLoggedIn = true;
				$this->find($this->_sessionName);
			}
		}
		else
			$this->find($user);
		
	}

/*
	* Create User
	* @since 4.0.0
	* @Param (Array Fields)
*/
	public function create($fields = array()){
		if(!$this->_db->insert(Config::get('table/users'),$fields))
			throw new Exception('There was a problem creating an account.');
		
	}

/*
	* Find User
	* @since 4.0.0
	* @Param (String/Integer User)
*/
	public function find($user = null){

		if($user){
			$field = (is_numeric($user))?'id':'username';
			$data = $this->_db->query("SELECT * from " . Config::get('table/users') . " WHERE " . $field." = ?;",array($user));

			if($data->count()){
				$this->_data = $data->first();
				$this->_permissions = $data->first()->permission;
				return true;
			}
		}
		return false;
	}

/*
	* User Login
	* @since 4.0.0
	* @Param (String Username, String Password, Boolean Remember)
*/
	public function login($username = null, $password = null,$remember=false){

		if(!$username && !$password && $this->exists())
			Session::put($this->_sessionName,$this->data()->id);
		else{
			$user = $this->find($username);
			
			if($user){
				if($this->data()->password === Hash::make($password)){
						
					Session::put($this->_sessionName,$this->data()->id);
					if($remember){
						$hash = Hash::generateRandomString(25);
						$this->_db->query("UPDATE users SET `session` = '". $hash . "' WHERE id = '". $this->data()->id . "';");

						Cookie::delete('session/user');
						Cookie::delete('session/sessionid');
						Cookie::put('session/user',$username,Config::get('remember/cookie_expiry'));
						Cookie::put('session/sessionid',$hash,Config::get('remember/cookie_expiry'));	
						
						$this->_sessionName = Cookie::get('session/user');
						$this->_sessionVal = Cookie::get('session/sessionid');	
						return true;	
					}
					
					return true;
				}
			}
		}
		return false;
	}

/*
	* User Has Permission
	* @since 4.0.0
	* @Param (String Key)
*/
	public function hasPermission($key){
		if(strlen($this->_permissions) > 0){
			$permission = json::decode($this->_permissions,true);
			if(is_numeric($permission[$key]) && ($permission[$key] == 0 || $permission[$key] == 1))
				return true;
			else 
				return $permission[$key];
		}
		return false;
	}

/*
	* User Has Item
	* @since 4.0.1
	* @Param (String Key)
*/	
	public function hasUserItem($key){
		if(strlen($this->_useritem) > 0){
			$permission = json::decode($this->_useritem,true);
			return $permission[$key];
		}
		return '';
	}

/*
	* User Settings
	* @since 4.0.1
	* @Param (String Key)
*/	
	public function hasUserSettings($key){
		if(strlen($this->_usersettings) > 0){
			$permission = json::decode($this->_usersettings,true);
			return $permission[$key];
		}
		return '';
	}
/*
	* User Exists
	* @since 4.0.0
*/
	public function exists(){
		return (!empty($this->_data))?true:false;
	}

/*
	* User Logout
	* @since 4.0.0
*/
	public function logout(){
		$this->_db->query("Update " . Config::get('table/users') . " SET `session` = '' WHERE id = ?", array($this->data()->id));
		$this->_isLoggedIn = false;
		$this->_data ='';
		$this->_permissions= '';
		Session::delete($this->_sessionName);
		Cookie::delete($this->_cookieName);
		Cookie::delete('session/user');
		Cookie::delete('session/sessionid');
	}

		
/*
	* Password Check
	* @since 4.0.0	
	* @param (String,Int Length)
*/		
	public static function password_check ($password, $min_length = 4) {
		$password = preg_replace('/\s+/', ' ', $password);
		$strength = 0;
		if (strlen($password) >= $min_length) {
			if (preg_match_all('/[~!@#\$%\^&\*\(\)\-_=+\|\/;:,\.\?\[\]\{\}]/', $password, $match)) {
				$strength = 4;
				if (count($match[0]) > 1) {
					++$strength;
				}
			} else {
				if (preg_match('/[A-Z]+/', $password)) {
					++$strength;
				}
				if (preg_match('/[a-z]+/', $password)) {
					++$strength;
				}
				if (preg_match('/[0-9]+/', $password)) {
					++$strength;
				}
			}
			if (preg_match_all('/[^0-9a-z~!@#\$%\^&\*\(\)\-_=+\|\/;:,\.\?\[\]\{\}]/i', $password, $match)) {
				++$strength;
				if (count($match[0]) > 1) {
					++$strength;
				}
			}
		}
		return $strength;
	}

/*
	* Generate Password
	* @since 4.0.0	
	* @param (Int Length,Int Strength)
*/		
	public function password_generate ($length = 10, $strength = 5) {
		static $special = [
			'~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_',
			'=', '+', '|', '\\', '/', ';', ':', ',', '.', '?', '[', ']', '{', '}'
		];
		static $small, $capital;
		if ($length < 4) {
			$length = 4;
		}
		if ($strength < 1) {
			$strength = 1;
		} elseif ($strength > $length) {
			$strength = $length;
		}
		if ($strength > 5) {
			$strength = 5;
		}
		if (!isset($small)) {
			$small = range('a', 'z');
		}
		if (!isset($capital)) {
			$capital = range('A', 'Z');
		}
		$password = [];
		$symbols  = range(0, 9);
		if ($strength > 5) {
			$strength = 5;
		}
		if ($strength > $length) {
			$strength = $length;
		}
		if ($strength > 3) {
			$symbols = array_merge($symbols, $special);
		}
		if ($strength > 2) {
			$symbols = array_merge($symbols, $capital);
		}
		if ($strength > 1) {
			$symbols = array_merge($symbols, $small);
		}
		$size = count($symbols) - 1;
		while (true) {
			for ($i = 0; $i < $length; ++$i) {
				$password[] = $symbols[random_int(0, $size)];
			}
			shuffle($password);
			if (self::password_check(implode('', $password)) == $strength) {
				return implode('', $password);
			}
			$password = [];
		}
		return '';
	}

/*
	* User Data
	* @since 4.0.0
*/
	public function data(){
		return $this->_data;
	}

/*
	* User Logged In
	* @since 4.0.0
*/	
	public function isLoggedIn(){
		return $this->_isLoggedIn;
	}
}
?>