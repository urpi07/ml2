<?php

require('restful_model.php');
class GenderList extends Restful_Model{

	public function __construct(){
		parent::__construct("ml_genderlist");			
	}
	
	public function add(){					
		return  parent::add();			
	}
	
	public function edit(){		
		return parent::edit();
	}
	
	public function delete($id){
		return parent::delete($id);
	}
	
	public function get($id){
		//return $parent::get($id);
	}
	
	public function getLists(){		
		$query = $this->db->query('Select * From ml_genderlist');
		return $query->result();
	}
}