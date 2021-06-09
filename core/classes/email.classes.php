<?php

/*
	* Korori-Gaming
	* Email Class Set
	* @Version 4.0.0
	* Developed by: Ami (亜美) Denault
*/

/*
	* Email Class
	* @Since 4.0.0
*/	
class Email {
	
/*
	* Variables
	* @Since 4.1.0
*/		
	public 	$_Sender = '',
			$_to = array(),
			$_to_name = array(), 
			$_Subject ='',
			$_Message='',
			$_eol = PHP_EOL,
			$_Send_to ='',
			$_Content_Type = 'html',
			$_ErrorInfo = '',
			$_ErrorBool = false;
			
	protected   $attachment     = array();

/*
	* Construct Function
	* @Since 4.0.0
	* @Param (String)
*/	
	public function __construct() {
		$this->_Sender = Config::get('emailer/sender/name') . ' <'.Config::get('emailer/sender/email') . '>';
		$this->_to = $this->attachment = $this->_to_name = array();
		$this->_ErrorBool = false;
		$this->_ErrorInfo = $this->_Subject = $this->_Message = $this->_Send_to = '';
	}  

/*
	* Send Function
	* @Since 4.0.0
	* @Param (None)
*/		
	public function send(){

		$separator = md5(time());

		//Header
        $headers = "MIME-Version: 1.0".$this->_eol;
        $headers .= "From:".$this->_Sender.$this->_eol;
        $headers .= "Content-Type: multipart/mixed; boundary = $separator".$this->_eol .$this->_eol;
        
        //Text
        $body = "--$separator\r\n";
        $body .= "Content-Type: text/". $this->_Content_Type ."; charset=ISO-8859-1".$this->_eol;
        $body .= "Content-Transfer-Encoding: base64" .$this->_eol.$this->_eol; 
        $body .= chunk_split(base64_encode($this->_Message));
		
		//Loop through Attachments
		for($x=0;$x < count($this->attachment);$x++){
			 if(is_file($this->attachment[$x][0]) && file_exists($this->attachment[$x][0])) {
				$filename = $this->attachment[$x][1];
				$path = $this->attachment[$x][0];
				$type = $this->attachment[$x][2];

				$file = @fopen($path,'r');
				$data = @fread($file,filesize($path));
				@fclose($file);
				$attachment = chunk_split(base64_encode($data));

				$body .= "--$separator".$this->_eol;
				$body.= sprintf("--%s%s", $separator, $this->_eol);
				$body.= sprintf("Content-Type: %s; name=\"%s\"%s", $type, $filename, $this->_eol);
				$body.= sprintf("Content-Transfer-Encoding: %s%s",'base64' , $this->_eol);
				$body.= sprintf("Content-Disposition: %s; filename=\"%s\"%s", 'attachment', $filename, $this->_eol.$this->_eol);
				$body.= $attachment;
				$body .= $this->_eol.$this->_eol;
				$body.= sprintf("--%s--%s", $separator, $this->_eol);
			 }
			 else{
				$this->_ErrorInfo .='Unable to find File';
				return false;
			 }
		}
		
		//Loop through Senders
		if(count($this->_to) > 0){
			for($x=0;$x < count($this->_to);$x++){
				
				if(count($this->_to) > $x + 1)
					$this->_Send_to .= $this->_to_name[$x] . " <" . $this->_to[$x] . ">,";
				else
					$this->_Send_to .= $this->_to_name[$x] . " <" . $this->_to[$x] . ">";
			}
		}

		//Attempt to Email
		if(!(bool)$this->_ErrorBool){
			$this->_ErrorBool = false;
			if (mail($this->_Send_to, $this->_Subject, $body, $headers)) {
				return true;
			}else{
				$this->_ErrorInfo .= error_get_last()['message'];
				return false;
			}
			echo $this->_Message;
		}
		else{
			$this->_ErrorInfo .= error_get_last()['message'];
			$this->_ErrorBool = false;
			return false;
		}
	}

/*
	* Add Attachment
	* @Since 4.0.0
	* @Param (String, String, String)
*/		
	public function AddAttachment($path, $name = '', $type = 'application/octet-stream') {
		try {
		  if (!is_file($path) && !file_exists($this->attachment[0])) {
				$this->_ErrorInfo .= 'Unable to Find: ' .$path;
				$this->_ErrorBool = true;
				return true;
		  }
		  $filename = basename($path);
		  if ( $name == '' ) {
			$name = $filename;
		  }

		  $this->attachment[] = array(
			0 => $path,
			1 => $name,
			2 => $type
		  );
		} 
		catch (Exception $e) {
			$this->_ErrorInfo .= $e->getMessage();
			$this->_ErrorBool = true;
			return false;
		}
		return true;
	}
	
/*
	* Add Address to
	* @Since 4.0.0
	* @Param (String, String)
*/	
	public function addAddress($to,$name=''){
		array_push(trim($this->_to),trim($to));
		
		if($name=='')
			$name = explode('@',$this->_to);
		
		array_push($this->_to_name,ucwords($name));
	}

/*
	* Add Address to Array
	* @Since 4.0.0
	* @Param (String)
*/	
	public function addAddressArray($to){
		
		foreach($to as $key =>$name){
			array_push($this->_to,$key);
			if($name=='')
				$name = explode('@',$key);
				
			array_push($this->to_name,ucwords($name));
		}
	}
	
/*
	* Add Body
	* @Since 4.0.0
	* @Param (String)
*/		
	public function Body($Message){
		$this->_Message = trim($Message);
	}

/*
	* Change Content Type
	* @Since 4.0.0
	* @Param (String)
*/	
	public function Content_Type($type){
		switch ($type) {
			case 'plain':
				$this->_Content_Type = 'plain';
				break;
			default:
				$this->_Content_Type = 'html';
				break;
		}
	}

/*
	* Set Subject Line
	* @Since 4.0.0
	* @Param (String)
*/	
	public function Subject($Subject){
		$this->_Subject = $Subject;
	}
/*
	* Get Error Line
	* @Since 4.0.0
	* @Param (String)
*/	
	public function Error(){
		return $this->_ErrorInfo;
	}
/*
	* Set From Address
	* @Since 4.0.0
	* @Param (String)
*/	
	public function setFrom($sender,$name=''){
		if($name=='')
			$name = ucwords(explode('@',$sender)[0]);
		
		$this->_Sender = $name . " <" . $sender . ">";
	}
}

?>