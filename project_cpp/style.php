<?php 
    header("Content-type: text/css");
    $defaultFont = 'Arial, Helvetica, sans-serif';
    $h_input = '14px';
    $border = '1px solid';
    $lightBlue = '#AEC5F2';
    $darkBlue = '#2F3F5E';
    $teal = '#8ABAC2';
    $orange = '#CC744F';
    $pink = '#F5A495';
    $white = '#EBE9EC';
    $darkGrey = '#292829';
    $grey = '#C2BEC0';
    $lilac = '#C8A2C8';
    $darkPurple = '#3E1F70';
    $mint = '#BEDDD1';
    $yellow = '#DDDA89';
    $red = '#BF5D4E';
    $MWhite = '#fffdd7';
    $MBlue = '#a9e0f9';
    $MBlack = '#cbc2bf';
    $MRed = '#f9aa8f';
    $MGreen = '#9bd3ae';
    
?>

table {
    color: <?=$white?>;
    width: 80%;
    border-collapse: collapse;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
}

td.deckTitle {
    border-radius: 15px 15px 0px 0px;
    border: 1px solid white;
    background: <?=$lilac?>;
    color: white;
    font-size: 18px;
    font-weight: bold;
    height: 30px;
    padding-left: 30px;
}

td.deckList {
    border: 1px solid <?=$darkGrey?>;
    width: 80%;
}

div.deckFooter {
    border-radius: 0px 0px 15px 15px;
    border: 1px solid white;
    background: <?=$lilac?>;
    height: 10px;
    width: 80%;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
}

th.collection, td#collection, tr#collection {
    border: 1px solid <?=$white?>;
}

td.autoFill {
    border: 1px solid <?=$darkGrey?>;
}

td, th {
    border: 1px solid <?=$orange?>;
    padding: 0.5px;
    font-size: 16px;
}
tr:nth-child(odd) {
    background: <?=$darkBlue?>;
}
tr:nth-child(even) {
    background: <?=$darkGrey?>;
}
tr.button:hover, tr#collectionRow:hover, tr.autoFill:hover {
    background-color: <?=$lightBlue?>;
    color: <?=$darkGrey?>;
    cursor: pointer;
}

td.quantity{
    width: 50px;
    min-width: 50px;
    border: 1px solid <?=$white?>;
}

input.cell {
    background: <?=$darkGrey?>;
    color: white;
    text-align: center;
}

input.sideInput {
    display: inline;
    width: 100%;
    border-radius: 8px 8px 8px 8px;
    text-align: center;
    padding-left: 18px;
}

input.deckDeleteButton {
    display: inline-block;
    float: right;
    margin: 0px;
    width: 14px;
    height: 14px;
    margin: 4px;
    padding: 3px 4px;
    border-radius: 8px 8px 8px 8px;
    transition: fade 0.2s linear;
    background-color: <?=$white?>;
    font: 400 8px Arial;
}
input.deckDeleteButton:hover {
    background-color: <?=$MRed?>;
    opacity: 50%;
}

body {
    background-color: <?=$white?>;
}

h3 {
    font-family: <?=$font_family?>;
    font-size: <?=$font_size?>;
    background: <?=$darkBlue?>;
    color: <?=$white?>;
    padding: 3px 3px;
    border-radius: 12px 12px 125px 125px;
    text-align: center;
}

h4.cB {
    font-size: 12px;
    border-radius: 35px 12px 35px 12px;
    background: <?=$teal?>;
    color: <?=$darkGrey?>;
    margin-top: 0;
    padding: 8px 8px;
    display: inline;
    float: right;
}

form {
    font-family: <?=$defaultFont?>;
    font-size: <?=$h_input?>;
    color: <?=$darkGrey?>;
}

div.formMain {
    background-color: 'black';
}

button.playerTab {
    border-radius: 8px 8px 0px 0px;
    background-color: <?=$lightBlue?>;
    color: <?=$white?>;
    border: none;
    visibility: hidden;
}

button.formTab {
    border-radius: 8px 8px 0px 0px;
    background-color: <?=$darkBlue?>;
    color: <?=$white?>;
    border: none;
}

