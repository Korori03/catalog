<?php

/*
	* Korori-Gaming
	* Viewer Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/
/*
	* Setup Viewer Class
	* @since 4.0.0
*/
class Viewer{

	
/*
	* Load PNG
	* @since 4.0.0	
	* @param (String Image)
*/		
	public function LoadPNG($imgname){
		$im = @imagecreatefrompng($imgname);
		imagealphablending($im, true);
		imagesavealpha($im, true);
		if(!$im){
			$im  = imagecreatetruecolor(150, 30);
			$bgc = imagecolorallocate($im, 255, 255, 255);
			$tc  = imagecolorallocate($im, 0, 0, 0);
			imagefilledrectangle($im, 0, 0, 150, 30, $bgc);
			imagestring($im, 1, 5, 5, 'Error loading ' . $imgname, $tc);
		}
		return $im;
	}

/*
	* Load Jpeg
	* @since 4.0.0	
	* @param (String Image)
*/	
	public function LoadJpeg($imgname){
		$im = @imagecreatefromjpeg($imgname);
		if(!$im){
			$im  = imagecreatetruecolor(150, 30);
			$bgc = imagecolorallocate($im, 255, 255, 255);
			$tc  = imagecolorallocate($im, 0, 0, 0);
			imagefilledrectangle($im, 0, 0, 150, 30, $bgc);
			imagestring($im, 1, 5, 5, 'Error loading ' . $imgname, $tc);
		}
		return $im;
	}

/*
	* Load Gif
	* @since 4.0.0	
	* @param (String Image)
*/		
	public function LoadGif($img){	
		readfile($img);
		@flush();
	} 

/*
	* Download File
	* @since 4.0.0	
	* @param (String FilePath, String Name File)
*/		
	public function downloadFile($fullPath,$name){	
		if(ini_get('zlib.output_compression'))
			ini_set('zlib.output_compression', 'Off');
		
		$fsize = filesize($fullPath);	
		
		header('Content-Description: File Transfer');
		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private",false);
		header("Content-Type: application/force-download");
		header ("Content-Disposition: attachment; filename=\"{$name}\"");
		header("Content-Transfer-Encoding: binary");
		header("Content-Length: ".$fsize);
		readfile($fullPath);

		@flush();
	} 



/*
	* Add Error
	* @since 4.0.0	
	* @param (String Error)
*/	 
	private function addError($error){
		$this->_errors[] = $error;
	}

/*
	* Error Call
	* @since 4.0.0	
*/
	public function errors(){
		return $this->_errors;
	}


}
?>