import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  /* static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'history_db.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE content_category(id TEXT PRIMARY KEY, title TEXT,number INTEGER,imagePath TEXT)');
    }, version: 1);
  }
 */
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'history_db.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE content_category(id TEXT PRIMARY KEY, title TEXT,number INTEGER,imagePath TEXT)');
      await db.execute(
          'CREATE TABLE content(id TEXT PRIMARY KEY,id_category TEXT, title TEXT,filePath TEXT,imagePath TEXT, number INTEGER,isDone BIT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getDataById(
      String table, String id) async {
    final db = await DBHelper.database();
    return db.query(table, where: "id_category=?", whereArgs: [id]);
  }
}
