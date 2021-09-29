<html>
<head>
<title>MtG Database</title>
<link rel = "icon" href = "img/C.png" type = "image/x-icon">
<link rel="stylesheet" href="style.php" media="screen">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
    $(document).ready(function()
    {
        var currentPlayer = 0;

        /////////Autofill Card Name/////////
        $('#card').keyup(function()
        {
            var query = $(this).val();
            if(query != '')
            {
                $.ajax(
                {
                    url:"getData.php",
                    method:"POST",
                    data:{pullCards:query},
                    success:function(data)
                    {
                        $('#cardList').fadeIn();
                        $('#cardList').html(data);
                    }
                });
            }
        });

        /////////Remove Suggestion Box On Click/////////
        $(document).on('click', '#card', function(){
            $('#card').val($(this).text());
            $('#cardList').fadeOut();
        });

        /////////Available Collection/////////
        $("#tblMain").on('click', 'tr td', function(e) {
            e.preventDefault();
            var currentRow = $(this).closest("tr");
            currentPlayer = currentRow.find("td").html();
            console.log(currentPlayer);
            $.ajax({
                url: "getData.php",
                method: "POST",
                data: {getCollection:currentPlayer},
                success: function(data){
                    $('#collectionHolder').html(data);
                }
            });
        });

        /////////Available Decks/////////
        $("#viewD").on('click', function(e) {
            e.preventDefault();
            console.log(currentPlayer);
            $.ajax({
                url: "getData.php",
                method: "POST",
                data: {playerDataDecks:currentPlayer},
                success: function(data){
                    $('#deckHolder').html(data);
                }
            });
        });

        /////////Player Colors Table/////////
        $("#nT1").on('click', function(e) {
            e.preventDefault();
            console.log(currentPlayer);
            $.ajax({
                url: "getPlayerColors.php",
                method: "POST",
                data: {data:currentPlayer},
                success: function(data){
                    $('#playerColors').html(data);
                }
            });
        });

        /////////Collection Value Table/////////
        $("#nT3").on('click', function(e) {
            e.preventDefault();
            console.log(currentPlayer);
            $.ajax({
                url: "getData.php",
                method: "POST",
                data: {getValues:currentPlayer},
                success: function(data){
                    $('#collectionValue').html(data);
                    console.log(data);
                }
            });
        });
    });

</script>
</head>
<script>
    var currentPlayer;

    /////////When a tab is opened, hide other forms, match the form to the tab color
    function openTab(tabName, element, color)
    {
        var i, content, links, wrap, tab;
        content = document.getElementsByClassName("formMain");
        for(i = 0; i < content.length; i++)
            content[i].style.display = "none";

        links = document.getElementsByClassName("formTab");
        for(i = 0; i < links.length; i++)
        {
            links[i].style.backgroundColor = "";
            if(links[i].id == "nT1" || links[i].id == "nT3")
            {
                links[i].style.color = '#EBE9EC';
            }
        }

        wrap = document.getElementsByClassName("formWrap");
        for(i = 0; i < wrap.length; i++)
            wrap[i].style.backgroundColor = color;
        
        document.getElementById(tabName).style.display = "block";
        element.style.backgroundColor = color;
    }

    /////////Specify tabs to hide at start. Begin with select players clicked.
    function selectDefault() {
        document.getElementById("selectP").click();
        document.getElementById("nT1").style.display = "none";
        document.getElementById("nT2").style.display = "none";
        document.getElementById("nT3").style.display = "none";
        document.getElementById("goBack").style.display = "none";
        document.getElementById("addC").style.display = "none";
        document.getElementById("addD").style.display = "none";
        document.getElementById("viewD").style.display = "none";
        document.getElementById("moreTab").style.display = "none";
    }

    /////////Stop displaying certain tabs and forms
    function closeTabs()
    {
        var i, tab, content;
        tab = document.getElementsByClassName("formTab");
        for(i = 0; i < tab.length; i++)
            tab[i].style.display = "none";

        content = document.getElementsByClassName("formMain");
        for(i = 0; i < content.length; i++)
            content[i].style.display = "none";
    }

    /////////Get Player ID
    function getCurrentPlayer() {
        return currentPlayer;
    }

    /////////Save Player ID inside of the ID tab. 
    /////////Make tabs visible that are hidden at beginning.
    function setIDTab(currentPlayer)
    {
        tab = document.getElementById("currentPlayer");
        tab.style.visibility = "visible";
        tab.innerHTML = "ID: " + currentPlayer;
        tab = document.getElementById("addC");
        tab.style.display = "inline";
        tab = document.getElementById("addD");
        tab.style.display = "inline";
        tab = document.getElementById("viewD");
        tab.style.display = "inline";
        tab = document.getElementById("moreTab");
        tab.style.display = "inline";
        tab = document.getElementById("idTab1");
        tab.value = currentPlayer;
        tab = document.getElementById("idTab2");
        tab.value = currentPlayer;
    }

    /////////Fetches and saves player ID to an invisible div for grabbing elsewhere.
    function setPlayer(e)
    {
        currentPlayer = e.children[0].innerHTML;
        setIDTab(currentPlayer);
        document.getElementById("CPH").value = currentPlayer;
        document.getElementById("addC").click();
    }
    
    /////////This is only used for the "Add Players" button inside the 
    /////////Select Player tab. Had other plans for it though.
    function switchTab(e) {
        document.getElementById(e).click();
    }

    /////////Switches to other list of tabs when clicking the more tab.
    function moreTabOnClick() {
        closeTabs();
        document.getElementById("nT1").style.display = "inline";
        document.getElementById("nT2").style.display = "inline";
        document.getElementById("nT3").style.display = "inline";
        document.getElementById("goBack").style.display = "inline";
        document.getElementById("nT1").click();
    }

    /////////Switches tabs back when clicking the go back tab.
    function goBackTabOnClick() {
        closeTabs();
        document.getElementById("selectP").style.display = "inline";
        document.getElementById("addP").style.display = "inline";
        document.getElementById("addC").style.display = "inline";
        document.getElementById("addD").style.display = "inline";
        document.getElementById("viewD").style.display = "inline";
        document.getElementById("moreTab").style.display = "inline";
        document.getElementById("nT1").style.display = "none";
        document.getElementById("nT2").style.display = "none";
        document.getElementById("nT3").style.display = "none";
        document.getElementById("goBack").style.display = "none";
        document.getElementById("selectP").click();
    }

    /////////Add Player form, favorite color buttons.
    function setColor(C) {
        var currentColor = document.getElementById("favoriteColor");
        currentColor.value = C;
        var $cols = $('.manaSymbol').click(function(e) {
            $cols.removeClass('colorHighlight');
            $(this).addClass('colorHighlight');
        });
    }

    /////////Toggles the color of certain tabs to a darker hue.
    function colorToggle(e) {
        e.style.color = '#292829';
    }
