<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
	</head>

	<body>
		<h1>Bragi !!!</h1>
		
		<form method="post" action="bragi.php" enctype="multipart/form-data">
     		        <input type="file" name="nomFichierOuvrir">
     			<input type="submit" name="ouvrir" value="Ouvrir">
		</form>
				<?php
					include_once("geshi.php");
					$texte = ""; 
					if (!isset($_FILES["nomFichierOuvrir"]["name"]))
					{

					}
					else
					{
						if ($_FILES["nomFichierOuvrir"]["error"] > 0) $erreur = "Erreur lors du transfert";
						$extensionsValides = array( "txt" , "c" , "py" , "js" , "rb" );
						$extensionsUpload = strtolower( substr( strrchr($_FILES["nomFichierOuvrir"]["name"], "."),1) );
						if (! in_array($extensionsUpload,$extensionsValides)) $erreur = "Extension incorrecte";

						$resultat = move_uploaded_file($_FILES["nomFichierOuvrir"]["tmp_name"], $_FILES["nomFichierOuvrir"]["name"]);
						if ($resultat) $erreur = "Transfert réussi";

						if (! $monFichierOuvrir = fopen($_FILES["nomFichierOuvrir"]["name"], "r"))
						{
							echo "echec de l'ouverture";
							exit;
						}
						else
						{
							while (!feof($monFichierOuvrir))
							{
								$texte = $texte . fgets($monFichierOuvrir, 255);
							}
						}
						fclose($monFichierOuvrir);
						unlink($_FILES["nomFichierOuvrir"]["name"]);
					}
				?> 		
		<form action="cibleBragi.php" method="post">
			<input type="text" name="nomFichier" value="Nom de votre fichier" />
			<input type="submit" value="Enregistrer" />
			<textarea name="texte" rows="50" cols="170"><?php geshi_highlight($texte, "python", $path); ?></textarea> 
		</form>>
	</body>
</html>

