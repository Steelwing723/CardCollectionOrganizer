<?php
    include("php_db.php");
    $myDb = new php_db('jad041','eiPh9uN2','jad041');
    $myDb->initDatabase();
    $White = $myDb->query('SELECT ID, NAME FROM PLAYER WHERE FAVORITE_COLOR = "W"');
    $Blue = $myDb->query('SELECT ID, NAME FROM PLAYER WHERE FAVORITE_COLOR = "U"');
    $Black = $myDb->query('SELECT ID, NAME FROM PLAYER WHERE FAVORITE_COLOR = "B"');
    $Red = $myDb->query('SELECT ID, NAME FROM PLAYER WHERE FAVORITE_COLOR = "R"');
    $Green = $myDb->query('SELECT ID, NAME FROM PLAYER WHERE FAVORITE_COLOR = "G"');
    $myDb->printPlayerColors($White, $Blue, $Black, $Red, $Green);
