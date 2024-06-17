#!/usr/bin/php
<?php
	$lines = file("murphy");
	$ligne = 0;
	foreach ($lines as $a_line){
		$nb_mots = explode(" ", $a_line);
		$ligne++;
		echo "ligne " . $ligne . ", " . count($nb_mots) . " mots\n";
	}		
?>
