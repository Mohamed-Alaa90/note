import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database> get db async {
    _db ??= await _initializeDb();
    return _db!;
  }

  Future<Database> _initializeDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'note.db');

    Database myDb = await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        note TEXT NOT NULL
      )
    ''');
    print("Database and table created successfully.");
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("Database upgraded from version $oldVersion to $newVersion.");
  }

  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database myDb = await db;
    return await myDb.rawQuery(sql);
  }

  Future<int> insertData(String sql) async {
    Database myDb = await db;
    return await myDb.rawInsert(sql);
  }

  Future<int> updateData(String sql) async {
    Database myDb = await db;
    return await myDb.rawUpdate(sql);
  }

  Future<int> deleteData(String sql) async {
    Database myDb = await db;
    return await myDb.rawDelete(sql);
  }

  Future<void> closeDb() async {
    Database myDb = await db;
    await myDb.close();
    _db = null;
    print("Database closed.");
  }
}
