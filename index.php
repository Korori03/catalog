<?php

/*
	* Catalog
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
*/


	require_once 'core/init.php';
	
/*
	*Get User Item
*/		
	$user 					= new User();

/*
	* Layout
	* @Since 3.2.0
*/
	$layout 				= new Template("layout.tpl");	
	
/*
	*Template Array list
*/
	$template 				= array();
	$template['leftnav'] 	= '';
	$template['rightnav'] 	= '';
	$template['content'] 	= '';
	$template['title'] 		= 'Home';
	$template['page_title'] = 'Korori-Gaming';
	
/*
	* Timeout Script
	* @Since 3.2.0
*/
	if($user->isLoggedIn()){
		$template['content'] .= $layout->readtpl('scripts/timeout.tpl');
	}
	
	if(Session::exists('msg')){
		$template['content'] .='<script type="text/javascript">$(function(){setTimeout(function(){$.jpop.alert(\'\'.Session::get(\'msg\').\'\',\'Houston County Probate Attorney Portal\',{resizable:false,icon:\'check\',close:false});}, 800);});</script>';
		Session::delete('msg');
	}

/* Call Page Action */
	$action = strings::_strtolower(Input::get('action'));

/* Concatenate Action */	
	$template['content'] .= Pages::action($action);
	
/* Set Variables for Template Output */
	$layout->setArray(array(
		'icons'				=>	$layout->readtpl('icons.tpl'),
		'title'				=>	Pages::$page_title,
		'loginicons'		=>	'',
		'navigation'		=>	WebObjects::navmenu(),
		'leftmobilenav'		=> 	WebObjects::leftmobilenav(),
		'content'			=>	$template['content'],
		'profile'			=>  WebObjects::getProfile(),
		'time'				=>	time()
	));

	echo $layout->show();

	ob_flush();
?>