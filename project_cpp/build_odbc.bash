#!/bin/bash
set -e -v

g++ -c project_main.cpp
g++ -c odbc_db.cpp
g++ -Wall -I/usr/include/cppconn -o project_main.exe project_main.o odbc_db.o -L/usr/lib -lmysqlcppconn