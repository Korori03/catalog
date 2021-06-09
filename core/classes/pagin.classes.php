<?php

/*
	* Korori-Gaming
	* Pagination Class Set
	* @Version 4.0.2
	* Developed by: Ami (亜美) Denault
*/
/*
	* Setup Pagin Class
	* @since 4.0.2
*/
	class Pagin{
		
/*
	* Cookie Put Cookie
	* @since 4.0.0	
	* @Param (Integer Page, Integer Record Number, String Display, Integer Width, String Page,Boolean Show)
*/	
		public static function generic($currentPage,$num_record,$colspan = 5,$preurl){
	
			$perpage = 10;
			$table_row = $num_record;
			$number_page = ceil($table_row/$perpage);
			$current_page = $currentPage;
			$shownonbar = 10;

			$pagin_internal = '<tfoot>
						<tr>
							<td colspan="'. $colspan . '" style="text-align:right;"><div class="links"><ul class="pagination">';
					
			if($number_page > 1){
				$x = 1;
				$alter = ceil($shownonbar / 2); 
				
				$start_pos = ($current_page - $alter < 0? 1:$current_page - $alter);
				$end_pos = ($current_page - $alter < 0? $number_page:($number_page < ($current_page + $alter)?$number_page:$current_page + $alter));
				
				if($number_page > 1 && 1 < $current_page)
					$pagin_internal .= '<li class="pagin_prev"  data-prev="'  . ($current_page - 1) . '" data-current="' . $current_page . '"><a href="'.$preurl.'/'.($current_page - 1).'-page"">&laquo;</a></li>';

				for($start_pos;$start_pos < $end_pos + 1;$start_pos++){
					if($shownonbar >= $x && $start_pos != 0)
						$pagin_internal .='<li ' . ($current_page == $start_pos?'class="active"':'class="pagin_selector"') .' data-current="' . $start_pos .'" ><a href="'.$preurl.'/'.$start_pos.'-page">' . $start_pos  . '</a></li>';
					$x++;
				}

				if($end_pos > $current_page)
					$pagin_internal .= '<li class="pagin_next"  data-next="' . ( $current_page + 1 ) . '" data-current="' . $current_page . '"><a href="'.$preurl.'/'. ( $current_page + 1 ).'-page">&raquo;</a></li>';
			
			}

			$pagin_internal.='</ul></div></td></tr></tfoot>';
				
			return  $pagin_internal;

		}
		public function getPaging($page, $total_rows, $records_per_page, $page_url){
  
			$paging_arr	=	array();
	  
			$paging_arr["first"] = $page>1 ? "{$page_url}page=1" : "";
	  
			$total_pages = ceil($total_rows / $records_per_page);
	  
			$range = 2;
	  
			$initial_num = $page - $range;
			$condition_limit_num = ($page + $range)  + 1;
	  
			$paging_arr['pages']	=	array();
			$page_count	=	0;
			  
			for($x	=	$initial_num; $x < $condition_limit_num; $x++){
				if(($x > 0) && ($x <= $total_pages)){
					$paging_arr['pages'][$page_count]["page"] = $x;
					$paging_arr['pages'][$page_count]["url"] = "{$page_url}page={$x}";
					$paging_arr['pages'][$page_count]["current_page"] = $x==$page ? "yes" : "no";
	  
					$page_count++;
				}
			}
	  
			$paging_arr["last"] = $page<$total_pages ? "{$page_url}page={$total_pages}" : "";
	  
			return $paging_arr;
		}
	}
?>