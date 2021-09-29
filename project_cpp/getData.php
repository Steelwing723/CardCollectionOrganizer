<?php  
    include("php_db.php");
    $myDb = new php_db('jad041','eiPh9uN2','jad041');
    //Card Name Auto Fill
    if(isset($_POST["pullCards"]))
    {
        $myDb->initDatabase();
        $output = '';
        $compare = "SELECT NAME FROM CARD WHERE NAME LIKE '%".$_POST["pullCards"]."%' LIMIT 0,6";
        $result = $myDb->query($compare);
        $myDb->printCards($result);
    }
    //Get Collection
    if(isset($_POST['getCollection']))
    {
        $myDb->initDatabase();
        $cPlayer =$_POST['getCollection'];
        $query = 'SELECT CARD_NAME, QUANTITY FROM COLLECTION WHERE OWNER_ID = '.$cPlayer . ' AND QUANTITY > 0';
        $Collection = $myDb->query($query);
        $myDb->printCollection($Collection);
    }
    //Get Decks
    if(isset($_POST['playerDataDecks']))
    {
        $myDb->initDatabase();
        $currentPlayer =$_POST['playerDataDecks'];
        $arraySize;
        $deckArray;
        $Decks = $myDb->query('SELECT NAME FROM DECK WHERE OWNER_ID = '.$currentPlayer . ' GROUP BY NAME');

        for($i = 0, $arraySize = count($Decks); $i < $arraySize; $i++) {
            $deckArray = $Decks[$i];
            $deckNames[$i] = $deckArray[NAME];
        }
        for($i = 0; $i < $arraySize; $i++) {
            $query = 'SELECT CARD_NAME, QUANTITY FROM DECK WHERE OWNER_ID = '.$currentPlayer.' AND NAME = "'.$deckNames[$i].'"';
            $Cards = $myDb->query($query);
            $myDb->printDecks($deckNames[$i], $Cards);
        }
    }
    //Get Values
    if(isset($_POST['getValues']))
    {
        $myDb->initDatabase();
        $cPlayer =$_POST['getValues'];
        $collectionValue = $myDb->query('SELECT SUM(COLLECTION.QUANTITY * CARD.PRICE) AS "COLLECTION VALUE", SUM(COLLECTION.IN_USE * CARD.PRICE) AS "VALUE IN DECKS" FROM COLLECTION, CARD WHERE COLLECTION.CARD_NAME = CARD.NAME AND COLLECTION.OWNER_ID = ' . $cPlayer . '');
        $totalValue = $myDb->query('SELECT ((SELECT SUM(COLLECTION.QUANTITY * CARD.PRICE) AS "UNUSED COLLECTION VALUE" FROM COLLECTION, CARD WHERE COLLECTION.CARD_NAME = CARD.NAME AND COLLECTION.OWNER_ID = ' . $cPlayer . ') + (SELECT SUM(COLLECTION.IN_USE * CARD.PRICE) AS "VALUE IN DECKS" FROM COLLECTION, CARD WHERE COLLECTION.CARD_NAME = CARD.NAME AND COLLECTION.OWNER_ID = ' . $cPlayer . ')) AS "TOTAL VALUE"');
        $myDb->printValues($collectionValue, $totalValue);
    }
    //Remove Decks
    if(isset($_POST['removeDeck']))
    {
        $myDb->initDatabase();
        $operation = "deleteDeck";
        $id = "'" . $_POST[CPH] . "'";  //escapeshellcmd() wouldn't work for some reason
        $deckName = "'" . $_POST[removeDeck] . "'";
        $command = '/home/jad041/public_html/project_cpp/project_main.exe ' . $operation . ' ' . $id . ' ' . $deckName . ' ';
        $command= escapeshellcmd($command);
        system($command);
    }