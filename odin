#!/usr/bin/env perl
# ceci est la version 1.0 du logiciel ODIN (Orienté-objet et Dynamique, Interpréteur Normalisé)   
# il à été écrit du 8/01/2017 au ../01/2017 par Félix Foriel

# rendent Perl moins permissif
use strict;
use warnings;

open(my $fh, "<", $ARGV[0]) or die("open: $!"); # ouvre le fichier source
open(my $fh2, ">", $ARGV[1]) or die("open: $!"); # ouvre le fichier à écrire
while( defined(my $l = <$fh> ) ) { # lit le fichier source ligne par ligne
	$l =~ s/charger/include/g;
	$l =~ s/fluxES/iostream/g;
	$l =~ s/utilisant/using/g;
	$l =~ s/nominosphère/namespace/g;
	$l =~ s/entier/int/g;
	$l =~ s/prime-fonction/main/g;
	$l =~ s/exposer/cout/g;
	$l =~ s/clore-ligne/endl/g;
	$l =~ s/renvoyer/return/g;
	$l =~ s/booléen/bool/g;
	$l =~ s/caractère/char/g;
	$l =~ s/entier-naturel/unsigned int/g;
	$l =~ s/décimale/double/g;

	# spécifiques à chaîne/string

	$l =~ s/chaîne/string/g;
	$l =~ s/entrer-ligne/getline/g;

	#------------------------------

	$l =~ s/entrer/cin/g;
	$l =~ s/constante/const/g;
	$l =~ s/constant/const/g;

	# spécifiques à maths/cmath 

	$l =~ s/maths/cmath/g;
	$l =~ s/racine/sqrt/g;
	$l =~ s/sinus/sin/g;
	$l =~ s/cosinus/cos/g;
	$l =~ s/cos/cos/g;
	$l =~ s/tangente/tan/g;
	$l =~ s/tan/tan/g;
	$l =~ s/exponentielle/exp/g;
	$l =~ s/exp/exp/g;
	$l =~ s/logarithme-10/log10/g;
	$l =~ s/log-10/log10/g;
	$l =~ s/logarithme/log/g;
	$l =~ s/log/log/g;
	$l =~ s/abs/fabs/g;
	$l =~ s/absolue/fabs/g;
	$l =~ s/arrondi-bas/floor/g;
	$l =~ s/bas/floor/g;
	$l =~ s/arrondi-haut/ceil/g;
	$l =~ s/haut/ceil/g;
	$l =~ s/puisance/pow/g;
	$l =~ s/psnc/pow/g;
	
	#----------------------------

	$l =~ s/sinon-si/else if/g;
	$l =~ s/sinon/else/g;
	$l =~ s/si/if/g;	
	print $fh2 $l; # écrit $l après l'avoir modifié
}
close($fh); # ferme le fichier source
close($fh2); # ferme le fichier créé
