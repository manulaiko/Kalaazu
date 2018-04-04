<?php
/**
 * Joins all files from all tables and outputs result.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */

$header = "-- BlackEye database v2.1.1
-- 
-- @author Manulaiko <manulaiko@gmail.com>

DROP DATABASE IF EXISTS `blackeye`;
CREATE DATABASE `blackeye`;
USE `blackeye`;\n";
$sql = "";
$rel = "";
$dir = scandir(".");

foreach($dir as $table) {
    if(
        !is_dir($table)  ||
		$table == "."    ||
		$table == ".."   ||
		$table == ".git" ||
		$table == "test"
    ) {
        continue;
    }

    $table = ".". DIRECTORY_SEPARATOR . $table . DIRECTORY_SEPARATOR;

    // Lets assume the structure is in the `structure.sql` file,
    // the dump in `dump.sql` and relations in `relations.sql`.
    $sql .= file_get_contents($table."structure.sql") ."\n";
    $sql .= file_get_contents($table."dump.sql") ."\n";

    $rel .= file_get_contents($table."relations.sql") ."\n";
}

header("Content-Type: application/sql");

die($header ."\n". $sql ."\n". $rel);
