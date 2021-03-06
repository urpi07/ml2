<div class='container'>
	<h1>Gender List</h1>

	<!-- Modals -->
	<!-- Form Modal -->
	<div class="modal fade" id="genderFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Gender</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>
		  <div class="modal-body">
			<form method="post" id='genderForm'>
				<div class='form-group'>
					<div class='row'>
						<div class='col'>
							<input type="text" name="ml_gname" id="ml_gname" class='form-control'
								required placeholder="Gender Name">
						</div>
						<div class='col'>
							<input type="text" name="ml_gcode" id="ml_gcode" class='form-control'
								required placeholder="Gender Code">
						</div>
					</div>
				</div>

				<div class='form-group'>
					<input type="text" name="ml_gdescription" id="ml_gdescription" class='form-control'
							required placeholder="Description">
				</div>
			</form>
		  </div>

		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			<button type="button" class="btn btn-primary" id='ml_btnSave'>Save</button>
		  </div>
		</div>
	  </div>
	</div>
	
	<!--Confirm Modal -->
	<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Gender</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>
		  <div class="modal-body">
				Are you sure you want to delete this record?
		  </div>

		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary" id='deleteOk'>OK</button>
			<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
		  </div>
		</div>
	  </div>
	</div>	
	
	<!-- Info Modals -->
	<div class="modal fade" id="infoDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Gender</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>
		  <div class="modal-body">
				<div class='infoMessage'>
				</div>				
		  </div>

		  <div class="modal-footer">			
			<button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
		  </div>
		</div>
	  </div>
	</div>
	
	<!-- End of Modals -->

	<div class='row'>
		<button type="button" class="btn btn-primary" data-toggle="modal" id='newRec'>
			New
		</button>
	</div>
	<br>
	
	<div class='row' id='dataList'>	
		<table class="table table-striped table-bordered table-hover table-sm" id="genderTable">
			<thead class='thead-dark'>
				<tr>
				<?php
					if(isset($headers)){

						foreach($headers as $header){
							echo "<th>$header</th>";
						}
					}
				?>
				</tr>
			</thead>

			<tbody>
			<?php
			if(isset($vals) ){

				foreach($vals as $value){
					echo "<tr>";
						echo "<td>$value->id</td>";
						echo "<td>$value->name</td>";
						echo "<td>$value->code</td>";
						echo "<td>$value->description</td>";
						echo "<td>";
							echo "<span class='fas fa-pencil-alt fa-sm ml_link' onclick='showEdit($value->id)'>&nbsp;&nbsp;</span>&nbsp;&nbsp;";
							echo "<span class='fas fa-trash-alt fa-sm ml_link' onclick='confirmDelete($value->id)'>&nbsp;&nbsp;</span>";
						echo "</td>";
					echo "</tr>";
				}
			}
			?>
			</tbody>
		</table>
		
		<div class="row" id="serverMsg">
			No Errors.
		</div>
	</div>	

</div>

<script>
var recordToDelete;
var newRecBtn, saveBtn, deleteOk;
var formModal, infoDialog, infoMessage, confirmDelete;
var recordForm, dataList;
var fldName, fldCode, fldDescription;

$( document ).ready(function() {
    pageInit();
});

function pageInit(){
	//cache all the DOM objects
	newRecBtn = $('#newRec');	
	formModal = $('#genderFormModal');
	recordForm = $('#genderForm');
	saveBtn = $('#ml_btnSave');
	dataList = $('#dataList');
	deleteOk = $('#deleteOk');
	infoDialog = $('infoDialog');
	infoMessage = $('infoMessage');
	serverMsg = $('serverMsg');
	confirmDelete = $('confirmDelete');
	
	deleteOk.click(deleteRecord);
	saveBtn.click(submitForm);
	newRecBtn.click(showNew);
}

function showEdit(id){
	console.log("id: "+ id);
	recordForm.trigger('reset');
	recordForm.prop('method', ML_MODES.EDIT);
	
	getRecord(id);
	//populate the form.	
	formModal.modal('show');
}

function getRecord(id){
	
	var payload = {
		url:  ajaxURL + 'gender',
		data : {"id":id},
		method : ML_MODES.PUT
	};
	
	sendAjax(payload, getRecordSuccessCB, failCB);
}

function getRecordSuccessCB(result){
	console.log(result);
}

function showNew(){
	recordForm.prop('method', ML_MODES.NEW);
	formModal.modal('show');
}

function confirmDelete(id){
	recordToDelete = id;
	confirmDelete.modal('show');
}

function deleteRecord(){
	
	var payload = {
		url:  ajaxURL + 'gender',
		data : {"id":recordToDelete},
		method : ML_MODES.DELETE
	};
	
	console.log('recordToDelete :' + recordToDelete);
	console.log(JSON.stringify(payload));
	sendAjax(payload, successCB, failCB);
}

function successCB(result){
	console.log("succesCB: " + JSON.stringify(result));
	formModal.modal('hide');
	confirmDelete.modal('hide');
	completeSubmit(recordForm);	
	
	try{		
		var msg = JSON.parse(result);
	}
	catch(er){
		serverMsg.html(result.toString());
	}
	
	if(msg && msg.message){
		showInfoDialog(msg.message);
	}	
	
	updateDisplay();	
}

function failCB(result){
	//console.log("failCB: " + JSON.stringify(result));

	serverMsg.html(result.toString());
}

function submitForm(){
	
	formData = getFormData();	
	var formMode = recordForm.attr('method');
	
	if(validateForm(formData)){		
		var payLoad ={
				url : ajaxURL + 'gender',
				method : formMode,
				data : formData
		}				
		sendAjax(payLoad, successCB, failCB );
	}
	else{
		//show the error in validation
	}
}

//some front end validation.
function validateForm(formData){		
	var result = true;
	return result;
}

function getFormData(){
	return {
		ml_gname: $('#ml_gname').val(),
		ml_gcode: $('#ml_gcode').val(),
		ml_gdescription : $('#ml_gdescription').val()
	};
}

function updateDisplay(){
	getList();
}

function updateSuccessCB(result){	
	console.log("updateSuccessCB: " + JSON.stringify(result));	
	dataList.html(result.toString());
}

function updateFailedCB(result){
	console.log("updateFailedCB: " + JSON.stringify(result));
}

function getList(page){
	var payLoad = {
		method: ML_MODES.GET,
		url: ajaxURL + 'getList'		
	}
	
	sendAjax(payLoad, updateSuccessCB, updateFailedCB);
}

function showInfoDialog(message){
	infoMessage.html(message);
	infoDialog.show(show);
}
</script>