<?php
class Restful_Model extends CI_Model{
	
	protected $table;
	protected $data;
	protected $args;
	
	public function __construct($table = ""){
		parent::__construct();	
		$this->table = $table;		
		$this->load->database();
		$this->load->helper("lendinglib");
	}
	
	public function setTable($table){		
		$this->table = $table;
	}
	
	public function setData($data){	
		$this->cleanData($data);
		$this->data = $data;
		$this->db->set($this->data);
	}
	
	//Cleans the posts data by removing all fields 
	//not related to the table
	private function cleanData($data){	
		return $data;
	}
	
	public function getData(){
		return $this->data;
	}
	
	public function add(){
		$result = array();
		
		if(isset($this->data) && isset($this->table)){			
			
			//$this->db->trans_start();
			
			$this->db->insert($this->table, $this->args);
			//$this->db->trans_complete();
			
			if($this->db->trans_status() === FALSE){
				$result = setResult("Query Error", QUERY_ERROR, $this->db->last_query());
			}
			else{
				$result = setResult("SUCCESS", SUCCESS, $this->table." was created");
				$result["id"] = $this->db->insert_id();
			}
		}
		else{
			$result = setQueryError();
		}
		
		return $result;
	}
	
	
	public function edit(){
		$result = array();
		
		if(isset($this->table) && isset($this->args)){
			
			//$this->db->trans_start();
			$this->db->set($args);
			$this->db->where("id", $data["id"]);
			$this->db->update($this->table);
			//$this->db->trans_complete();
			
			if($this->db->trans_status() === FALSE){
				$result = setResult("Query Error", QUERY_ERROR, $this->db->last_query());
			}
			else{
				$result = setResult("SUCCESS", SUCCESS, "The ".$this->table." was updated.");
			}
		}
		else{
			$result = setQueryError();
		}
		return $result;
	}
	
	public function delete($id){
		$result = array();
		
		if(isset($id)){
			$this->db->trans_start();
			$this->db->delete($this->table, array("id"=>$id));
			$this->db->trans_complete();
			
			if($this->db->trans_status() === FALSE){
				$result = setResult("Query Error", QUERY_ERROR, $this->db->last_query());
			}
			else{
				$result = setResult("SUCCESS", SUCCESS, $this.table." was deleted");
			}
		}
		else{
			$result = setQueryError();
		}
		return $result;
	}
	
	public function get($id){
		$result = array();
		
		if(isset($id)){
			
			//$this->db->trans_start();
			$query = $this->db->get_where($this->table, array("id" => $id));
			//$this->db->trans_complete();
			
			if($this->db->trans_status() === FALSE){
				$result = setResult("Query Error", QUERY_ERROR, $this->db->last_query());
			}
			else{
				$result = setResult("SUCCESS", SUCCESS, "Got the loan");
				$result["data"] = $query->result();
			}
		}
		else{
			$result = setQueryError();
		}
		return $result;
	}		
}