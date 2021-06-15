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
          'CREATE TABLE content_category(id TEXT PRIMARY KEY, title TEXT,number INTEGER,image_path TEXT,description TEXT)');
      await db.execute(
          'CREATE TABLE question(id TEXT PRIMARY KEY, sentence TEXT,id_content TEXT,number INTEGER, answer_index INTEGER)');
      await db.execute(
          'CREATE TABLE answer(id TEXT PRIMARY KEY, id_question TEXT,id_content TEXT,sentence TEXT,number INTEGER)');
      await db.execute(
          'CREATE TABLE content(id TEXT PRIMARY KEY,id_category TEXT, title TEXT,time TEXT,file_path TEXT,image_path TEXT, video_path TEXT, number INTEGER,is_done BIT, key_word TEXT)');
      await db.execute(
          'CREATE TABLE anniversary(id TEXT PRIMARY KEY,day INTEGER, month INTEGER,year INTEGER,content TEXT)');
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
      String table, String id, String argument) async {
    final db = await DBHelper.database();
    return db.query(table, where: "$argument=?", whereArgs: [id]);
  }

  static Future<void> updateData(String table, Map<String, Object> values,
      String id, String argument) async {
    print('update');
    print(id);
    print(argument);
    final db = await DBHelper.database();

    await db.update(table, values, where: "$argument=?", whereArgs: [id]);
  }
}