</script>

<body onLoad = "selectDefault()">

<!-- [[[[[[[[[[ TABS ]]]]]]]]]] -->
<button class = "formTab" onclick = "openTab('colorsTab', this, '#BEDDD1'); colorToggle(this);" id = "nT1">
    Fav. Colors
</button>
<button class = "formTab" onclick = "openTab('newTab2', this, '#BF5D4E')" id = "nT2">
    WIP
</button>
<button class = "formTab" onclick = "openTab('valuesTab', this, '#DDDA89'); colorToggle(this);" id = "nT3">
    Values
</button>
<button class = "formTab" onclick = "goBackTabOnClick()" id = "goBack">
    Go Back
</button>

<button class = "formTab" onclick = "openTab('selectPlayer', this, '#CC744F')" id = "selectP">
    Select Player
</button>

<button class = "formTab" onclick = "openTab('addPlayer', this, '#F5A495')" id = "addP">
    Add Player
</button>

<button class = "formTab" onclick = "openTab('addCards', this, '#AEC5F2')" id = "addC">
    Add Cards
</button>

<button class = "formTab" onclick = "openTab('addDecks', this, '#8ABAC2')" id = "addD">
    Add Decks
</button>

<button class = "formTab" onclick = "openTab('viewDecks', this, '#C8A2C8')" id = "viewD">
    View Decks
</button>

<button class = "formTab" onclick = "moreTabOnClick()" id = "moreTab">
    More
</button>

<button class = "playerTab"
        id = "currentPlayer"
></button>
<input id = "CPH" type = "hidden">


<!-- [[[[[[[[[[ TAB FORMS ]]]]]]]]]] -->
<div id = "selectPlayer" class = "formMain">
    <div class="formWrap">
        <h3>Select a Player</h3>
        <form action="odbc_main.php" method="post">
            <?php include "getPlayers.php";?>
            <br>
            <input name = "hiddenPlayerInput" type = "hidden">
            <div class="btn2" onclick = "switchTab('addP');">
                Add a New Player
            </div>
        </form>
    </div>
</div>

<div id = "addPlayer" class = "formMain">
    <div class="formWrap">
        <h3>Add a Player to the Database:</h3>
        <form action="odbc_main.php" method="post">
            <div class="pf">Name</div> 
            <input name="name" placeholder="Ex: Richard Garfield"autocomplete = "off">
            <br><br>
            <input name = "color" type = "hidden" id = "favoriteColor">
            <div class="pf">Favorite Color</div>
            <div class="colorBox">
                <img class = "manaSymbol" id = "msW" src="img/W.png" onclick="setColor('W');"/>
                <img class = "manaSymbol" id = "msU" src="img/U.png" onclick="setColor('U');"/>
                <img class = "manaSymbol" id = "msB" src="img/B.png" onclick="setColor('B');"/>
                <img class = "manaSymbol" id = "msR" src="img/R.png" onclick="setColor('R');"/>
                <img class = "manaSymbol" id = "msG" src="img/G.png" onclick="setColor('G');"/>
            </div>
            <br><br>
            <input name="submitPlayer" type="submit" class="btn">
        </form>
    </div>
</div>

