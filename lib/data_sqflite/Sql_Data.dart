import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_sqflite/sql_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';

class SQLHelper{
  static Database? _db;
  late SqlModel sqlModel;

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db= await initDatabase();
    return _db;
  }

  //initializing database
  initDatabase() async{
    io.Directory documentDirectory= await getApplicationDocumentsDirectory();
    String path= join(documentDirectory.path, 'yum_sqflite.db');
    var db= await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate );
    return db;

  }

  _onCreate(Database db, int version) async{
    await db.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    age INTEGER NOT NULL,
    description TEXT NOT NULL
    )
    """);
  }

//insert operation
   Future<SqlModel> insertItems(SqlModel mymodel) async{
    var dbClient= await db;
    await dbClient?.insert('items', mymodel.toMap());
    return mymodel;

    }


    //get operation
  Future<List<SqlModel>> getItems() async{
    var dbClient= await db;
    final List<Map<String, Object?>> queryResult= await dbClient!.query('items');
    return queryResult.map((e) => SqlModel.fromMap(e)).toList();
  }

  //update operation
  Future<void> update(SqlModel model) async {
    var dbClient= await db;
    await dbClient?.update(
      'items',
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }


  //delete operation
  Future<int> delete(int id) async{
    var dbClient= await db;
    return await dbClient!.delete(
        'items',
      where: 'id = ?',
      whereArgs: [id]

    );
  }

  }
