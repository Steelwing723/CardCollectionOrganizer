//Project (HW5) - Joshua Davis - ID#010946462
#include "odbc_db.h"
#include "ctype.h"
#include <iostream>
#include <string>
using namespace std;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// addPlayer
//    [*argv[] Format]:
//       [1]: ID,  [2]: Name,  [3]: Favorite Color
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
void addPlayer(odbc_db &myDB, char *argv[])
{
   string id, name, color;
   id = myDB.queryFetch("SELECT (MAX(ID)+1) from PLAYER;");
   id = myDB.stringSnip(id);
   name = argv[2];
   color = argv[3];

   // Insert the new card
   string input = id + ",'" + name + "','" + color + "'"; 
   myDB.insert("PLAYER", input);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// addCard
//    [*argv[] Format]:
//       [2]: ID,  [3]: Name,  [4]: Set,  [5]: Quantity, [6]: Quantity In Decks
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
void addCard(odbc_db &myDB, char *argv[])
{
   // Parse input string to get card Name, Set, Color, and Rarity
   string id, name, set, quantity, in_use, currentQ, newQ, checkCardDB;
   id = argv[2];
   name = argv[3];
   set = argv[4];
   quantity = argv[5];
   in_use = argv[6];

   checkCardDB = myDB.queryFetch("SELECT * FROM CARD WHERE NAME = '" + name + "'");

   if(checkCardDB != "")
   {
      currentQ = myDB.queryFetch("SELECT QUANTITY FROM COLLECTION "
                                 "WHERE OWNER_ID = " + id + " "
                                 "AND CARD_NAME = '" + name + "' "
                                 "AND CARD_SET = '" + set + "'");
      if(currentQ == "")   //If none are found, insert the new card
      {
         string input = id + ",'" + name + "','" + set + "'," + quantity + "," + in_use;   
         myDB.insert("COLLECTION", input);
      }
      else
      {
         currentQ = myDB.stringSnip(currentQ);
         newQ = myDB.getNewQuantity(currentQ, quantity, "add");
         myDB.sendUpdate("UPDATE COLLECTION "
                        "SET QUANTITY = " + newQ + " "
                        "WHERE OWNER_ID = " + id + " "
                        "AND CARD_NAME = '" + name + "' "
                        "AND CARD_SET = '" + set + "'");
      }
   }
   else
      cout << "<br><br>Error, no card called '" << name << "' found in database!<br> When adding a card, try selecting card name from dropdown menu. <br> Only cards from the set 'Kaldheim' are in this current build."; 
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// addDeck
//    [*argv[] Format]:
//       [2]: ID,  [3]: Deck Name,  [4]: Number of Cards in Array,  [5-7, 8-10, etc.]: Card Data
//    [Card Data Format]: 
//       [5]: Card Name,   [6]: Quantity In Collection,  [7]: Quantity Requested For Deck
//       [8]: ...          [9]: ...                      [10]: ...
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
void addDeck(odbc_db &myDB, char *argv[])
{
   string id, deckName, input = "";
   bool conflict = false;
   int arraySize;
   
   arraySize = atoi(argv[4]);
   id = argv[2];
   deckName = argv[3];

   string cardData[arraySize][3];

   int index = 5;
   for(int i = 0; i < arraySize; i++)
   {
      for(int j = 0; j < 3; j++)
         cardData[i][j] = argv[index + j];

      if(cardData[i][1] < cardData[i][2])
      {
         cout << "<br>Uh oh.. something went wrong!<br>";
         conflict = true;
         break;
      }
      index += 3;
   }

   if(!conflict)
   {
      for(int i = 0; i < arraySize; i++)
      {
         if(cardData[i][2] != "0") {
            input = "'" + deckName + "'," + id + ",'" + cardData[i][0] + "'," + cardData[i][2];
            myDB.insert("DECK", input);
            myDB.updateCollectionQuantity(id, cardData[i][0], "KHM", cardData[i][2]);
         }
      }
   }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// deleteDeck
//    [*argv[] Format]:
//       [2]: ID,  [3]: Deck Name
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
void deleteDeck(odbc_db &myDB, char *argv[])
{
   string id(argv[2]);
   string deckName(argv[3]);

   //Add current value from DECK back to COLLECTION
   myDB.sendUpdate("UPDATE COLLECTION, DECK "
                   "SET COLLECTION.QUANTITY = COLLECTION.QUANTITY + DECK.QUANTITY, " 
                   "COLLECTION.IN_USE = COLLECTION.IN_USE - DECK.QUANTITY "
                   "WHERE COLLECTION.OWNER_ID = " + id + " "
                   "AND COLLECTION.CARD_NAME = DECK.CARD_NAME "
                   "AND DECK.NAME = '" + deckName + "'");
   //Remove deck from DECK
   myDB.query("DELETE FROM DECK "
              "WHERE OWNER_ID = " + id + " "
              "AND NAME = '" + deckName + "' ");
}

//-----------------------------------------------------------------------------------------------------------//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MAIN
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------------------------------//
int main(int argc, char *argv[])
{
   string Username = "jad041";
   string mysqlPassword = "eiPh9uN2";
   string SchemaName = "jad041";
   string operation = argv[1];
   odbc_db myDB;
   myDB.Connect(Username, mysqlPassword, SchemaName);
   myDB.initDatabase();

   if(operation == "addPlayer")
      addPlayer(myDB, argv);
   else if(operation == "addCard")
      addCard(myDB, argv);
   else if(operation == "addDeck")
      addDeck(myDB, argv);
   else if(operation == "deleteDeck")
      deleteDeck(myDB, argv);

   myDB.disConnect();//disconect Database

   return 0;
}