<div id = "addCards" class = "formMain">
    <div class="formWrap">
        <h3>Add Cards to Your Collection:</h3>
        <form action="odbc_main.php" method="post" id = "testForm">
            <input name = "id" type = "hidden" id = "idTab1"/>
            <div class="pf">Name</div> 
            <input name="name" placeholder="Start typing a card name" id="card" autocomplete = "off"/>  
            <div id="cardList"></div>
            <br><br>
            <input name="set" type = "hidden" value = "KHM" placeholder="Ex: Alpha" id = "setBox">
            <div class="pf">Quantity</div> 
            <input name="quantity" placeholder="Amount to add to your collection" id = "quantityBox" autocomplete = "off">
            <br><br>
            <input name="submitCard" type="submit" class="btn">
        </form>
    </div>
</div>

<div id = "addDecks" class = "formMain">
    <div class="formWrap">
        <form action = "getCollection.php" id = "deckForm" method = "post">
            <input name="cPlayer" id = "inputPlayerID" type = "hidden">
        </form>
        <h3>Add a Deck to the Database:</h3>
        <form action="odbc_main.php" method="post">
            <input name = "id" type = "hidden" id = "idTab2" />
            <div class="pf">Deck Name</div> 
            <input name="deckName" placeholder="Ex: Mono Red">
            <br><br>
            <div class="pf">Available Collection</div>
            <div class="colorBox">
                <br>

                <div id="collectionHolder"></div>
                <br><br><br>
            </div>
            <br><br>
            <input name="submitDeck" type="submit" class="btn">
        </form>
    </div>
</div>

<div id = "viewDecks" class = "formMain">
    <div class="formWrap" name = "deleteDecks">
        <h3>Select a Deck to View:</h3>
        <form action="odbc_main.php" method="post">
            <input name = "id" type = "hidden" id = "idTab2" />
            <div class="pf">Available Decks</div>
            <div class="colorBox">
                <div id="deckHolder"></div>
                <br>
            </div>
            <br>
        </form>
    </div>
</div>

<div id = "colorsTab" class = "formMain">
    <div class="formWrap">
        <h3>Favorite Colors</h3>
        <form action="odbc_main.php" method="post">
            <div id = "playerColors"></div>
            <br>
        </form>
    </div>
</div>

<div id = "newTab2" class = "formMain">
    <div class="formWrap">
        <h3>Notes & Planned Features</h3>
        <div class="colorBox">
            <form action="odbc_main.php" method="post">
                <p>-][- Add a way to remove cards from your collection / delete players
                <p>-][- Add card images on hover (I have a list of the src's, but there are 290)
                <p>-][- Add ways to sort your collection by type, color, etc.
                <p>-][- Add more sets
                <p>-][- Start over from scratch (definitely do this, use React)
                <p>-][- Host it elsewhere
                <br><br><br>
                <h4>-~-~-~<|[Bugs]|>~-~-~-</h4>
                <p> All over
                <p>-][- Add a form to report bugs
                <br><br><br>
            </form>
        </div>
    </div>
</div>

<div id = "valuesTab" class = "formMain">
    <div class="formWrap">
        <h3>Collection Value</h3>
        <form action="odbc_main.php" method="post">
            <div id = "collectionValue"></div>
            <br>
        </form>
    </div>
</div>
</body>
</html>

<?php
if (isset($_POST['submitPlayer'])) 
{
    $operation = "addPlayer";
    $name = escapeshellarg($_POST[name]);
    $color = escapeshellarg($_POST[color]);

    $command = '/home/jad041/public_html/project_cpp/project_main.exe ' . $operation . ' ' . $name . ' ' . $color;

    $command = escapeshellcmd($command);
    system($command);
}
else if (isset($_POST['submitCard'])) 
{
    $operation = "addCard";
    $id = escapeshellarg($_POST[id]);
    $name = escapeshellarg($_POST[name]);
    $set = escapeshellarg($_POST[set]);
    $quantity = escapeshellarg($_POST[quantity]);
    $in_use = 0;

    $command = '/home/jad041/public_html/project_cpp/project_main.exe ' . $operation . ' ' . $id . ' ' . $name . ' ' . $set . ' ' . $quantity . ' ' . $in_use;

    $command = escapeshellcmd($command);
    system($command);    
}
else if (isset($_POST['submitDeck'])) 
{
    $operation = "addDeck" ;
    $id = escapeshellarg($_POST[id]);
    $deckName = escapeshellarg($_POST[deckName]);
    $arraySize = 0;

    for ($i = 0, $j = count($_POST[CARD_NAME]); $i < $j; $i++) {
        $cardName[$i] = escapeshellarg($_POST[CARD_NAME][$i]);
        $quantity[$i] = escapeshellarg($_POST[QUANTITY][$i]);
        $numToDeck[$i] = escapeshellarg($_POST[numToDeck][$i]);
        $arraySize++;
    }
    $command = '/home/jad041/public_html/project_cpp/project_main.exe ' . $operation . ' ' . $id . ' ' . $deckName . ' ' . $arraySize;

    for ($i = 0; $i < $arraySize; $i++) {
        $command .= " $cardName[$i] ";
        $command .= " $quantity[$i] ";
        $command .= " $numToDeck[$i] ";
    }
    $command = escapeshellcmd($command);
    system($command);           
}
?>
