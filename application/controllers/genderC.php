<?php
require("RestfulController.php");

class genderC extends RestfulController{

	private $table = 'ml_genderlist';
	
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->library('form_validation');
		$this->load->model('genderlist');
		$this->load->model('genericQuery');
	}
	
	public function view($page){
		
		$pageFile = $page."v";
		if ( ! file_exists(APPPATH.'views\\'.$pageFile.".php") && $page == 'gender' ){
			echo "$page not found";
			echo APPPATH.'views\\'.$page.".php";
		}
		else{
			switch($page){
				case "gender":
					
					$data['title']="Gender List";
					$data['headers'] = $this->genderlist->getHeaders();
					$data['vals'] = $this->genderlist->getAll();
					$this->load->view("templates/header", $data);					
					$this->load->view($pageFile, $data);
					$this->load->view("templates/footer", $data);
										
					$result = parent::processRequest();					
				break;

				case 's': //service provider for all our ajax request
					//var_dump($_POST);
					$result = parent::processRequest();
					return json_encode($result);
				break;

				case 'getList':
					//TODO: implement pagination
					
					$data['vals'] = $this->genderlist->getAll();
					$this->load->view('gender.v', $data);
				break;
			}
		}		
	}
	
	public function mapData($data){
		$data = array(
			'name' => $data['ml_gname'],
			'code' => $data['ml_gcode'],
			'description' => $data['ml_gdescription']
		);
		
		return $data;
	}
	
	private function getValidation(){
		return array(
			array('field' => 'name',
					'rules' => 'trim|required'),
			array('field' => 'code',
				'rules' => 'trim|required'),
			array('field' => 'description',
				'rules' => 'trim'),		
		);
	}
	
	private function getValidationError(){
		return 	array("result" => VALIDATION_ERROR,
					"message" => $this->form_validation->error_array(),
					"title" => "Validation Error...");
	}	
	
	public function doPost(){
		parent::doPost();
		
		$result;
		$validationRules = getValidation();
		
		$data = $this->mapData($_POST);
		$this->genderlist->setData($data);
		$this->form_validation->set_data($data);
		$this->form_validation->set_rules($validationRules);

		if($this->form_validation->run() === FALSE){ //validation failed			
			$result = getValidationError();
		}
		else{ //validation success
			$result= $this->genderlist->add();
		}

		return $result;
	}
	
	public function doPut(){
		parent::doPut();

		$result;
		$validationRules = getValidation();
		
		$data = $this->mapData($_POST);
		$this->genderlist->setData($data);
		$this->form_validation->set_data($data);
		$this->form_validation->set_rules($validationRules);

		if($this->form_validation->run() === FALSE){ //validation failed			
			$result = getValidationError();
		}
		else{ //validation success		
			$result= $this->genderlist->edit();
		}

		return $result;		
	}
	
	public function doDelete(){
		parent::doDelete();
		var_dump($_POST);
		return $this->genericQuery->deleteRecord($this->table, $_POST['id']);		
	}
	
	public function doGet(){
		parent::doGet();
	}
}