<?php
class genderC extends Restful_Controller{

	public __construct(){
		parent::__construct();
	}
	
	public function view($page){
		
		if ( ! file_exists(APPPATH.'views\\settings\\'.$page."v.php") ){
			echo "$page not found";
			echo APPPATH.'views\\settings\\'.$page.".php";
		}
		else{
			switch($page){
				case "gender":
					
					echo "Request Method: ".$_SERVER["REQUEST_METHOD"];
					//$result = parent::processRequest();
					//echo json_encode($result);
					break;								
			}
		}		
	}
	
	public function doPost($data){
		parent::doPost();
	}
	
	public function doPut(){
		parent::doPut();
		
	}
	
	public function doDelete(){
		parent::doDelete();
	}
	
	public function doGet(){
		parent::doGet();
	}
}