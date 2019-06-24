/*
 * Copyright (c) 2019.
 */
import 'dart:async';
import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = "lvpgt.sqlite";
  static final _dbVersion = 1;
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _dbName),
        version: _dbVersion);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    print("----------------------");
    print(_database);
    print("----------------------");

    final result = await _database.query(table);
    return result.toList();
  }

  Future<List<Map<String, dynamic>>> queryString(String query) async {
    final result = await _database.rawQuery(query);
    return result.toList();
  }
}
