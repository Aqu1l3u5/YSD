function ouvrirDoc () {
    var fileSystem=new
    ActiveXObject("Scripting.FileSystemObject");
    var nomFichier = document.getElementById("choixFichierOuvrir").val;
    var monFichier=fileSystem.OpenTextFile(nomFichier, 1 ,true);
    document.getElementById("zoneTexte").innerHTML += monFichier.ReadAll();
    monFichier.Close();
}

function enregistrerDoc () {
    var fileSystem=new
    ActiveXObject("Scripting.FileSystemObject");
    var nomFichier = document.getElementById("choixFichierEnregistrer").val;
    var texte = document.getElementById("zoneTexte").value;
    var monFichier=fileSystem.OpenTextFile(nomFichier, 2 ,true);
    monFichier.WriteLine(texte);
    monFichier.Close();    
}

var boutonOuvrirElt = document.getElementById("boutonOuvrir");
boutonOuvrirElt.addEventListener("click", ouvrirDoc);

var boutonEnregistrerElt = document.getElementById("boutonEnregistrer");
boutonEnregistrerElt.addEventListener("click", enregistrerDoc);
