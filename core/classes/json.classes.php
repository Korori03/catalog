<?php

/*
	* Korori-Gaming
	* Json Class Set
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
*/

/*
	* JSON Template Class
	* @since 1.0.0
*/	

class Json {

/*
	* Encode Jason
	* @since 1.0.0
	* @Param (String Json, Int Options)
*/	
    public static function encode($value, $options = 0) {
        $result = json_encode($value, $options);
        if($result)  
            return $result;

    }

/*
	* Decode Jason
	* @since 1.0.0
	* @Param (String Json, Bool Associate)
*/	
    public static function decode($json, $assoc = false) {
        $result = json_decode($json, $assoc);
	
        if($result) 
            return $result;

    }

/*
	* Url Json to XML
	* @since 1.0.0
	* @Param (String Url)
*/		
	public function toXml ($url) {
		$fileContents= file_get_contents($url);
		$fileContents = str_replace(array("\n", "\r", "\t"), '', $fileContents);
		$fileContents = trim(str_replace('"', "'", $fileContents));
		$simpleXml = simplexml_load_string($fileContents);
		return self::encode($simpleXml);

	}

/*
	* Json to STD Array
	* @Since 4.0.0
	* @Param (String JSon)
*/	
	public static function toSTD($json){
		$array = self::decode($json,true);
		return arrays::toSTD($array);
	}
	
/*
	* STD to Json
	* @Since 4.0.1
	* @Param (String JSon)
*/	
	public static function fromSTD($std){
		$array = self::encode((array)$std);
		return $array;
	}
	

/*
	* Json into MySQL
	* @Since 4.0.0
	* @Param (String Table,String JSon)
*/		
	public static function toMySql($table,$json){
		
		$stdAry = self::decode($json,true);
		$db = Database::getInstance();

		for($x = 1; $x < count($stdAry);$x++){
			
			$key = $stdAry[$x];
			$colLen = count($stdAry[$x]);
			$VALUES ='';
			
			for($z = 0;$z < $colLen;$z++)
				$VALUES .= ($z + 1 == $colLen?'?':'?,');
		
			$query = "INSERT INTO " . $table . " VALUES ($VALUES);";
			$db->prepare($query);
			
			$index = 1;
			foreach($key as $tblColName => $value){
				$db->bindParam($index,$value);
				$index++;
			}
			if($db->execute())
				continue;
			else{
				break;
				return $db->error();
			}
			$index = 1;
		}
		return true;	
	}


	public static function getInstance($call, $params) {
		if(!empty($params)){
			if(in_array(strtolower($call), array_keys(array_change_key_case(api::$_callList,CASE_LOWER)))){
				if(array_change_key_case(api::$_callList,CASE_LOWER)[strtolower($call)] == count($params)){
					$sql = "Call " . $call ."('" . implode("','", $params) . "');";
					$query = (array)Database::getInstance()->query($sql)->results();
					api::jsonFormat(true,api::utf8ize($query));
					
				}
				else
				api::jsonFormat(false,'Invalid Params');
			}
			else
				api::jsonFormat(false,'Invalid Call');
		}
		else
			api::jsonFormat(false,'Invalid Params');
	}
			

	public static function returnJson($status,$data){
		$response = array();
		
		$response = array(
			'status' 	=> (bool)$status,
			'message' 	=> $data
		);

		header("Content-type: application/json");
		return json_encode($response);
	}
}
?>