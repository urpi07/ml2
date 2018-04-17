	
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