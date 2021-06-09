<?php

/*
	* Korori-Gaming
	* Pagination Class Set
	* @Version 4.0.2
	* Developed by: Ami (亜美) Denault
*/
class Pagination {		
		
	public	$itemsPerPage,
			$range,
			$currentPage,
			$total,
			$textNav,
			$get_type,
			$_link;
	
	private $_navigation,		
			$_itemHtml;
       
	public function __construct()
	{
		
		$this->itemsPerPage = 5;
		$this->currentPage  = 1;		
		$this->total		= 0;
		$this->range        = 5;
		$this->get_type 	= 'page';
		
		
		$this->_navigation  = array(
				'next'=>'&#10093;&#10093;',
				'pre' =>'&#10092;&#10092;'
		);			
		$this->_link 	  	= filter_var($_SERVER['PHP_SELF'], FILTER_SANITIZE_STRING);
		$this->_itemHtml  	= '';
		
	}
       
	public function pagination()
	{
		$this->_itemHtml = $this->_getHTMLData();	
		return $this->_itemHtml;
	}
				
	
	private function  _getHTMLData()
	{
		$html = '<nav class="my-3" aria-label="Page navigation"><ul class="pagination">';
					

		if($this->currentPage>1){
			$html .= '<li class="page-item"><a class="page-link" href="'.$this->_link .'/'.($this->currentPage-1).'-' .$this->get_type.'">'.$this->_navigation['pre'].'</a></li>';
		}        	
		if($this->total > $this->range){				
			$start = ($this->currentPage <= $this->range)?1:($this->currentPage - $this->range);
			$end   = (ceil($this->total/$this->itemsPerPage) - $this->currentPage >= $this->range)?($this->currentPage+$this->range): (ceil($this->total/$this->itemsPerPage));
		}else{
			$start = 1;
			$end   = ceil($this->total/$this->itemsPerPage);
		} 
	

		for($i = $start; $i <= $end; $i++){
			$html .= '<li class="page-item ' .($i==$this->currentPage?"active":'').'"><a class="page-link" href="'.$this->_link .'/'.$i. '-' .$this->get_type.'">'.$i.'</a></li>';
		}        	

		if($this->currentPage<$end){
			$html .= '<li class="page-item"><a class="page-link" href="'.$this->_link .'/'.($this->currentPage+1).'-' .$this->get_type.'">'.$this->_navigation['next'].'</a></li>';
		}
		$html .= ' </ul>
                     </nav>';
		return $html;
	}
}
?>