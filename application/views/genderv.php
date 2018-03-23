<h1>Gender List</h1>
<form method="post">
	<label id="ml_lbl_gname">Gender</label>
	<input type="text" name="ml_gname" id="ml_gname" required placeholder="Gender Name"></input><br>
	<label id="ml_lbl_gname">Code</label>
	<input type="text" name="ml_gcode" id="ml_gcode" required placeholder="Gender Code"></input><br>
	<label id="ml_lbl_gname">Description</label>
	<input type="text" name="ml_gdescription" id="ml_gdescription" required placeholder="Description"></input><br>
	<button type="submit" name="ml_submit">Submit</button>
	
	<?php echo "Base URL: ".base_url(); ?>
	<table class="table-bordered" id="genderTable">
	<tr>
		<th>
			<?php
				if(isset($headers)){
					
					foreach($headers as $header){					
						echo "<td>$header</td>";
					}
				}
			?>
		</th>
	</tr>
	<?php
		if(isset($vals) ){
						
			foreach($vals as $value){
				echo "<tr>";
					echo "<td>$value->id</td>";
					echo "<td>$value->name</td>";
					echo "<td>$value->description</td>";
					echo "<td>$value->code</td>";
				echo "</tr>";
			}
		}
	?>
	</table>
</form>