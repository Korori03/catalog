<?php

/*
	* Catalog
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
	* Page Library Functions
*/

/*
	* Setup Cpanel Class
	* @since 1.0.0
*/
class Cpanel{

/*
	* Page Title Global Variable
*/	
	public static $page_title 	= 'Home';
	public static $userid 		= 0;
	public static $data64 		= 'data:image/png;base64,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';


	public static function home(){
		$game 		= new Template("cpanel.tpl");
		return $game->show();
	}

	public static function Item($type, $subtype = NULL,$item = NULL,$subnestedtype = NULL){
		if($subnestedtype !== NULL && !empty($subnestedtype)){
			if(method_exists('Cpanel', ucfirst($type) .(ucfirst(Input::get('command'))))){
				return eval('return Cpanel::' .ucfirst($type) .(ucfirst(Input::get('command'))) . '($subtype,$subnestedtype);');
			}else
				return $type .(ucfirst(Input::get('command'))).' function is missing for '. $subtype .'/'.$subnestedtype;
		}
		else if($subtype !== NULL && !empty($subtype)){
			
			if(method_exists('Cpanel', ucfirst($type) .(ucfirst(Input::get('command')))))
				return eval('return Cpanel::' .ucfirst($type)  .(ucfirst(Input::get('command'))).'($subtype);');
			else
				return $type .(ucfirst(Input::get('command'))).' function is missing for '. $subtype;
		}		
	}
	
	public static function GamesEdit(){
	
		$sql 		= "SELECT * FROM games WHERE id = '".Input::get('edit')."';";
		$gameItem 	= Database::getInstance()->query($sql)->first();
		
		$game 		= new Template("gamesedit.tpl");
		
		$brand 		= Cpanel::getSubitem(Input::get('type'),$gameItem->brand);
		$system 	= Cpanel::getSubitem2(Input::get('type'),Input::get('subtype'),$gameItem->system);
		$region 	= Cpanel::getRegion($gameItem->region);
		$playmode 	= Cpanel::getPlaymode($gameItem->playmode);
		
		$breadcrumbs = array('games',$gameItem->brand,$gameItem->system);
		list($genrelist,$genrerl) = Cpanel::getDynamic('games','genre',$gameItem->genre);
		list($developerlist,$developerrl) = Cpanel::getDynamic('games','developer',$gameItem->developer);
		list($publisherlist,$publisherrl) = Cpanel::getDynamic('games','publisher',$gameItem->publisher);
		
		$image =  (isset($_SERVER['HTTPS'] )? 'https://':'http://') . $_SERVER['HTTP_HOST'] . '/content/uploads/' .$gameItem->id . '_' .Slug::url_slug($gameItem->name) . '_' .Slug::url_slug($gameItem->region == 'United States'?'usa':($gameItem->region == 'Japanese'?'japan':$gameItem->region)). '.jpg';
		if (!@fopen($image,'r')) 
			$image = self::$data64;

		$game->setArray(array(
			
			'gameid'		=>	$gameItem->id,
			'name'			=>	$gameItem->name,
			'brand'			=>	$brand,
			'system'		=>	$system,
			'developerlist'	=>	$developerlist,
			'developerrl'	=>	$developerrl,
			'publisherlist'	=>	$publisherlist,
			'publisherrl'	=>	$publisherrl,
			'release_date'	=>	(!empty(trim($gameItem->release_date))?Strings::toDate($gameItem->release_date):''),
			'rating'		=>	$gameItem->rating,
			'genrelist'		=>	$genrelist,
			'genrerl'		=>	$genrerl,
			'region'		=>	$region,
			'image'			=>	$image,
			'playmode'		=>	$playmode,
			'download'		=>	$gameItem->download,
			'vr'			=>	$gameItem->vr == 1 || strtoupper($gameItem->vr) == 'Y'?'checked="checked"':'',
			'finished'		=>	$gameItem->finished == 1 || strtoupper($gameItem->finished) == 'Y'?'checked="checked"':'',
			'barcode'		=>	$gameItem->barcode,
			'cover'			=>	$gameItem->cover == 1 || strtoupper($gameItem->cover) == 'Y'?'checked="checked"':'',
			'instructions'	=>	$gameItem->instructions == 1 || strtoupper($gameItem->instructions) == 'Y'?'checked="checked"':'',
			'box'			=>	$gameItem->box == 1 || strtoupper($gameItem->box) == 'Y'?'checked="checked"':'',
			'steelbook'		=>	$gameItem->steelbook == 1 || strtoupper($gameItem->steelbook) == 'Y'?'checked="checked"':'',
			'breadcrumb'	=>	Webobjects::getBreadCrumbs($breadcrumbs) .'<li class="breadcrumb-item active"><a href="/games/'.Slug::url_slug($gameItem->brand).'/'.Slug::url_slug($gameItem->system).'/'.$gameItem->id.'-'.Slug::url_slug($gameItem->name).'">'.$gameItem->name.'</a></li>'
		));
		self::$page_title 	= 'Games' ;
		return $game->show();
	}
	
