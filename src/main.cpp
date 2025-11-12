#include <iostream>
#include <sqlite3.h>

using namespace std;

int main() {
    sqlite3* DB;
    char* errorMessage;

    // Open database
    int exit = sqlite3_open("example.db", &DB);
    if (exit) {
        cerr << "Error open DB " << sqlite3_errmsg(DB) << endl;
        return exit;
    }
    cout << "Opened database successfully" << endl;

    // Create SQL table
    string createTableSQL = "CREATE TABLE IF NOT EXISTS PERSONS("
                                   "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                                   "NAME TEXT NOT NULL);";

    exit = sqlite3_exec(DB, createTableSQL.c_str(), nullptr, 0, &errorMessage);
    if (exit != SQLITE_OK) {
        cerr << "Error Create Table: " << errorMessage << endl;
        sqlite3_free(errorMessage);
    } else {
        cout << "Table created successfully" << endl;
    }

    // Insert data
    string insertSQL = "INSERT INTO PERSONS (NAME) VALUES ('Alice');";
    exit = sqlite3_exec(DB, insertSQL.c_str(), nullptr, 0, &errorMessage);
    if (exit != SQLITE_OK) {
        cerr << "Error Insert: " << errorMessage << endl;
        sqlite3_free(errorMessage);
    } else {
        cout << "Inserted data successfully" << endl;
    }

    // Querying data
    const char* selectSQL = "SELECT * FROM PERSONS;";
    sqlite3_stmt* stmt;

    exit = sqlite3_prepare_v2(DB, selectSQL, -1, &stmt, nullptr);
    if (exit == SQLITE_OK) {
        cout << "Query results:" << endl;

        while (sqlite3_step(stmt) == SQLITE_ROW) {
            cout << "ID: " << sqlite3_column_int(stmt, 0) << ", "
                      << "Name: " << sqlite3_column_text(stmt, 1) << endl;
        }
    } else {
        cerr << "Error Select: " << sqlite3_errmsg(DB) << endl;
    }
    sqlite3_finalize(stmt);

    // Close database
    sqlite3_close(DB);
    return 0;
}
