<head>
    <link rel="stylesheet" href="style.php" media="screen">
</head>
<script>
   $(document).ready(function(){
      var $deckName;
      var $currentPlayer;
      //Function for deleting decks. Couldn't target properly from odbc_main.
      $('#deckDeleteButton').click(function(){
         $deckName = $(this).closest("td.deckTitle").text();
         $currentPlayer = $("#CPH").val();
         if(confirm("Delete " + $deckName + "?")) {
            $.ajax({
            url: "getData.php",
            method: "POST",
            data: {removeDeck:$deckName, CPH:$currentPlayer},
            success: function(data){
               $("#viewD").click();
            }
        });
         }
         else {
            return false;
         }
      });
   });
</script>
<?php

class php_db 
{
   // the instance variables
   private $conn;
   private $host;
   private $user;
   private $password;
   private $dbaseName;
   private $debug;
   private $status_fatal;
     
   function __construct($username,$pass,$dbname) 
   {
      $this->conn = false;
      $this->host = 'turing';         
      $this->user = $username;           
      $this->password = $pass  ;  
      $this->dbaseName = $dbname;      
      $this->port = '3306';
      $this->debug = true;
      $this->connect();
   }
     
   function __destruct() 
   {
      $this->disconnect();
   }
    
   function connect() 
   {
      if (!$this->conn) 
      {
         try 
         {
            $this->conn = new PDO('mysql:host='.$this->host.';dbname='.$this->dbaseName.'', 
                                  $this->user, $this->password, 
				   array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));  
         }
         catch (Exception $e) 
         {
            die('Error : ' . $e->getMessage());
         }
     
         if (!$this->conn) 
         {
            $this->status_fatal = true;
            echo 'Connection BD failed';
            die();
         } 
         else 
         {
            $this->status_fatal = false;
         }
      }
      return $this->conn;
   }
     
   function disconnect() 
   {
      if ($this->conn) 
      {
         $this->conn = null;
      }
   }
    
   function query($query) 
   {
   $result = $this->conn->prepare($query);
   $ret = $result->execute();

      if (!$ret) 
      {
         echo 'PDO::errorInfo():';
         echo '<br />';
         echo "error SQL: $query";
         die();
      }
      $result->setFetchMode(PDO::FETCH_ASSOC);
      $reponse = $result->fetchAll();
    
      return $reponse;
   }
    
   function execute($query) 
   {
      if (!$response = $this->conn->exec($query)) 
      {
         echo 'PDO::errorInfo():';
         echo '<br />';
         echo 'error SQL: '.$query;
         die();
      }
      return $response;
   }

   function initDatabase()
   {
      try 
      {
    
		 
      }     
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }

   function insert($table, $values)

   { 
     $result = $this->query("INSERT INTO " . $table . " " . " VALUES (" . $values . ")");
   }

   ///////////////////////////////////////////////////////////////////////////////////////////
   // printTable
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printTable($arrValues)
   {
      try
      {
		 echo '<table>';

         // Output header row from keys.
         echo '<tr>';
         foreach($arrValues[0] as $key => $field) 
            echo '<th>' . $key . '</th>';
         echo '</tr>';

         // Output data rows from keys.
         foreach ($arrValues as $row) 
         {
            echo '<tr id = "row">';
            foreach($row as $key => $field) 
               echo '<td id = "cell">' . $field . '</td>';
            echo '</tr>';
         }
         echo '</table>';
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }
   ///////////////////////////////////////////////////////////////////////////////////////////
   // printPlayers
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printPlayers($arrValues)
   {
      try
      {
		 echo '<table id = "tblMain">';

         // Output header row from keys.
         echo '<tr>';
         foreach($arrValues[0] as $key => $field) 
            echo '<th>' . $key . '</th>';
         echo '</tr>';

         // Output data rows from keys.
         foreach ($arrValues as $row) 
         {
            echo '<tr class = "button" id = "playerRow" onclick = "setPlayer(this);">';
            foreach($row as $key => $field) 
               echo '<td id = "playerRow">' . $field . '</td>';
            echo '</tr>';
         }
         echo '</table>';
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }

   ///////////////////////////////////////////////////////////////////////////////////////////
   // printDecks
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printDecks($deckTitles, $deckLists)
   {
      try
      {
         echo '<br>';
		   echo '<table><tr><td class = "deckTitle">' . $deckTitles;
         echo '<input id = "deckDeleteButton" class = "deckDeleteButton" type = "button" value = "X"/>';
         echo '</td></tr></table>';
         echo '<table>';
         // Output data rows from keys.
         foreach ($deckLists as $row)
         {
            echo '<tr>';
            foreach($row as $key => $field) 
               echo '<td class = "deckList">' . $field . '</td>';
            echo '</tr>';
         }
         echo '</table>';
         echo '<div class="deckFooter"></div>';
         echo '<br>';
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }

   ///////////////////////////////////////////////////////////////////////////////////////////
   // printCards
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printCards($arrValues)
   {
      try
      {
		   echo '<table>';
         // Output data rows from keys.
         foreach ($arrValues as $row) 
         {
            echo '<tr id = "card" class = "autoFill">';
            foreach($row as $key => $field) 
               echo '<td class = "autoFill" id = "cell">' . $field . '</td>';
            echo '</tr>';
         }
         echo '</table>';
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }

   ///////////////////////////////////////////////////////////////////////////////////////////
   // printPlayerColors
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printPlayerColors($White, $Blue, $Black, $Red, $Green)
   {
      try
      {
         if($White[0] != "")
         {
		      echo '<div class = "colorBox" id = "W">';
            echo '<img src="img/W.png" class = "R-AlignedSymbol">';
            echo '<table id = "W">';
            foreach ($White as $row) 
            {
               echo '<tr id = "W">';
               foreach($row as $key => $field) 
                  echo '<td id = "W">' . $field . '</td>';
               echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
         }
         else
         {
            echo '<img src="img/W.png" class = "R-AlignedSymbol">';
            echo '<div class = "colorBox" id = "W">No one likes Plains!</div>';
         }
         
         if($Blue[0] != "")
         {
		      echo '<div class = "colorBox" id = "U">';
            echo '<img src="img/U.png" class = "L-AlignedSymbol">';
            echo '<table id = "U">';
            foreach ($Blue as $row) 
            {
               echo '<tr id = "U">';
               foreach($row as $key => $field) 
                  echo '<td id = "U">' . $field . '</td>';
               echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
         }
         else
         {
            echo '<img src="img/U.png" class = "L-AlignedSymbol">';
            echo '<div class = "colorBox" id = "U">No one likes Islands!</div>';
         }

         if($Black[0] != "")
         {
		      echo '<div class = "colorBox" id = "B">';
            echo '<img src="img/B.png" class = "R-AlignedSymbol">';
            echo '<table id = "B">';
            foreach ($Black as $row) 
            {
               echo '<tr id = "B">';
               foreach($row as $key => $field) 
                  echo '<td id = "B">' . $field . '</td>';
               echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
         }
         else
         {
            echo '<img src="img/B.png" class = "R-AlignedSymbol">';
            echo '<div class = "colorBox" id = "B">No one likes Swamps!</div>';
         }

         if($Red != "")
		   {
		      echo '<div class = "colorBox" id = "R">';
            echo '<img src="img/R.png" class = "L-AlignedSymbol">';
            echo '<table id = "R">';
            foreach ($Red as $row) 
            {
               echo '<tr id = "R">';
               foreach($row as $key => $field) 
                  echo '<td id = "R">' . $field . '</td>';
               echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
         }
         else
         {
            echo '<img src="img/R.png" class = "L-AlignedSymbol">';
            echo '<div class = "colorBox" id = "R">No one likes Mountains!</div>';
         }
         if($Green != "")
		   {
		      echo '<div class = "colorBox" id = "G">';
            echo '<img src="img/G.png" class = "R-AlignedSymbol">';
            echo '<table id = "G">';
            foreach ($Green as $row) 
            {
               echo '<tr id = "G">';
               foreach($row as $key => $field) 
                  echo '<td id = "G">' . $field . '</td>';
               echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
         }
         else
         {
            echo '<img src="img/G.png" class = "R-AlignedSymbol">';
            echo '<div class = "colorBox" id = "G">No one likes Forests!</div>';
         }
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }

   ///////////////////////////////////////////////////////////////////////////////////////////
   // printCollection
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printValues($collectionValue, $totalValue)
   {
      try
      {
		 echo '<table id = "tblMain">';
         echo '<tr>';
         foreach($collectionValue[0] as $key => $field) 
            echo '<th>' . $key . '</th>';
         foreach($totalValue[0] as $key => $field)
            echo '<th>' . $key . '</th>'; 
         echo '</tr>';

         echo '<tr>';
         foreach ($collectionValue as $row) 
            foreach($row as $key => $field) 
               echo '<td>' . $field . '</td>';
         foreach ($totalValue as $row) 
            foreach($row as $key => $field) 
               echo '<td>' . $field . '</td>';
         echo '</tr>';

         echo '</table>';
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }

   ///////////////////////////////////////////////////////////////////////////////////////////
   // printCollection
   ///////////////////////////////////////////////////////////////////////////////////////////
   function printCollection($arrValues)
   {
      try
      {
		 echo '<table id = "tblCollection">';

         // Output header row from keys.
         echo '<tr class = "collection">';
         foreach($arrValues[0] as $key => $field) 
            echo '<th class = "collection">' . $key . '</th>';
         echo '<th class = "collection">+</th>';
         echo '</tr>';

         // Output data rows from keys.
         foreach ($arrValues as $row)                              //Start row production
         {
            echo '<tr class = "collection" id = "collectionRow">'; //Begin new row
            foreach($row as $key => $field)                        //Start cell production
            {
               echo '<td id = "collection"><input class = "cell" name = "' . $key . '[]" value = "' . $field . '" readonly></td>';     //Add new cell
            }                                                      //Add input box to the end of the row
            echo '<td class = "quantity"> <input name="numToDeck[]" class = "sideInput" value = "0" type = "number" min=0 max=' . $field . ' oninput="validity.valid||(value="");"> </td>'; 
            echo '</tr>';                                          //End the row
         }
         echo '</table>';
      }
      catch (Exception $e) 
      {
         die('Error : ' . $e->getMessage());
      }
   }
}