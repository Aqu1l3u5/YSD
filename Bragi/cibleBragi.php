<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
	</head>

	<body>
		<?php
			$monFichier = fopen($_POST["nomFichier"], "a"); 
			fputs($monFichier, $_POST["texte"]);
			fclose($monFichier); 
		?>
	</body>
</html>



