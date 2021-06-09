<?php

/*
	* Korori-Gaming
	* Template Class Set
	* @Version 1.0.1
	* Developed by: Ami (亜美) Denault
*/

/*
	* Core Template Class
	* @since 1.0.0
*/	

class Template {

/*
	* Variables
	* @updates
	*	Moved Variables inside Class and had it Protected and Private to prevent un-needed access
	* @since 1.0.1
*/
	protected 	$tpl,
				$values = array();
	private $template_dir ='content/themes/', 
			$template_ext ='tpl';
	

/*
	* Construct if Class is called
	* @Update 1.0.1
	*	Added Extension Check
	* @since 1.0.0
*/
	public function __construct($tpl) {
		$file_parts = pathinfo($tpl);
		if(strtolower($file_parts['extension']) == 'tpl')
			$this->tpl = $this->template_dir . Options::get('template') .'/'. $tpl;
	}

/*
	* Set Key file to Value
	* @since 1.0.0
*/	
	public function set($key, $value) {
		$this->values[$key] = trim($value);
	}

/*
	* Set Key file to Value from an Array
	* @since 1.0.1
*/	
	public function setArray($array){
		foreach($array as $key=>$value){
			$this->values[$key] = trim($value);
		}	
	}

/*
	* Return Template 
	* @Update 1.0.3
	*	Changed Output to Show
	* 	Now can do basic Conidtional Statement
	* @since 1.0.0
*/	
	public function show() {
		if (!file_exists($this->tpl)) 
			return "Error loading template file (".$this->tpl.")<br />";
		
		$message = file_get_contents($this->tpl);
	
		preg_match_all('/\[IF \{([^\}]*)\}\](.[^\]]+)(?:\[ELSE\](.+?))?\[ENDIF\]/s',$message,$matches);
		if ( empty($matches) ) {
			return $message;
		}
		
		$math_tag = '';
		foreach ( $matches[0] as $m_index => $match )
		{
			$math_tag =  trim($matches[1][$m_index]);
			//IF
			if ( !empty($tags[$math_tag]) ) {
				$message = str_replace($match, $matches[2][$m_index], $message);
			//ELSE
			} elseif( empty($tags[$math_tag]) && $matches[3][$m_index] ) {
				$message = str_replace($match, $matches[3][$m_index], $message);
			//If it does not contain a conditional statment
			} else {
				$message = str_replace($match, '', $message);
			}
		}
		
		//Replace Keys with Values
		foreach ($this->values as $key => $value) {
			$tagToReplace = "[@$key]";
			$message = str_replace($tagToReplace, $value, $message);
		}
		return $message;
	}
	
	public function readtpl($tpl_temp){
		$extension = explode('.',$tpl_temp);
		$extension = end($extension);
		if(strtolower($extension) == 'tpl'){
			if (!file_exists($this->template_dir . Options::get('template') . '/'.$tpl_temp)) 
				return "Error loading template file <br />";
			else{
				$content = file_get_contents($this->template_dir . Options::get('template') . '/'.$tpl_temp);

				return $content;
			}
		}
	}

}
?>