import 'package:assignment14/DB/databaseConnection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConncetion _databaseConnection;

  Repository() : _databaseConnection = DatabaseConncetion(); // Initialize _databaseConnection in the constructor

  static  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  // Inserting data to table
  Future<int> insertData(String table, Map<String, dynamic> data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  // Read data from table
  Future<List<Map<String, dynamic>>> readData(String table) async {
    var connection = await database;
    return await connection.query(table);
  }

  // Read data from table by Id
  readDataById(table , itemId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?' , whereArgs: [itemId]);
  }

  //Update data from table
  updateData(table , data) async {
    var connection = await database;
      return await connection.update(table, data , where: "id=?" , whereArgs: [data["id"]]);
  }

  //Delete data from table
  deleteData(table , itemId) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  //Read data from table by Column Name
  readDataByColumnName( table ,columnName , columnValue) async {
    var connection = await database;
    return await connection.query(table , where: "$columnName=?" , whereArgs: [columnValue]);
  }
}