<?php

/*
	* Korori-Gaming
	* Calendar Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/

class Calendar{

/*
	* Variables
	* @Since 4.1.0
*/		
	private $_url = NULL,
			$_query = NULL,
			$_month = NULL,
			$_year = NULL;

/*
	* Construct Function
	* @Since 4.0.0
	* @Param (String)
*/				
	public function __construct($url = NULL, $query = NULL,$month = NULL,$year = NULL) {
		$this->_month = (is_null($month)?date('n',time()):$month);
		$this->_year = (is_null($year)?date('Y',time()):$year);
		$this->_url = $url;
		$this->_query = $query;
		self::show();
	}	

/*
	* Show Calendar
	* @Since 4.0.0
	* @Param (None)
*/		
	public function show(){
		
		$month = $this->_month;
		$year = $this->_year;
		
		$info = Functions::curl_file_get_contents($this->_url);
		$ema_array = json_decode($info, true);
		$calendar = array();

		foreach($ema_array as $key => $item)
			$calendar[] = array("name"=>ucwords(strtolower($item['name'])),"date"=> date("m-d-Y",$item['timestamp']),"type"=>"holiday");
		
		$cal_Row = Database::getInstance()->query($this->_query); 
		foreach($cal_Row->results() as $cal_info)
			$calendar[] = array("name"=>ucwords(strtolower($cal_info->name)),"date"=> date("m-d-Y",strtotime($cal_info->cal_date)),"type"=>"event");

		$cal_Row->close();
		
		Functions::sksort($calendar,"date",true);
		$layout = new Template("calendar.tpl");		
		
		list($cal_out,$events) = self::view($calendar,$year,$month);
	
		$event_items ='';
		foreach($events as $item)
			$event_items .= '<li style="padding-top:30px;">'.$item .'</li><li><div style="margin-top:7px;width:100%;webkit-border-radius: 20px;-moz-border-radius: 20px;border-radius: 20px;margin-left:auto;margin-right:auto;background-color:#daebfc;height:4px;">&#32;&#32;&#32;&#32;&#32;&#32;</div></li>';
		
		
		$layout->setArray(array(
			'events'=>$event_items,
			'calendar'=>$cal_out,
			'rowspan'=>self::weeks($month,$year) +1,
			'month'=>date('F', strtotime($year."-".$month."-01")),
			'year'=>$year,
			'cmonth'=>$month,
			'pyear'=>$year - 1,
			'nyear'=>$year + 1,
			'pmonth'=>($month  -1 < 1?12:$month - 1),
			'nmonth'=>($month +1 > 12?1:$month + 1),
			'pmonth_year'=>($month  -1 < 1?$year - 1:$year),
			'nmonth_year'=>($month +1 > 12?$year + 1:$year)
		));
		
		return $layout->show();
	}

/*
	* Print Calendar
	* @Since 4.0.0
	* @Param (Array,String,String)
*/		
	public static function view($events,$year,$month){
		
		$time = time();	
		$yearTemp = $year;
		$monthTemp =  $month;
		$calendar ='';
		$event_list = array();
		$first_of_month = gmmktime(0,0,0,$month,1,$year);
		$first_day = 0;
	
		list($month, $year, $month_name, $weekday) = explode(',',gmstrftime('%m,%Y,%B,%w',$first_of_month));
	
		$weekday = ($weekday + 7 - $first_day) % 7;
		
		$title   = htmlentities(ucfirst($month_name)).'&nbsp;'.$year;

		for($day = 1,$days_in_month=gmdate('t',$first_of_month);$day<=$days_in_month; $day++,$weekday++){
			
			if($weekday == 7){
				$weekday   = 0; 
				$calendar .= "</tr><tr>";	
			}
			  
			if($day == 1 && $weekday != 0)
				$calendar.="<td colspan=\"".$weekday."\"></td>";
			   
		    $check = false;
			if(($day == date('d',time() ))  && (date('n',time() ) == $month) && (date('Y',time() ) ==$year)){	
				$calendar .= '<td><div class="calendar_current">'. $day ."</div></td>";
				for($info_index = 0;$info_index < count($events);$info_index++){
					$get_Day = explode('-',$events[$info_index]['date']);
					if(($day == $get_Day[1])  && ($get_Day[0] == $month) && ($get_Day[2] ==$year)){							$event_list[] = $events[$info_index]['name'] . ' ('. addOrdinalNumberSuffix($day) .')';
						$event_list[] = $events[$info_index]['name'] . ' ('. self::addOrdinalNumberSuffix($day) .')';
						break;
					}
				}
				$check = true;
			}
			else{
				for($info_index = 0;$info_index < count($events);$info_index++){
					$get_Day = explode('-',$events[$info_index]['date']);
					if(($day == $get_Day[1])  && ($get_Day[0] == $month) && ($get_Day[2] ==$year)){	
						$event_list[] = $events[$info_index]['name'] . ' ('. self::addOrdinalNumberSuffix($day) .')';
						$calendar .= '<td><div class="calendar_item">'. $day ."</div></td>";
						$check = true;
						break;	
					}
				}
			}
			
			if($check == false)
				$calendar .= '<td>'. $day  ."</td>";
		}
		if($day == $days_in_month)
			$calendar .= '<td colspan="'.(7-$weekday).'">&nbsp;</td>';
		
		$calendar .= "</tr></table>";
		
		return array($calendar,$event_list);
	}	

/*
	* Add Number Suffix
	* @Since 4.0.0
	* @Param (Int)
*/		
	public static function addOrdinalNumberSuffix($num) {
		if (!in_array(($num % 100),array(11,12,13))){
		  switch ($num % 10) {
			case 1:  return $num.'st';
			case 2:  return $num.'nd';
			case 3:  return $num.'rd';
		  }
		}
		return $num.'th';
	}
	
/*
	* Get Number of Weeks
	* @Since 4.0.0
	* @Param (String,String)
*/			
	public static function weeks($month, $year){
		$days = cal_days_in_month(CAL_GREGORIAN, $month, $year);
		$week_day = date("N", mktime(0,0,0,$month,1,$year));
		$weeks = ceil(($days + $week_day) / 7);
		return $weeks + 1;
	}

}
?>