<?php
class GenericEntity extends RestFul_Model{
	
	
	public function __construct(){
		parent::__construct("ml_entity");
		$this->load->model("maritalstatus");
	}
	
	public function add($data){
		
		$missingFields = new array();
		$invalidFields = new array();
		$maritalstate = $this->maritalstatus->get($data['maritalstatus']);
		
		if(isset($maritalstate){
			array_push($invalidFields, 'maritalstatus');
		}
	}
	
	public function edit(){
		
	}
	
	public function delete($id){
		
	}
	
	public function get(){
	}
	
	public function getAll(){
		$query = $this->db->get($this->table);
		
		return $query->result;
	}
}
?>