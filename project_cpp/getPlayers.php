<?php
    include("php_db.php");
    $myDb = new php_db('jad041','eiPh9uN2','jad041');
    $myDb->initDatabase();
    $Players = $myDb->query('SELECT ID, NAME FROM PLAYER');
    $myDb->printPlayers($Players);