	public static function GamesAdd(){ 
		/*
			[action] = items
			[type] = games
			[subtype] = nintendo
			[subnestedtype] = switch
			[command] = add
		*/
		print_r($_GET);
	}
	
	public static function MusicEdit(){ 
		print_r($_GET);
	}
	
	public static function MusicAdd(){ 
		print_r($_GET);
	}
	
	public static function VideosEdit(){ 
		print_r($_GET);
	}
	
	public static function BooksAdd(){ 
		print_r($_GET);
	}
	
	public static function BooksEdit(){
		print_r($_GET);	
	}
	
	public static function getSubitem($main,$selected = NULL){
		$sql = "SELECT * FROM `categories` WHERE LOWER(`main`) = LOWER('".$main."') GROUP BY subitem;";
		$b = Database::getInstance()->query($sql);
		$li = '';
		foreach($b->results() as $c)
			$li .= '<option value="'.$c->subitem.'" ' . ($selected == $c->subitem?'selected="selected"':''). '>'.$c->subitem.'</option>';
		
		return $li;
	}
	
	public static function getSubitem2($main,$subtype,$selected = NULL){
		$sql = "SELECT * FROM `categories` WHERE LOWER(`main`) = LOWER('".$main."') AND LOWER(`subitem`) = LOWER('".$subtype."') ORDER BY subitem2;";
		$b = Database::getInstance()->query($sql);
		$li = '';
		foreach($b->results() as $c)
			$li .= '<option value="'.$c->subitem2.'" ' . ($selected == $c->subitem2?'selected="selected"':''). '>'.$c->subitem2.'</option>';
		
		return $li;
	}
	
	
	public static function getRegion($selected){
		$sql = "SELECT region FROM games GROUP BY region ORDER BY region";
		$b = Database::getInstance()->query($sql);
		$li = '';
		foreach($b->results() as $c)
			$li .= '<option value="'.$c->region.'" ' . ($selected == $c->region?'selected="selected"':''). '>'.$c->region.'</option>';
		
		return $li;
	}
	
	public static function getPlaymode($playmode){
		$p	= array('Single Player','MultiPlayer','Cooperative');
		$e	= explode(';',$playmode);
		$c = '';
		foreach($p as $l)
			$c .= '<div><label style=" display: inline-block;height: 30px;padding-right: 10px;white-space: nowrap;"><input type="checkbox" name="check" value="'.$l.'" class="chkPlaymode" '.(in_array($l,$e)?'checked="checked"':'').' style=" vertical-align: middle;"><span style="vertical-align: middle;font-size: 13px;">'.$l.'</span></label></div>';
		
		return $c;
	}
	
	
	public static function getDynamic($table,$col,$genre){
		
		$items = array_map('trim', explode(';', $genre));
		$sql = "select distinct trim(substring_index(substring_index(" .$col . ", ';', n.n), ';', -1)) as val from " . $table. " t cross join (select 1 as n union all select 10 ) n order by val ASC";
		$g = Database::getInstance()->query($sql);
		$fulllist = '';
		foreach($g->results() as $gl){
			if(!empty($gl->val))
				$fulllist .='<div class="tagobject'.$col.'"><label style=" display: inline-block;height: 30px;padding-right: 10px;white-space: nowrap;"><input type="checkbox" name="'.$col. 'list" class="'.$col.'list" value="' .$gl->val .'" '.(in_array($gl->val,$items)?'checked="checked"':'')	.' style=" vertical-align: middle;"><span style="vertical-align: middle;font-size: 13px;">' .$gl->val .'</span></label></div>';		
		}	
		return array($fulllist,trim(implode(',',$items)));		
	}
};



?>