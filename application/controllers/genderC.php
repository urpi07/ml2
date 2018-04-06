<?php
require("RestfulController.php");

class genderC extends RestfulController{

	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->library('form_validation');
		$this->load->model('genderlist');
	}
	
	public function view($page){
		
		$pageFile = $page."v";
		if ( ! file_exists(APPPATH.'views\\'.$pageFile.".php") && $page == 'gender.v' ){
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
	
	public function doPost(){
		parent::doPost();
		
		$result = array();
		$validationRules = array(
			array('field' => 'name',
					'rules' => 'trim|required'),
			array('field' => 'code',
				'rules' => 'trim|required'),
			array('field' => 'description',
				'rules' => 'trim'),		
		);
		
		$data = $this->mapData($_POST);
		$this->genderlist->setData($data);
		$this->form_validation->set_data($data);
		$this->form_validation->set_rules($validationRules);

		if($this->form_validation->run() === FALSE){ //validation failed
			
			$result["result"] = VALIDATION_ERROR;
			$result["message"] = $this->form_validation->error_array() ;
			$result["title"] = "Validation Error...";
		}
		else{ //validation success
			$result= $this->genderlist->add();
		}

		return $result;
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