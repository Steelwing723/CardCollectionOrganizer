#include "odbc_db.h"
#include <string>
using namespace std;

// Connect to the database
void odbc_db::Connect(string Username, string mysqlPassword, string SchemaName)
{
   try
   {
      driver = get_driver_instance();
      connection = driver->connect("tcp://127.0.0.1:3306", Username, mysqlPassword);
      connection->setSchema(SchemaName);
   }
   catch (sql::SQLException &e) 
   {
      cout << "ERROR: SQLException in " << __FILE__;
      cout << " (" << __func__<< ") on line " << __LINE__ << endl;
      cout << "ERROR: " << e.what();
      cout << " (MySQL error code: " << e.getErrorCode();
      cout << ", SQLState: " << e.getSQLState() << ")" << endl;
   }
}

// Disconnect from the database
void odbc_db::disConnect()  
{
   //cout << "about to delete resultSet";
   delete resultSet;
   //cout << "about to delete statement";
   delete statement;
   //delete resultSet;
   connection -> close();
   //cout << "about to delete connection";
   delete connection;
}

// Execute an SQL query passed in as a String parameter
// and print the resulting relation
string odbc_db::query(string q) 
{
string builder = ""; 
   try 
   {
      resultSet = statement->executeQuery(q);
      builder.append("<br>---------------------------------<br>");
      builder.append("Query: <br>" + q + "<br><br>Result: ");
      builder.append(print(resultSet));
   }
   catch (sql::SQLException e) 
   {
      cout << "ERROR: SQLException in " << __FILE__;
      cout << " (" << __func__<< ") on line " << __LINE__ << endl;
      cout << "ERROR: " << e.what();
      cout << " (MySQL error code: " << e.getErrorCode();
      cout << ", SQLState: " << e.getSQLState() << ")" << endl;
   }
   return builder;
}

string odbc_db::queryFetch(string q) 
{
string builder = ""; 
   try 
   {
      resultSet = statement->executeQuery(q);
      builder.append(print(resultSet));
   }
   catch (sql::SQLException e) 
   {
      cout << "ERROR: SQLException in " << __FILE__;
      cout << " (" << __func__<< ") on line " << __LINE__ << endl;
      cout << "ERROR: " << e.what();
      cout << " (MySQL error code: " << e.getErrorCode();
      cout << ", SQLState: " << e.getSQLState() << ")" << endl;
   }
   return builder;
}

// Print the results of a query with attribute names on the first line
// Followed by the tuples, one per line
string odbc_db::print (sql::ResultSet *resultSet) 
{
string builder = ""; 
   try
   {
      if (resultSet -> rowsCount() != 0)
      {
         sql::ResultSetMetaData *metaData = resultSet->getMetaData();
         int numColumns = metaData->getColumnCount();
         builder.append(printHeader( metaData, numColumns));
         builder.append(printRecords( resultSet, numColumns));
      }
      else
         throw runtime_error("ResultSetMetaData FAILURE - no records in the result set");
   }
   catch (std::runtime_error &e) 
   {
   }
   return builder;
 }

// Print the attribute names
string odbc_db::printHeader(sql::ResultSetMetaData *metaData, int numColumns)
{ 
string builder = "";

   try 
   {
      //Printing Column names
      for (int i = 1; i <= numColumns; i++) 
      {
         if (i > 1)
            builder.append(",  ");
         builder.append(metaData->getColumnName(i));; //ColumnName
      }
      builder.append("<br>");
   }
   catch (sql::SQLException &e)
   {
   }
   return builder;
}

// Print the attribute values for all tuples in the result
string odbc_db::printRecords(sql::ResultSet *resultSet, int numColumns)   
{ 
string builder = "";

   //Printing Records
   try
   {
      while (resultSet->next()) 
      {
         for (int i = 1; i <= numColumns; i++) 
         {
            if (i > 1)
               builder.append(",  ");
            builder.append(resultSet->getString(i)); 
         }
         builder.append("<br>");
      }
   }
   catch (sql::SQLException &e)
   {
   }
   return builder;
}

// Insert into any table, any values from data passed in as String parameters
void odbc_db::insert(string table, string values) 
{
   string query = "INSERT into " + table + " values (" + values + ")";

   statement->executeUpdate(query);
}

void odbc_db::update(string table, string column, string value, string scope)
{
   string query = "UPDATE " + table + " SET " + column + " = " + value + " WHERE " + scope;
}

////////////////////////////////////////////////////////////////////////////
// Fixes some weird stuff that happens with char* types
////////////////////////////////////////////////////////////////////////////
string odbc_db::stringSnip(string str)
{
   string output = "";
   for(int i = 0; i < str.length(); i++)
   {
      if(isdigit(str[i]))
         output = output + str[i];
   }
   return output;
}

////////////////////////////////////////////////////////////////////////////
// For converting strings to ints and figuring out a difference
////////////////////////////////////////////////////////////////////////////
string odbc_db::getNewQuantity(string currentQ, string used, string operation)
{
   string nQString;
   int cQ, uQ, nQ = 0;
   cQ = stoi(currentQ);
   uQ = stoi(used);

   if(operation == "add")
      nQ = cQ + uQ;
   else
      nQ = cQ - uQ;
   nQString = to_string(nQ);

   return nQString;
}

void odbc_db::sendUpdate(string command)
{
   statement->executeUpdate(command);
}
////////////////////////////////////////////////////////////////////////////
// Switches values inside COLLECTION and DECK to update IN_USE and QUANTITY
////////////////////////////////////////////////////////////////////////////
void odbc_db::updateCollectionQuantity(string id, string name, string set, string used)
{
   string currentQ, newQ = "";

   currentQ = queryFetch("SELECT QUANTITY FROM COLLECTION "
                         "WHERE OWNER_ID = " + id + " "
                         "AND CARD_NAME = '" + name + "' "
                         "AND CARD_SET = '" + set + "'");
   currentQ = stringSnip(currentQ);
   newQ = getNewQuantity(currentQ, used, "subtract");

   statement->executeUpdate("UPDATE COLLECTION "
                            "SET QUANTITY = " + newQ + " "
                            "WHERE OWNER_ID = " + id + " "
                            "AND CARD_NAME = '" + name + "' "
                            "AND CARD_SET = '" + set + "'");

   currentQ = queryFetch("SELECT IN_USE FROM COLLECTION "
                         "WHERE OWNER_ID = " + id + " "
                         "AND CARD_NAME = '" + name + "' "
                         "AND CARD_SET = '" + set + "'");
   currentQ = stringSnip(currentQ);
   newQ = getNewQuantity(currentQ, used, "add");

   statement->executeUpdate("UPDATE COLLECTION "
                            "SET IN_USE = " + newQ + " "
                            "WHERE OWNER_ID = " + id + " "
                            "AND CARD_NAME = '" + name + "' "
                            "AND CARD_SET = '" + set + "'");
}

// Remove all records and fill them with values for testing
// Assumes that the tables are already created
// Assumes that connection to database is already made
void odbc_db::initDatabase()
{
   try 
   {
      // Drop records from existing tables here
      statement = connection->createStatement();
   }
   catch (sql::SQLException &e)
   {
      cout << "ERROR: SQLException in " << __FILE__;
      cout << " (" << __func__<< ") on line " << __LINE__ << endl;
      cout << "ERROR: " << e.what();
      cout << " (MySQL error code: " << e.getErrorCode();
      cout << ", SQLState: " << e.getSQLState() << ")" << endl;
   }
}
