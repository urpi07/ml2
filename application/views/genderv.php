<div class='container'>
	<h1>Gender List</h1>

	<!-- Form Modal -->
	<div class="modal fade" id="genderForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Gender</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>
		  <div class="modal-body">
			<form method="post">
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
			<button type="button" class="btn btn-primary">Save</button>
		  </div>
		</div>
	  </div>
	</div>

	<div class='row'>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#genderForm">
			New
		</button>
	</div>
	<br>
	<div class='row'>
		<table class="table" id="genderTable">
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
							echo "<span class='fas fa-pencil-alt fa-sm'></span>&nbsp;&nbsp;";
							echo "<span class='fas fa-trash-alt fa-sm'></span>";
						echo "</td>";
					echo "</tr>";
				}
			}
			?>
			</tbody>
		</table>
	</div>
</div>