<?php

//Here we encapsulate the repetitive operations
//that are the generic add, edit and delete.
class genericQuery extends CI_Model{
	
	protected $operation = '{operation}';
	private $delete = 'delete';
	private $edit = 'edit';
	
	//TODO: figure out why it fails when i use $this->operation
	//in place of {operation}
	private $MESSAGES = array(
		'FAILED' => array(
			'title' => "Failed to {operation}",
			'result' => 'FAILED',
			'message' => ' '
		),
		'SUCCESS' => array(
			'title' => "Successful to {operation}",
			'result' => 'SUCCESS',
			'message' => ' '		
		)
	);	
	
	public function __construct(){
		parent::__construct();
		$this->load->database();
	}
	
	public function add($table, $arg){
		
		if(isset($table) && isset($arg)){
			
		}
	}
	
	public function edit($table, $arg){
		if(isset($table) && isset($arg)){
			
		}
	}
	
	public function deleteRecord($table, $id){
		
		$res;
		$message;
		
		if(isset($table) && isset($id)){
			$res = $this->db->delete($table, array("id"=>$id));
		}
		
		if(!isset($res) || $res == FALSE){
			$message = $this->MESSAGES['FAILED'];
			str_replace($this->operation, $this->delete, $message);
			
			$dbError = $this->db->_error_message();
			if($dbError != ''){
				$message['message'] = 'Database Error: '.$dbError;
			}
			else {
				$message['message'] = 'The selected record may have been already deleted.';
			}			
		}
		else{
			$message = $this->MESSAGES['SUCCESS'];
			$message['message'] = "Record $id has been deleted.";
		}
		
		return $message;
	}
	
	public function get($table, $id){
		
		$res = null;
		if(isset($table) && isset($id)){
			$query = $this->db->get_where($table, array("id"=>$id));			
			$res = $query->result();
		}
		
		return $res[0];
	}
		
}