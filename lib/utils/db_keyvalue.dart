import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableName = 'keyvalue';
final String columnId = '_id';
final String columnKey = 'key';
final String columnValue = 'value';

// data model class
class Keyvalue {
  int id;
  String key;
  String value;

  Keyvalue();

  // convenience constructor to create a Word object
  Keyvalue.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    key = map[columnKey];
    value = map[columnValue];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnKey: key,
      columnValue: value,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DbHelperKeyvalue {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "IstiqlalApp.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DbHelperKeyvalue._privateConstructor();
  static final DbHelperKeyvalue instance =
      DbHelperKeyvalue._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableName (
                $columnId INTEGER PRIMARY KEY,
                $columnKey TEXT NOT NULL,
                $columnValue TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Keyvalue keyvalue) async {
    Database db = await database;
    int id = await db.insert(tableName, keyvalue.toMap());
    return id;
  }

  Future<int> update(Keyvalue keyvalue) async {
    Database db = await database;
    int id = await db.update(tableName, keyvalue.toMap(),
        where: '$columnKey = ?', whereArgs: [keyvalue.key]);
    return id;
  }

  Future<int> insertOrUpdate(Keyvalue keyvalue) async {
    Database db = await database;
    int id;
    // check is data already there
    List<Map> maps = await db.query(tableName,
        columns: [columnId, columnKey, columnValue],
        where: '$columnKey = ?',
        whereArgs: [keyvalue.key]);
    if (maps.length > 0) {
      // update only
      id = await db.update(tableName, keyvalue.toMap(),
          where: '$columnKey = ?', whereArgs: [keyvalue.key]);
    } else {
      // create new
      id = await db.insert(tableName, keyvalue.toMap());
    }
    return id;
  }

  Future<Keyvalue> query(String key) async {
    Database db = await database;
    List<Map> maps = await db.query(tableName,
        columns: [columnId, columnKey, columnValue],
        where: '$columnKey = ?',
        whereArgs: [key]);
    if (maps.length > 0) {
      return Keyvalue.fromMap(maps.first);
    }
    return null;
  }

  Future close() async {
    Database db = await database;
    db.close();
  }

  Future removeDbTable() async {
    Database db = await database;
    db.delete(tableName);
  }
}
