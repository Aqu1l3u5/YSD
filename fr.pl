#!/usr/bin/env perl

# rendent Perl moins permissif
use strict;
use warnings;

open(my $fh, "<", $ARGV[0]) or die("open: $!"); # ouvre le fichier source
open(my $fh2, ">", $ARGV[1]) or die("open: $!"); # ouvre le fichier à écrire
while( defined(my $l = <$fh> ) ) { # lit le fichier source ligne par ligne
	$l =~ s/SINON SI/elif/g; # condition elif
	$l =~ s/SINON/else/g; # condition else
	$l =~ s/SI ECHOUE/except/g; # except du bloc try
	$l =~ s/SI/if/g; # condition if
	$l =~ s/ALORS/:/g; # le ":", then en basic
	$l =~ s/TANT QUE/while/g; # boucle while
	$l =~ s/POUR CHAQUE/foreach/g; # boucle spécifique à un tableau (pour chaque élément du tableau faire ...)
	$l =~ s/POUR/for/g; # boucle for (pour chaque ... dans ... faire ...) 
	$l =~ s/DANS/in/g; # in, s'utilise avec for (for ... in ...)
	$l =~ s/CASSE/break/g; # sert à sortir d'une boucle
	$l =~ s/CONTINUE/continue/g; # fait reboucler la boucle
	$l =~ s/TOUT EST VRAI/all/g; # savoir si chaque élément d'une liste est vrai (renvoie True si vrai) 
	$l =~ s/EST VRAI PARMI/any/g; # savoir si un élément d'une liste est vrai (renvoie True)
	$l =~ s/VRAI/True/g; # booléen Vrai
	$l =~ s/FAUX/False/g; # booléen Faux
	$l =~ s/ECRIT/print/g; # affiche du texte à l'écran
	$l =~ s/DEMANDE UNE CHAINE/raw_input/g; # demande une saise à l'utilisateur qui sera convertie en chaîne de caractères
	$l =~ s/DEMANDE/input/g; # demande une saisie à l'utilisateur
	$l =~ s/NOMBRE ALÉATOIRE/randint/g; # donne un nombre aléatoire, s'utilise avec le module random
	$l =~ s/NOMBRE/int/g; # type nombre
	$l =~ s/DECIMAL/float/g; # type décimale
	$l =~ s/CHAINE/str/g; # type chaîne de caractères
	$l =~ s/EGAL/==/g; # opérateur égal
	$l =~ s/EST INFERIEUR OU EGAL A/<=/g; # opérateur inférieur ou égal
	$l =~ s/EST SUPERIEUR OU EGAL A/>=/g; # opérateur supérieur ou égal 
	$l =~ s/EST DIFFERENT DE/!=/g; # opérateur différent
	$l =~ s/EST INFERIEUR A/</g; # opérateur inférieur
	$l =~ s/EST SUPERIEUR A/>/g; # opérateur supérieur
	$l =~ s/PLUS/+/g; # plus, s'utilise lors d'un calcul (a = 2+3)
	$l =~ s/MOINS/-/g; # moins, idem
	$l =~ s/PUISSANCE/**/g; # puissance, idem
	$l =~ s/DIVISE AVEC ENTIER PAR/\/\//g; # diviser en récupérant un entier, idem
	$l =~ s/MULTIPLIE PAR/*/g; # multiplier, idem
	$l =~ s/DIVISE PAR/\//g; # diviser, idem
	$l =~ s/DIVISE AVEC RESTE PAR/%/g; # diviser en récupérant le reste, idem
	$l =~ s/LONGUEUR/len/g; # retourne la longueur d'une chaîne de caractères ou d'une liste
	$l =~ s/SUPPRIME/del/g; # supprime un élément d'une liste
	$l =~ s/AJOUTE/append/g; # ajoute un élément à une liste
	$l =~ s/TRIE LISTE/sorted/g; # trie une liste en créant une nouvelle liste 
	$l =~ s/TRIE/sort/g; # trie une liste par ordre alphabétique ou numérique
	$l =~ s/LISTE INVERSEE/reversed/g; # inverse une liste en en créat une autre
	$l =~ s/INVERSE/reverse/g; # inverse les éléments d'une liste
	$l =~ s/INDICE/index/g; # trouve l'indice d'un élément d'une liste
	$l =~ s/ENLEVE/remove/g; # enlève un élément d'une liste
	$l =~ s/GAMME/range/g; # donne une liste préremplie d'éléments
	$l =~ s/DEPUIS/from/g; # sert à un importer un élément d'un module, s'utilise avec import (from ... import ...)
	$l =~ s/IMPORTE/import/g; # sert à importer un élément d'un module, s'utilise avec from (idem)
	$l =~ s/DEFINITION/def/g; # sert à définir une fonction (def ...( ... ) { ... })
	$l =~ s/RENVOIE/return/g; # définit la valeur renvoyée par une fonction
	$l =~ s/GLOBALE/global/g; # définit une variable globale au programme, réutilisable en dehors d'une fonction
	$l =~ s/OUVRE/open/g; # ouvre un fichier ( open("nom_du_fichier", "mode") )
	$l =~ s/INSCRIT/write/g; # écrit une ligne à l'intérieur d'un fichier
	$l =~ s/LIT UNE LIGNE/readline/g; # lit une ligne d'un fichier
	$l =~ s/LIT/read/g; # lit tout un fichier
	$l =~ s/FERME/close/g; # ferme un fichier
	$l =~ s/TYPE/type/g; # renvoie le type d'une variable
	$l =~ s/MELANGE LISTE/zip/g; # regroupe sous la forme d'un tuple les items d'une liste
	$l =~ s/ADDITIONNE LISTE/sum/g; # additionne les valeurs d'un élément itérable 
	$l =~ s/LISTE/list/g; # type liste
	$l =~ s/COMPTE LES OCCURENCES I/count/g; # compte le nombre d'occurences d'une recherche dans une chaîne
	$l =~ s/COMPTE LES OCCURENCES II/count/g; # compte le nombre d'occurences d'une recherche dans une liste
	$l =~ s/ENUMERE/enumerate/g; # énumère les différents éléments d'une liste, est un itérateur 
	$l =~ s/RECUPERE/get/; # retourne la valeur d'une clé donnée, s'utilise sur un dictionnaire
	$l =~ s/COPIE/copy/g; # copie un dictionnaire, dans un ordre différent
	$l =~ s/ABSOLUE/abs/g; # retourne la valeur absolue d'un nombre
	$l =~ s/BINAIRE/bin/g; # convertit un nombre entier en chaîne de caractères binaires
	$l =~ s/EST APPELLABLE/callable/g; # détermine si on peu appeller un objet, retourne True si vérifié
	$l =~ s/CAPITALISE/capitalize/g; # formate une chaîne de caractère avec le format Xxxxx
	$l =~ s/CHOIX/choice/g; # retourne aléatoirement une des valeurs d'une liste
	$l =~ s/NOM DES STRUCTURES/dir/g; # retourne les noms de la structure d'un objet
	$l =~ s/SE TERMINE PAR/endswith/g; # teste si une chaîne de caractère se termine par la chaîne demandée, retourne True si vérifié
	$l =~ s/CALCULE/eval/g; # calcule une chaîne de caractères (eval("2+2") retourne 4)
	$l =~ s/TROUVE/find/g; # donne la place de la première occurence de la chaîne demandée
	$l =~ s/AIDE/help/g; # retourne des informations sur un élément demandé
	$l =~ s/HEXADECIMAL/hex/g; # convertit un nombre en hexadécimal
	$l =~ s/EST ALPHANUMERIQUE/isalnum/g; # vérifie que tous les caractères d'une chaîne sont alphanumériques, renvoie True si vérifié
	$l =~ s/EST CARACTERIELLE/isalpha/g; # vérifie que tous les caractrèes d'une chaîne sont des lettres, idem
	$l =~ s/EST CHIFFREE/isdigit/g; # vérifie que tous les caractères d'une chaîne sont des chiffres, idem
	$l =~ s/EST MINUSCULE/islower/g; # vérifie que tous les caractères d'une chaîne sont en minuscule, idem 
	$l =~ s/EST ESPACEE/isspace/g; # vérifie que la chaîne contient au moins un espace
	$l =~ s/EST UN TITRE/istitle/g; # vérifie que la chaîne à un format titre, c'est à dire Xxxxx Xx Xxx Xxxx 
	$l =~ s/TITRE/title/g; # formate une chaîne au format titre, idem
	$l =~ s/EST MAJUSCULE/isupper/g; # vérifie que tous les caractères d'une chaîne sont en majuscules 
	$l =~ s/JOINT/join/g; # transforme une liste en chaîne de caractères ("mon_séparateur".join(ma_liste))
	$l =~ s/LOCALES/locals/g; # retourne un dictionnaire avec les valeurs des variables en cours 
	$l =~ s/MINUSCULISE/lower/g; # met en minuscules une chaîne de caractères
	$l =~ s/FAIRE/map/g; # execute une fonction sur chaque item d'une liste
	$l =~ s/MAXIMUM/max/g; # retourne la valeur la plus élevée d'une liste 
	$l =~ s/MINIMUM/min/g; # retourne la valeur la plus basse d'une liste
	$l =~ s/ALEATOIRE/random/g; # retourne une valeur aléatoire
	$l =~ s/REMPLACE/replace/g; # remplace un segment d'une chaîne de caractères par une autre
	$l =~ s/ARRONDI/round/g; # arrondi un nombre par le bas
	$l =~ s/MELANGE/shuffle/g; # mélange aléatoirement une liste
	$l =~ s/COMMENCE PAR/startswith/g; # vérifie qu'une chaîne de caractères commence par un préfixe indiqué
	$l =~ s/SEPARE LES LIGNES/splitlines/g; # retourne une liste des lignes d'une chaîne
	$l =~ s/SEPARE/split/g; # transforme une chaîne de caractères en liste ("ma_chaîne".split("mon_séparateur"))
	$l =~ s/MAJUSCULISE/upper/g; # met en majuscules une chaîne de caractères
	$L =~ s/ET/and/g; # vérifie qu'une condition ET une autre soient vérifiées
	$l =~ s/OU/or/g; # vérifie qu'une condition OU une autre soient vérifiées
	$l =~ s/PAS/not/g; # vérifie qu'une condition n'est pas vérifiée
	$l =~ s/ESSAYE/try/g; # essaye un bout de code
	$l =~ s/FINALEMENT/finally/g; # execute les instructions quelque soient les erreurs du bloc try
	$l =~ s/CLASSE/class/g; # regroupe les attributs et les fonctions qui définissent un objet
	$l =~ s/ELLE-MEME/self/g; # indique qu'il s'agit d'un attribut d'un objet
	$l =~ s/INITIALISE/__init__/g; # initialise un objet
	$l =~ s/NOUVEAU/__new__/g; # construit un objet
	$l =~ s/OBJET/object/g; # type objet
	$l =~ s/DICTIONNAIRE/__dict__/g; # donne les valeurs de l'attribut d'instance
	$l =~ s/DONNE/yield/g; # retourne une valeur sans la fin de la fonction
	$l =~ s/AVEC/with/g; # execute du code avant et après un autre code
	$l =~ s/COMME/as/g; # permet de récupérer une valeur dun with (with ... as ... : ...)
	$l =~ s/N'EST PAS/is not/g; # opérateur différent 
	$l =~ s/EST/is/g; # opérateur égal
	print $fh2 $l; # écrit $l après l'avoir modifié
}
close($fh); # ferme le fichier source
close($fh2); # ferme le fichier créé