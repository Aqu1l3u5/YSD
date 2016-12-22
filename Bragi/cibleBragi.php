<?php
	$nomFichier = $_POST["nomFichier"];
	$monFichier = fopen($_POST["nomFichier"], "a"); 
	fputs($monFichier, $_POST["texte"]);
	fclose($monFichier);
	header("Content-disposition: attachment; filename=$nomFichier");
	header("Content-type: text/plain");
	readfile($_POST["nomFichier"]);
	unlink($_POST["nomFichier"]);  
?>

