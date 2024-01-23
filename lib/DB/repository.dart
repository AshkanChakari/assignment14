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
}