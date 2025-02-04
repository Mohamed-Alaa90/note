import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    // ignore: unnecessary_null_comparison, recursive_getters
    if (db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'note.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 2,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade----------------------");
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes" (
    "id" INTEGER AUTOINCREMENT NOT NULL  PRIMARY KEY , 
    "notes" TEXT NOT NULL
    )
    ''');

    print("create data--------------------------");
  }

  readData(String sql) async {
    Database? myDb = await db;

    List<Map<String, Object?>> respponse = await myDb!.rawQuery(sql);
    return respponse;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int respponse = await mydb!.rawInsert(sql);
    return respponse;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int respponse = await mydb!.rawUpdate(sql);
    return respponse;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int respponse = await mydb!.rawDelete(sql);
    return respponse;
  }
}
