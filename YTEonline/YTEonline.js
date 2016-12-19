function ouvrirDoc () {
    var fileSystem=new 
    ActiveXObject("Scripting.FileSystemObject");
    var nomFichier = prompt("nom et chemin du fichier : ");
    var monFichier=fileSystem.OpenTextFile(nomFichier, 1 ,true);
    document.getElementById("zoneTexte").innerHTML += monFichier.ReadAll();
    monFichier.Close();
}

function enregistrerDoc () {

}

var boutonOuvrirElt = document.getElementById("boutonOuvrir");
boutonOuvrirElt.addEventListener("click", ouvrirDoc);

var boutonEnregistrerElt = document.getElementById("boutonEnregistrer");
boutonEnregistrerElt.addEventListener("click", enregistrerDoc);
