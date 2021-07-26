<?php
/*
	Initize Set
	Developed by: Ami Denault
	Coded on: 24th June 2014

*/
/*	@Updates
	*9th May 2017
	-Added Global Options
	-Set Timezone from Global Options
*/
/*
	* Start Session
*/

declare(strict_types=1);

session_start();


ini_set("display_errors", "1");
ini_set("track_errors", "1");
ini_set("html_errors", "1");
error_reporting(E_ALL);

ini_set('zlib.output_compression_level', "9");	
ob_start("ob_gzhandler");

/*
	* Global Configr
*/

require 'config.php';
/*
	* Autoload Classes
	* @ Version 1.0.5
	* @ Since 4.0.0
	* @ Param (String Classname)
*/	
spl_autoload_register(function($class_name){
	$directorys = array(
			'libs/objects',
            'libs',
            'core/classes',
			'core'
    );
	foreach($directorys as $directory)
    {
    	$dir = explode('/',$directory);
		$required = $directory.'/'.strtolower($class_name) . '.' .$dir[count($dir) -1]. '.php';
        if(file_exists($required))
			 require_once($required);
	}
});


/*
	* Get Content Mangement Options for Webpage
	* @ Version 1.0.0
	* @ Since 4.0.1
*/
	$dboptions = Database::getInstance()->get(Config::get('table/options'));

	$GLOBALS['options'] = array();
	foreach($dboptions->results() as $option){

		if(filter::bool($option->autoload)){
			$option_name = $option->name;
			$option_value = $option->option_value;
			$GLOBALS['options'][$option_name] = $option_value;
		}
	
	} 
/*
	* Get Cookie Instances for Remember Me
	* @ Version 1.0.3
	* @ Since 4.0.0
*/	
if(Cookie::exists(Config::get('remember/cookie_name')) && !Session::exists(Session::get('session/session_name'))){
	$hash = Cookie::get(Config::get('remember/cookie_name'));
	$hashCheck = DataBase::getInstance()->get('users_session',array('hash','=',$hash));
	if($hashCheck->count()){
		$user = new User($hashCheck->first()->user_id);
		$user->login();
	}
}

/*
	* Set Time Zone from Options in Mysql
	* @ Version 1.0.5
	* @ Since 4.0.0
*/
if(function_exists('date_default_timezone_set'))
	date_default_timezone_set(Options::get('timezone'));
else
   putenv("TZ=" . Options::get('timezone'));


?>
