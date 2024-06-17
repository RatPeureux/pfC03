#!/usr/bin/php
<?php
	$lines = file("prod");
	foreach ($lines as $a_line){
		$a_line = trim($a_line);
		$mot = explode(":", $a_line);
		echo $mot[4] . ";" . $mot[2] . ";" . $mot[0] . "\n";
	}
?>
