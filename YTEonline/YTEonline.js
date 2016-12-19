function ouvrirDoc () {
    var fileSystem=new 
    ActiveXObject("Scripting.FileSystemObject");
    var nomFichier = prompt("nom et chemin du fichier : ");
    monfichier=fileSystem.OpenTextFile(nomFichier, 1 ,true);
    var texte = document.getElementById("zoneTexte").value; 
}

function enregistrerDoc () {

}

var boutonOuvrirElt = document.getElementById("boutonOuvrir");
boutonOuvrirElt.addEventListener("click", ouvrirDoc);

var boutonEnregistrerElt = document.getElementById("boutonEnregistrer");
boutonEnregistrerElt.addEventListener("click", enregistrerDoc);
