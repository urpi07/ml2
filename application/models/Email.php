<?php
class Email extends RestFul_Model{

	public function __construct(){
		parent::__construct("ml_email");
		
		$this->load->model("genericentity");
	}
	
	public function add($data){
		
		$result = null;
		if(isset($data)){
			$user = $this->genericentity->get($data[$userid]);
			
			if(isset($user){
				$parent::setData($data);
				$result = $parent::add();
			}			
		}
		
		return $result;
	}
	
	public function edit(){
	}
	
	public function delete(){
	}
	
	public function get(){
	}
}