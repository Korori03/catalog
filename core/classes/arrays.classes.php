<?php
/*
	* Korori-Gaming
	* Array Class Set
	* @Version 1.0.2
	* Developed by: Ami (亜美) Denault
*/
/*
	* Functions
	* @Since 4.0.0
*/	
class Arrays{

/*
	* Convert Numerical to Month
	* @Since 4.0.0
	* @Param (Array, String, String)
*/	
	public static function _array_sort($array, $on, $order=SORT_ASC){
		$new_array = array();
		$sortable_array = array();

		if (count($array) > 0) {
			foreach ($array as $k => $v) {
				if (is_array($v)) {
					foreach ($v as $k2 => $v2) {
						if ($k2 == $on) {
							$sortable_array[$k] = $v2;
						}
					}
				} else {
					$sortable_array[$k] = $v;
				}
			}

			switch ($order) {
				case SORT_ASC:
					asort($sortable_array);
				break;
				case SORT_DESC:
					arsort($sortable_array);
				break;
			}

			foreach ($sortable_array as $k => $v) {
				$new_array[$k] = $array[$k];
			}
		}

		return $new_array;
	}
	
/*
	* Array to STD Array
	* @Since 4.0.0
	* @Param (Array Object)
*/		
	public static function toSTD($array){
		
		if(is_array($array)){
			$object = new stdClass();
			foreach ($array as $key => $value)
				$object->$key = self::toSTD($value);
			
			return $object;
		}
		else
			return $array;
	}
	
/*
	* Array Sort
	* @Since 4.0.0
	* @Param (Array Object,String Key, Bool Sorting)
*/		
	public static function sksort(&$array, $subkey="id", $sort_ascending=false) {

	    $temp_array = array_filter(array());
		if (count($array))
			$temp_array[key($array)] = array_shift($array);

		foreach($array as $key => $val){
			$offset = 0;
			$found = false;
			foreach($temp_array as $tmp_key => $tmp_val)
			{
				if(!$found and strtolower($val[$subkey]) > strtolower($tmp_val[$subkey]))
				{
					$temp_array = array_merge(    (array)array_slice($temp_array,0,$offset),
												array($key => $val),
												array_slice($temp_array,$offset)
											  );
					$found = true;
				}
				$offset++;
			}
			if(!$found) $temp_array = array_merge($temp_array, array($key => $val));
		}

		if ($sort_ascending) $array = array_reverse($temp_array);

		else $array = $temp_array;
	}
	
/*
	* Array Replace
	* @Since 4.0.0
	* @Param (Array Object,Array Object, String)
*/	
	public static function ary_replace($ary1,$ary2,$string){
		
		if(count($ary1) !== count($ary2))
			return;
		
		for($x = 0; $x < count($ary1);$x++)
			$string = str_replace($ary1[$x],$ary2[$x],$string);
		
		return $string;
	}
}
