<?php
/*
	* Korori-Gaming
	* Strings Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Strings
	* @Since 4.0.0
*/	
class Strings{

/*
	* Timestamp Conversion Date
	* @Since 1.1.4
	* @Param (String)
*/	
	public static function toProperDate($string,$strConv = true){
		if($strConv)
			return date('jS \of F Y',strtotime($string));
		else
			return date('jS \of F Y',$string);
	}
	
	public static function toDateTime($string,$strConv = true){
		if($strConv)
			return date('m-d-Y H:i:s',strtotime($string));
		else
			return date('m-d-Y H:i:s',$string);
	}
	
	public static function toDateTimeMysql($string,$strConv = true){
		if($strConv)
			return date('Y-m-d H:i:s',strtotime($string));
		else
			return date('Y-m-d H:i:s',$string);
	}
	
	public static function toDate($string,$strConv = true){
		if($strConv)
			return date('m-d-Y',strtotime($string));
			
		else
			return date('m-d-Y',$string);
	}
	public static function toDateYMD($string,$strConv = true){
		if($strConv)
			return date('Y-m-d',strtotime($string));
		else
			return date('Y-m-d',$string);
	}
	/*
	* Convert Numerical to Month
	* @Since 2.2.8
	* @Param (String)
*/
	public static function toMonthName($intMonth) { 
		$month = array(0=>'',1=>'January',2=>'February',3=>'March',4=>'April',5=>'May',6=>'June',7=>'July',8=>'August',9=>'September',10=>'October', 11=>'November',12=>'December'); 
		return $month[$intMonth];
	}

/*
	* Phone Href Replacement
	* @Since 4.0.0
	* @Param (Array, String, String)
*/		
	public static function toPhoneHref($buffer) {
		return str_replace(array(".","-"),'',$buffer);
	}
	
/*
	* String Options
	* @Since 4.0.0
	* @Param (String)
*/	
	public static function string_options($options = 'javascript'){
		$obj = Json::decode(Options::get($options));
		$return_options ='';
		
		foreach ($obj as $name => $value) {
			
			if($options =='javascript')
				$return_options.='<!--' . $name . '--><script src="'.$value.'" type="text/javascript"></script>';
			else if($options =='css')
				$return_options.='<!--' . $name . '--><link href="'.$value.'" media="screen" rel="stylesheet" type="text/css" />';
		}
		return $return_options;
	}
	
/*
	* Extension Allowed
	* @Since 2.2.8
	* @Param (File String, Extension String)
*/
	public static function allowedExt($string, $ext = 'jpg,jpeg,gif,png'){
		
		$extension =  self::_extension($string);	

		$all_types = explode(",",$ext);
		if($ext) {
			if(in_array($extension,$all_types))		
				return true;	
		}
		return false;
	
	}

/*
	* Current Time
	* @Version 1.0.0
	* @Since 4.0.6
	* @Param (String)
*/	
	public static function _currenttime( $type, $gmt = 0 ) {
		switch ( $type ) {
			case 'mysql':
				return ( $gmt ) ? gmdate( 'Y-m-d H:i:s' ) : gmdate( 'Y-m-d H:i:s', ( time() + ( Options::get( 'gmt_offset' ) * Config::get('time/HOUR_IN_SECONDS') ) ) );
			case 'timestamp':
				return ( $gmt ) ? time() : time() + ( Options::get( 'gmt_offset' ) * Config::get('time/HOUR_IN_SECONDS') );
			default:
				return ( $gmt ) ? date( $type ) : date( $type, time() + ( Options::get( 'gmt_offset' ) * Config::get('time/HOUR_IN_SECONDS') ) );
		}
	}


/*
	* Formate String
	* @Since 2.1.4
	* @Param (String)
*/	
	public static function _format($string){
		return ucwords(self::_strtolower(trim($string)));
	}
	
/*
	* Format Money
	* @Since 2.1.4
	* @Param (String Number,Boolean Fraction)
*/
	public static function _money($number, $fractional=false,$symbol=true) { 	
		if ($fractional) { 
			$number = sprintf('%.2f', $number); 
		} 
		while (true) { 
			$replaced = preg_replace('/(-?\d+)(\d\d\d)/', '$1,$2', $number); 
			if ($replaced != $number) { 
				$number = $replaced; 
			} else { 
				break; 
			} 
		} 
		return ($symbol?'$':''). $number; 
	} 


/*
	* Get Extension of File
	* @Since 2.2.8
	* @Param (String)
*/	
	public static function _extension($str) {
		return @end(explode('.',$str));
	}


/*
	* Strip Slashes
	* @Since 4.0.2
	* @Param (String)
*/		
	public static function _stripslashes ($str) {
		if (is_array($str)) {
			return array_map('stripslashes', $str);
		}
		return stripslashes($str);
	}

/*
	* Add Slashes
	* @Since 4.0.2
	* @Param (String)
*/
	public static function _addslashes ($str) {
		if (is_array($str)) 
			return array_map('addslashes', $str);
		
		return addslashes($str);
	}

/*
	* Trim String
	* @Since 4.0.2
	* @Param (String,Char List)
*/
	public static function _trim ($str, $charlist = " \t\n\r\0\x0B") {
		if (is_array($str)) {
			foreach ($str as &$s) 
				$s = trim($s, $charlist);
			
			return $str;
		}
		return trim($str, $charlist);
	}

/*
	* Left Trim String
	* @Since 4.0.2
	* @Param (String,Char List)
*/
	public static function _ltrim ($str, $charlist = " \t\n\r\0\x0B") {
		if (is_array($str)) {
			foreach ($str as &$s) 
				$s = ltrim($s);
			
			return $str;
		}
		return ltrim($str, $charlist);
	}

/*
	* Right Trim String
	* @Since 4.0.2
	* @Param (String,Char List)
*/
	public static function _rtrim ($str, $charlist = " \t\n\r\0\x0B") {
		if (is_array($str)) {
			foreach ($str as &$s) 
				$s = rtrim($s, $charlist);
			
			return $str;
		}
		return rtrim($str, $charlist);
	}

/*
	* Substring String
	* @Since 4.0.2
	* @Param (String,Int Start,int Length)
*/
	public static function _substr ($string, $start, $length = null) {
		if (is_array($string)) {
			foreach ($string as &$s) 
				$s = self::_substr($s, $start, $length);
			
			return $string;
		}
		if ($length) 
			return substr($string, $start, $length);

		return substr($string, $start);
	}

/*
	* To Lower
	* @Since 4.0.2
	* @Param (String)
*/	
	public static function _strtolower ($string) {
		
		if (is_array($string)) {
			
			return array_map('strtolower', $string);
			
		}
		return strtolower($string);
	}

/*
	* To Upper
	* @Since 4.0.2
	* @Param (String)
*/		
	public static function _strtoupper ($string) {
		if (is_array($string)) 
			return array_map('strtoupper', $string);
		
		return strtoupper($string);
	}

/*
	* Preg Match
	* @Since 4.0.2
	* @Param (String Pattern,String Input,Reference Matches, PREG_ OPTION, Int Offset )
*/		
	public static function _preg_match ($pattern, $subject, &$matches = null, $flags = 0, $offset = 0) {
		if (strpos($pattern, '/') === false && strpos($pattern, '#') === false) 
			return false;
		
		$pattern = trim($pattern);
		return preg_match($pattern, $subject, $matches, $flags, $offset);
	}
	
/*
	* Preg Replace
	* @Since 4.0.2
	* @Param (String Pattern,String Input, String/Array for Search,Int Limit, Int Number of Replacements Done)
*/		
	public static function _preg_replace ($pattern, $replacement, $subject, $limit = -1, &$count = null) {
		if (strpos($pattern, '/') === false && strpos($pattern, '#') === false) 
			return false;

		$pattern = trim($pattern);
		return preg_replace($pattern, $replacement, $subject, $limit, $count);
	}
	
/*
	* Truncate String
	* @Since 4.0.2
	* @Param (String text, Length of Returned Text, String to Concat with, Bool Exact Match, Bool Check for HTML)
*/		
	public static function _truncate ($text, $length = 1024, $ending = '...', $exact = false, $considerHtml = true) {
		$open_tags = [];
		if ($considerHtml) {
			if (strlen(preg_replace('/<.*?>/', '', $text)) <= $length) {
				return $text;
			}
			preg_match_all('/(<.+?>)?([^<>]*)/s', $text, $lines, PREG_SET_ORDER);
			$total_length = mb_strlen($ending);
			$truncate     = '';
			foreach ($lines as $line_matchings) {
				if (!empty($line_matchings[1])) {
					if (preg_match('/^<(\s*.+?\/\s*|\s*(img|br|input|hr|area|base|col|frame|link|meta|param)(\s.+?)?)>$/is', $line_matchings[1])) {
					} else if (preg_match('/^<\s*\/([^\s]+?)\s*>$/s', $line_matchings[1], $tag_matchings)) {
						$pos = array_search($tag_matchings[1], $open_tags);
						if ($pos !== false) {
							unset($open_tags[$pos]);
						}
					} else if (preg_match('/^<\s*([^\s>!]+).*?>$/s', $line_matchings[1], $tag_matchings)) {
						array_unshift($open_tags, mb_strtolower($tag_matchings[1]));
					}
					$truncate .= $line_matchings[1];
				}
				$content_length = mb_strlen(preg_replace('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|&#x[0-9a-f]{1,6};/i', ' ', $line_matchings[2]));
				if ($total_length + $content_length > $length) {
					$left            = $length - $total_length;
					$entities_length = 0;
					if (preg_match_all('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|&#x[0-9a-f]{1,6};/i', $line_matchings[2], $entities, PREG_OFFSET_CAPTURE)) {
						foreach ($entities[0] as $entity) {
							if ($entity[1] + 1 - $entities_length <= $left) {
								$left--;
								$entities_length += mb_strlen($entity[0]);
							} else {
								break;
							}
						}
					}
					$truncate .= mb_substr($line_matchings[2], 0, $left + $entities_length);
					break;
				} else {
					$truncate .= $line_matchings[2];
					$total_length += $content_length;
				}
				if ($total_length >= $length) {
					break;
				}
			}
		} else {
			if (mb_strlen($text) <= $length) {
				return $text;
			}
			$truncate = mb_substr($text, 0, $length - mb_strlen($ending));
		}
		if (!$exact) {
			$spacepos = mb_strrpos($truncate, ' ');
			if (isset($spacepos)) {
				$truncate = mb_substr($truncate, 0, $spacepos);
			}
		}
		$truncate .= $ending;
		if ($considerHtml) {
			foreach ($open_tags as $tag) {
				$truncate .= "</$tag>";
			}
		}
		return $truncate;
	}
	
/*
	* Get Keywords from String
	* @Since 4.0.2
	* @Param (String)
*/
	public static function getkeywords ($text) {
		return implode(', ',self::_trim(explode(' ',str_replace([',', '.', '!', '?', '-', '–', '&'], '', $text))));
	}
/*
	* Convert to Website Link Title
	* @Since 2.1.4
	* @Param (String)
*/
	public static function parser_ascii_to_html_title($string) { 
		$string = self::ascii_convert($string);
		$string = str_replace(array(' @ '), ' ',$string);
		$string = str_replace(array('!','?',':#40:',':#41:','&#40;','&#41;'), '',$string);
		$string = preg_replace('#[^\w/.%\-&/]#',"_",$string);
		$string = str_replace(array('(',')','&','/','*', '\\','_42_'), '',$string);
		$string = preg_replace('#[?.]#',"",$string);
		return self::_strtolower($string);																//Return String
	}
	
/*
	* Convert from Ascii
	* @Since 2.1.4
	* @Param (String)
*/	
	public static function ascii_convert($string){
		$ascii = array('@:#([0-9]{2,3}):@' => '&#$1;','@:amp:@' => '&amp;','@:quot:@'=>'\'');
		foreach ($ascii as $search => $replace)  								
			$string = preg_replace($search, $replace, $string);	
			
		return $string;
	}	
	
	public static function FileSizeConvert($bytes)
	{
		$bytes = floatval($bytes);
			$arBytes = array(
				0 => array(
					"UNIT" => "TB",
					"VALUE" => pow(1024, 4)
				),
				1 => array(
					"UNIT" => "GB",
					"VALUE" => pow(1024, 3)
				),
				2 => array(
					"UNIT" => "MB",
					"VALUE" => pow(1024, 2)
				),
				3 => array(
					"UNIT" => "KB",
					"VALUE" => 1024
				),
				4 => array(
					"UNIT" => "B",
					"VALUE" => 1
				),
			);

		foreach($arBytes as $arItem)
		{
			if($bytes >= $arItem["VALUE"])
			{
				$result = $bytes / $arItem["VALUE"];
				$result = str_replace(".", "," , strval(round($result, 2)))." ".$arItem["UNIT"];
				break;
			}
		}
		return $result;
	}
}

?>