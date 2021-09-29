<?php
    require_once("php_db.php");
    $myDb = new php_db('jad041','eiPh9uN2','jad041');
    if(!empty($_POST["name"])) {
        //As you type, insert dropdown of up to 6 cards from CARD table with matching characters in their name
        $query ="SELECT * FROM CARD WHERE NAME LIKE '" . $_POST["name"] . "%' ORDER BY NAME LIMIT 0,6";
        $result = $myDb->query($query);
        //Insert boxes with this amalgamation.. Necessary for passing variable in from php. =/
        if(!empty($result)) {
?>
            <ul id="name-list">
                <?php
                    foreach($result as $name) {
                ?>
                <li onClick="selectName('
                    <?php 
                        echo $name["NAME"]; 
                    ?>
                ');"> 
                    <?php 
                        echo $name["NAME"];
                    ?>
                </li>
                <?php 
                    } 
                ?>
            </ul>
<?php 
        }
    } 
?>