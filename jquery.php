<?php

/*
	* Catalog
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
	* Jquery Library Functions
*/


require_once 'core/init.php';
	
/* Create Jquery Class */
class Jquery{

/* Default Class */
   function Jquery(){
	   
		/* Web Functions */	   
		if(Input::get('sublogin'))
			$this->procLogin();

		else if(Input::get('getsubitem2'))
			$this->procGetSubItem2();
	
	
		else if(Input::get('subEditGame'))
			$this->procEditGame();
	
		/* Empty Return if Not Found */
		else
			echo "";
	}


/*
	* Process Login Function
	* @Version 1.1.0
*/
	private function procLogin(){

	/*
		Create Validate Class Instance for Post Variables
	*/
			$validate 			= new Validate();
		
	/*
		Pass Post into Validate Class
	*/
			$validation 		= $validate->check($_POST,
					array(
						'username'=>array('required'=>true,'name'=>'Username'),
						'password'=>array('required'=>true,'name'=>'Password'),
						'remember'=>array('required'=>true,'name'=>'Remember')
					));
	
	/*
		No errors found in Validate Class
	*/
			if($validation->passed()){
				
	/*
		Create User Class Instance for User Validation
	*/			
				$user 			= new User();
			
	/*
		Check if Valid User
	*/
				$login 			= $user->login(Input::get('username'),Input::get('password'),(Input::get('remember')== 1?true:false));
				/*
		Return Json Object for jQuery
	*/
				echo Json::returnJson($login,($login?'true':false.'Sorry, Unable to login.'). $login);
				
			}else{
				
	/*
		Return Json Object for jQuery
	*/			
				echo Json::returnJson(false,implode('<br/>',$validation->errors()));
			}
	}
		
	private function procGetSubItem2(){
		
		echo Cpanel::getSubitem2(Input::get('main'),Input::get('subitem'));
	}
	
	private function procEditGame(){
		$user = new User();
		$validate = new Validate();
		if($user->isLoggedIn()){
			$validation = $validate->check($_POST,array(
				'name'	=>	array('name'=>'Name','required'=>true,'min'=>1,'max'=>500),
				'brand'=>	array('name'=>'Brand','required'=>true,'min'=>1,'max'=>250),
				'systems'	=>	array('name'=>'System','required'=>true,'min'=>1,'max'=>500),
				'gameid'	=>	array('name'=>'Error','required'=>true),
				'publisher'	=>	array('name'=>'Pubisher','min'=>1,'max'=>250),
				'developer'	=>	array('name'=>'Developer','min'=>1,'max'=>250),
				'releaseDate'=>	array('name'=>'Release Date','min'=>1,'max'=>250),
				'rating'	=>	array('name'=>'Rating','min'=>1,'max'=>500),
				'genre'	=>	array('name'=>'Genre','min'=>1,'max'=>500),
				'download'	=>	array('name'=>'Download','min'=>1,'max'=>500),
				'playmode'=>	array('name'=>'Playmode','min'=>1,'max'=>500),
				'box'	=>	array('name'=>'Box','min'=>1,'max'=>1),
				'cover'	=>	array('name'=>'Cover','min'=>1,'max'=>1),
				'vr'=>	array('name'=>'VR','min'=>1,'max'=>1),
				'finished'	=>	array('name'=>'Finished','min'=>1,'max'=>1),
				'barcode'	=>	array('name'=>'Barcode','min'=>1,'max'=>25),
				'steelbook'=>	array('name'=>'Steelbook','min'=>1,'max'=>1),
				'instructions'	=>	array('name'=>'Instructions','min'=>1,'max'=>1)
			));

			if($validation->passed()){
				$name 			= Input::get('name');
				$brand 			= Input::get('brand');
				$systems 		= Input::get('systems');
				$developer 		= Input::get('developer');
				$publisher 		= Input::get('publisher');
				$releaseDate 	= Input::get('releaseDate');
				$rating 		= Input::get('rating');
				$download 		= Input::get('download');
				$genre 			= Input::get('genre');
				$playmode 		= Input::get('playmode');
				$region 		= Input::get('region');
				$box 			= Input::get('box');
				$cover 			= Input::get('cover');
				$vr 			= Input::get('vr');
				$finished 		= Input::get('finished');
				$barcode 		= Input::get('barcode');
				$steelbook 		= Input::get('steelbook');
				$instructions 	= Input::get('instructions');
				
				$sql = "UPDATE games SET
					`name` 		= '".$name."',
					`brand` 		= '".$brand."',
					`system` 		= '".$systems."',
					`developer` 	= '".implode(';',(explode(',',$developer)))."',
					`publisher` 	= '".implode(';',(explode(',',$publisher)))."',
					`release_date` = '".(!empty(trim($releaseDate))?Strings::toDateYMD($releaseDate):'')."',
					`rating`		= '".$rating."',
					`genre` 		= '".implode(';',(explode(',',$genre)))."',
					`region` 		= '".$region."',
					`playmode` 	= '".implode(';',(explode(',',$playmode)))."',
					`download` 	= '".$download."',
					`vr` 			= '".($vr == 'Y'?'Y':'N')."',
					`finished` 	= '".($finished == 'Y'?'Y':'N')."',
					`barcode` 	= '".$barcode."',
					`cover` 		= '".($cover == 'Y'?'Y':'N')."',
					`instructions` = '".($instructions == 'Y'?'Y':'N')."',
					`box` 		= '".($box == 'Y'?'Y':'N')."',
					`steelbook` 	= '".($steelbook == 'Y'?'Y':'N')."'
					WHERE id = '".Input::get('gameid')."';";
					Database::getInstance()->query($sql);
					echo $sql;
					//echo Json::returnJson(true,'Updated Game');
			}
			else{
				echo Json::returnJson(false,implode('<br/>',$validation->errors()));
			}
		}
		
		
	}
	
	
	
};
$jquery = new Jquery;
?>