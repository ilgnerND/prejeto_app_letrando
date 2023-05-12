/*import 'dart:async';
import 'package:path/path.dart';
import 'package:primeiro_projeto_flutter/models/textosModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  DatabaseHelper._internal();

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'my_database.db');

    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE textos('
            'id INTEGER PRIMARY KEY,'
            'img TEXT,'
            'titulo TEXT,'
            'autor TEXT,'
            'anoPublicacao TEXT,'
            'genero TEXT,'
            'tipoMidia TEXT,'
            'statusLeitura TEXT'
            ')');
      },
      version: 1,
    );
  }

   Future<int> insertText(TextosModel text) async {
    final db = await database;
    return await db.insert('texts', text.toMap());
  }

  Future<List<TextosModel>> getTexts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('texts');
    return List.generate(maps.length, (i) {
      return TextosModel.fromMap(maps[i]);
    });
  }

  Future<int> updateText(TextosModel text) async {
    final db = await database;
    return await db.update('texts', text.toMap(),
        where: 'id = ?', whereArgs: [text.id]);
  }

  Future<int> deleteText(int id) async {
    final db = await database;
    return await db.delete('texts', where: 'id = ?', whereArgs: [id]);
  }
}

*/