button.formTab:hover {
    background-color: <?=$darkGrey?>;
    opacity: 0.5;
    cursor: pointer;
}

div.formWrap {
    background-color: <?=$lightBlue?>;
    transition: 0.2s;
    padding: 1px 30px 30px 30px;
    border-radius: 0px 12px 12px 100px;
    text-align: center;
}

input {
    width: 100%;
    padding: 4px;
    border-radius: 0px 8px 8px 8px;
    border: none;
    background-color: 'white';
}

input.btn {
    width: 75%;
    background-color: <?=$white?>;
    border: none;
    border-radius: 8px;
    transition: 0.2s;
}

input.btn:hover {
    background-color: <?=$darkGrey?>;
    color: <?=$white?>;
    cursor: pointer;
}

div.btn2 {
    width: 75%;
    margin-top: 20px;
    background-color: <?=$white?>;
    border: none;
    border-radius: 8px;
    transition: 0.2s;
    align-items: flex-start;
    text-align: center;
    padding: 4px;
    box-sizing: border-box;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
}


div.btn2:hover {
    background-color: <?=$darkGrey?>;
    color: <?=$white?>;
    cursor: pointer;
}

.pf {
    border-radius: 4px 4px 0px 0px;
    background-color: <?=$darkBlue?>;
    width: max-content;
    padding: 2px;
    color: <?=$white?>;
}

div.colorBox {
    background-color: white;
    border-radius: 0px 12px 12px 100px;
    vertical-align: center;
    padding-top: 3px;
    min-height: 38px;
}

div.colorBox#W {
    background-color: <?=$MWhite?>;
    border-radius: 100px 12px 0px 0px;
    padding: 10px 10px 30px 65px;
}
div.colorBox#U {
    background-color: <?=$MBlue?>;
    border-radius: 0px 0px 100px 0px;
    padding: 10px 55px 35px 10px;
}
div.colorBox#B {
    background-color: <?=$MBlack?>;
    border-radius: 0px 12px 0px 100px;
    padding: 10px 10px 35px 65px;
}
div.colorBox#R {
    background-color: <?=$MRed?>;
    border-radius: 12px 0px 100px 0px;
    padding: 10px 55px 35px 10px;
}
div.colorBox#G {
    background-color: <?=$MGreen?>;
    border-radius: 0px 12px 12px 100px;
    padding: 10px 10px 35px 65px;
}


img.L-AlignedSymbol {
    float: left;
    max-height: 48px;
    max-width: 48px;
}

img.R-AlignedSymbol {
    float: right;
    max-height: 48px;
    max-width: 48px;
}

td#W {
    border: 1px solid <?=$MWhite?>;
    border-radius: 8px 8px 8px 8px;
}
td#U {
    border: 1px solid <?=$MBlue?>;
    border-radius: 8px 8px 8px 8px;
}
td#B {
    border: 1px solid <?=$MBlack?>;
    border-radius: 8px 8px 8px 8px;
}
td#R {
    border: 1px solid <?=$MRed?>;
    border-radius: 8px 8px 8px 8px;
}
td#G {
    border: 1px solid <?=$MGreen?>;
    border-radius: 8px 8px 8px 8px;
}

::placeholder{
    color: <?=$grey?>;
}

img.manaSymbol {
    max-width: 50;
    border-radius: 8px 8px 8px 8px;
}

img.manaSymbol:hover{
    background-color: <?=$darkGrey?>;
    color: <?=$white?>;
    cursor: pointer;
}

.colorHighlight {
    background-color: <?=$darkGrey?>;
    border-radius: 8px 8px 8px 8px;
}

@media (max-width: 450px)
{
    button.playerTab {
        border-radius: 0px 0px 0px 0px;
        border: 1px solid <?=$white?>;
        width: 100%;
        visibility: hidden;
    }

    button.formTab {
        border-radius: 0px 0px 0px 0px;
        border: 1px solid <?=$white?>;
        height: 5%;
        width: 100%;
    }

    div.formWrap {
        border-radius: 0px 0px 12px 100px;
    }
}

