#!/usr/bin/php
<?php

	$lines = file("murphy");
	$compteur = 0;
	foreach ($lines as $a_line){
		$len = strlen($a_line);
		if ($len <= 60){
			$compteur++;
		}
	}
	echo $compteur . "\n";
?>
