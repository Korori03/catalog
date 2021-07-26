<?php

/*
	* Catalog
	* @Version 1.0.1
	* Developed by: Ami (亜美) Denault
	* Web Objects Library Functions
*/

/*
	* Setup WebObjects Class
	* @since 4.0.0
*/
class WebObjects{

/*
	* Navigation Menu
	* @since 3.1.2	
*/	
	public static function navmenu(){
	
		$user 	= new User();
		$layout = new Template("navigation.tpl");
		
		$action = strtolower(Input::get('action'));
		

		if($user->isLoggedIn()){
			
			$li = ' <ul class="acc-menu"> <li class="nav-separator"><span>Navigation</span></li> ';
			$li .= '<li><a href="/"><i class="icon s-18"><svg><use xlink:href="#icon-home"></use></svg> </i><span>Home</span></a></li>';	
			$sql = "SELECT * FROM categories ORDER BY main,mainsort,subsort ASC";
			
			$tcat = Database::getInstance()->query($sql);
			$results = $tcat->results();
			$maintitle = $subtitle = '';
			for($x = 0;$x < count($results);$x++){
			
				if($maintitle !== strtolower($tcat->results()[$x]->main)){
					$li .= '<li class="hasChild"><a href="javascript:;"><i class="icon s-18"><svg><use xlink:href="#icon-'. Slug::_url(strtolower($tcat->results()[$x]->main)).'"></use></svg> </i><span>'.$tcat->results()[$x]->main.'</span></a>';
					$li .= '<ul class="acc-menu" style="display: none;">';
					$li .= '<li><a href="/'. Slug::_url(strtolower($tcat->results()[$x]->main)) .'"><span>'.$tcat->results()[$x]->main. ' ' . 'Main Page</span></a></li>';	

					$maintitle = strtolower($tcat->results()[$x]->main);
				}

				if($subtitle !== strtolower($tcat->results()[$x]->subitem)){
					$li .= '<li><a href="/' . Slug::_url($tcat->results()[$x]->main) . '/' . Slug::_url($tcat->results()[$x]->subitem)  .'">' . $tcat->results()[$x]->subitem .'</a> </li>';
					$subtitle = strtolower($tcat->results()[$x]->subitem);
				}
				
				if(count($results) - 1 == $x || $maintitle !== strtolower($tcat->results()[$x  + 1]->main))
					$li .= '</ul></li>';
					
			}	

			if($user->hasPermission('admin'))
				$li .= '<li><a href="/cpanel"><i class="ti ti-panel"></i><span>Control Panel</span></a></li>';	

				
			$li .= '<li><a href="/profile"><i class="ti ti-user"></i><span>Profile</span></a></li>';		
			$li .= '<li><a href="/members"><i class="ti ti-layout-grid2"></i><span>Members Collections</span></a></li>';	
			$li .= '<li><a href="/logout"><i class="ti ti-shift-right"></i><span>Logout</span></a></li>';					
		}

		else{
			$li = ' <ul class="acc-menu"> <li class="nav-separator"><span>Navigation</span></li> ';
			$li .= '<li><a href="/"><i class="icon s-18"><svg><use xlink:href="#icon-home"></use></svg> </i><span>Home</span></a></li>';	
			$li .= '<li><a href="/members"><i class="ti ti-user"></i><span>Members Collections</span></a></li>';	
			$li .= '<li><a href="/login"><i class="ti ti-panel"></i><span>Login</span></a></li>';
			$li .= '</ul>';

		}
		return  $li;
	}
	
