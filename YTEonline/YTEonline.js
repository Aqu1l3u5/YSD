function ouvrirDoc () {
    var fileSystem=new 
    ActiveXObject("Scripting.FileSystemObject");
}

function enregistrerDoc () {

}

var boutonOuvrirElt = document.getElementById("boutonOuvrir");
boutonOuvrirElt.addEventListener("click", ouvrirDoc);

var boutonEnregistrerElt = document.getElementById("boutonEnregistrer");
boutonEnregistrerElt.addEventListener("click", enregistrerDoc);
