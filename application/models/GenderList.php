<?php
class GenderList extends RestFul_Model{

	public function __construct(){
		parent::__construct("ml_genderlist");			
	}
	
	public function add($data){			
		$parent::setData($data);
		return  $parent::add();			
	}
	
	public function edit($data){
		$parent::setData($data);
		return $parent::edit($data);
	}
	
	public function delete($id){
		return $parent::delete($id)
	}
	
	public function get($id){
		return $parent::get($id);
	}
	
	public function getLists(){		
		$query = $this->db->query('Select * From ml_genderlist');
		return $query->result();
	}
}