	public static function leftmobilenav(){
		$user 	= new User();

		$li = '';
		if($user->isLoggedIn()){
			
			$li = ' <ul class="mobile" style="display: none;"> ';
			
			$li .= '<li class="menu-item menu-item-type-post_type menu-item-object-page" onclick="window.location.href = \'/\';"><a href="/">Home</a> </li>';

			//Note in a new DB
			$sql = "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));";
		
			$tcat = Database::getInstance()->query($sql);
			
			$sql = "SELECT * FROM categories GROUP BY main ORDER BY main,mainsort,subsort ASC";
		
			$tcat = Database::getInstance()->query($sql);
			$results = $tcat->results();
			$maintitle = $subtitle = '';
			for($x = 0;$x < count($results);$x++){
				$li .= '<li class="menu-item menu-item-type-post_type menu-item-object-page" onclick="window.location.href = \'/'. Slug::_url(strtolower($tcat->results()[$x]->main)).'\';"><a href="/'. Slug::_url(strtolower($tcat->results()[$x]->main)).'">'.$tcat->results()[$x]->main.'</a> </li>';			
			}	
			if($user->hasPermission('admin'))
				$li .= '<li><a href="/cpanel"><span>Control Panel</span></a></li>';

			$li .= '<li><a href="/profile"><span>Profile</span></a></li>';
			$li .= '<li><a href="/members"><span>Members Collections</span></a></li>';
			$li .= '<li><a href="/logout"><span>Logout</span></a></li>';		
			
		}
		
		else{
			$li = ' <ul class="mobile" style="display: none;"> ';
			$li .= '<li class="menu-item menu-item-type-post_type menu-item-object-page" onclick="window.location.href = \'/\';"><a href="/">Home</a> </li>';
			$li .= '<li><a href="/members"><span>Members Collections</span></a></li>';
			$li .= '<li><a href="/login"><span> Login</span></a></li>';
			$li .= '</ul>';
		}
		return  $li;
	}

	public static function getProfile(){
		$user 	= new User();

		$li = '';
		if($user->isLoggedIn()){
				return '<ul class="nav navbar-nav toolbar pull-right">
						<li class="dropdown toolbar-icon-bg">
						   <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="icon-bg"><i class="ti ti-user"></i></span></a>
						   <ul class="dropdown-menu userinfo arrow">
							  <li><a href="#/"><i class="ti ti-user"></i><span>Profile</span></a></li>
							  <li><a href="#/"><i class="ti ti-settings"></i><span>Settings</span></a></li>
							  <li class="divider"></li>
							  <li class="divider"></li>
							  <li><a href="#/"><i class="ti ti-shift-right"></i><span>Sign Out</span></a></li>
						   </ul>
						</li>
					 </ul>';
		}
		else{
			return '';

		}
	}
	public static function getBreadCrumbs($breadcrumbs){
		$li = $url ='';
		$last = count($breadcrumbs) - 1;
		$getUser = Input::get('user');
		$li = $getUser?'<li class="breadcrumb-item"><a href="/' .$getUser. '">' . ucwords(str_replace('_',' ',$getUser)) .' </a></li>':'';

		for($x = 0;$x < count($breadcrumbs);$x++){
			$url  .= ($x <= $last && $x > 0?'/':'') . Slug::_url($breadcrumbs[$x])  ;
			$li .= '<li class="breadcrumb-item '.($x == $last?'active':'') . '"><a href="/' .($getUser?$getUser.'/':''). $url . '">' . ucwords(str_replace('_',' ',$breadcrumbs[$x])) .' </a></li>';
		}
		return $li;
	}

	public static function getBreadCrumbsLink($breadcrumbs){
		$li = $url ='';
		$last = count($breadcrumbs) - 1;
		for($x = 0;$x < count($breadcrumbs);$x++){
			$url  .= ($x <= $last && $x > 0?'/':'') . $breadcrumbs[$x]  ;
			$li = $url;
		}
		return $li;
	}
	public static function setTitle($title){
		return ucwords(str_replace('_',' ',$title));
	}

	
/*
	* Region Short 
	* @Since 1.0.0
	* @Param (Region String)
*/
	public static function regionShort($region){
		switch(strtolower($region)){
			case "united states":
				return "usa";
			default:
				return strtolower($region);
		}
	}

/*
* Objects to Tags
* @Since 1.0.0
* @Param (Region Array,Url String)
*/	
	public static function createList($genres,$url)
	{
		$genreLinks = '';
		$genre = explode(';',$genres);
		$tpltag =  new Template("tag_n.tpl");			
		foreach($genre as $genre_item){
			if(trim($genre_item) != ''){
				$tpltag->setArray(array('url'=>$url.'/'. Slug::_url($genre_item),'tag'=>ucfirst($genre_item)));
				$genreLinks .= $tpltag->show();
			}
		}
		return $genreLinks;
	}
}


?>