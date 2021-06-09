<?php
/*
	* Catalog
	* @Version 1.0.0
	* Developed by: Ami (亜美) Denault
	* API Games Functions
*/
class Games{
  
    private static $table_name = "games";
	public static $columns = array();
	
/*
	* Construct to create Column Array Games
	* @ Version 1.0.0
*/	
	public function __construct(){
		$sql = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='".Config::get('mysql/db')."'  AND `TABLE_NAME`='" . self::$table_name. "'";
		self::$columns = array_column(Database::getInstance()->query($sql)->results(), 'COLUMN_NAME');
	}

/*
	* Insert data into Games
	* @ Version 1.0.0
	* @ Param (Object)
*/	
	public function create($data){
		list($set,$where) = API::APISetup(self::$columns,$data->data,'set');
		
		$query = "INSERT INTO " . self::$table_name ." SET " .  $set;
		return API::submit($data,self::$columns,$query); 
	}
	
/*
	* Select data into Games
	* @ Version 1.0.0
	* @ Param (Object)
*/	
	public function search($data){
		return self::selectSearch($data);
	}
/*
	* Select data into Games
	* @ Version 1.0.0
	* @ Param (Object)
*/	
	public function select($data){
		return self::selectSearch($data);
	}

/*
	* Select Function
	* @ Version 1.0.0
	* @ Param (Object)
*/
	public function selectSearch($data){
		list($where,$update) = API::APISetup(self::$columns,$data->data);
		$LIMITQ  ='';
		if(isset($data->per) && isset($data->page))
			$LIMITQ = " LIMIT " . (($data->page - 1 ) * $data->per) . ', ' . $data->per;
		
		$query = "SELECT * FROM " . self::$table_name ." WHERE " .  $where . $LIMITQ ;
		return API::submit($data,self::$columns,$query); 
	}
	
/*
	* Delete data from Games
	* @ Version 1.0.0
	* @ Param (Object)
*/
	public function delete($data){
		list($where,$update) = API::APISetup(self::$columns,$data->data);
		$query = "DELETE FROM " . self::$table_name ." WHERE " .  $where;
		return API::submit($data,self::$columns,$query); 
	}


/*
	* Update data from Games
	* @ Version 1.0.0
	* @ Param (Object)
*/
	public function update($data){
		list($where,$update) = API::APISetup(self::$columns,$data->data);

		$query = "UPDATE " . self::$table_name ." SET " . $update . "  WHERE " .  $where;
		return API::submit($data,self::$columns,$query); 
	}

}
?>