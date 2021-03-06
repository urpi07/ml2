<?php
class RestfulController extends CI_Controller{	
	
	public function __construct(){
		parent::__construct();
	}
	
	public function processRequest(){
		
		$result = "";
		switch($_SERVER["REQUEST_METHOD"]){
			
			case "POST":
				$result = $this->doPost();
				break;
			case "PUT":
				$result = $this->doPut();
				break;
			case "DELETE":
				$result = $this->doDelete();
				break;
			case "GET":
				$result = $this->doGet();
				break;
		}
		
		return $result;
	}
	
	public function doPost(){}
	
	public function doDelete(){
		//HACK: since there is no $_DELETE
		//we create on and copy it to the $_POST variable to take advantage of codeigniter
		//form validation
		parse_str(file_get_contents('php://input'), $_POST);	
	}
	
	public function doPut(){
		//HACK: since there is no $_PUT
		//we create on and copy it to the $_POST variable to take advantage of codeigniter
		//form validation
		parse_str(file_get_contents('php://input'), $_POST);
	}
	
	public function doGet(){
		//HACK: since there is no $_PUT
		//we create on and copy it to the $_POST variable to take advantage of codeigniter
		//form validation		
		parse_str(file_get_contents('php://input'), $_POST);
	}
	
}