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
	
	public function getAll(){	
		echo $this->table;
		$query = $this->db->get($this->table);
		return $query->result();
	}
	
	public function getHeaders(){
		return array("ID", "Name", "Code", "Description", "Actions");
	}
}