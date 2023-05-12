
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../data/bd.dart';
import '../models/textosModel.dart';

//import 'models/TextoModel.dart';

class TextoRepository {
  static const String tableName = 'textos';

  Future<dynamic> get database async => BD.instance.database;
  //Future<Database> get database async => BD.instance.database;

  Future<List<TextosModel>> getTextos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return TextosModel.fromMap(maps[i]);
    });
  }

  Future<TextosModel> getTexto(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TextosModel.fromMap(maps.first);
    }

    throw Exception('Texto $id não encontrado!');
  }

  Future<void> insertTexto(TextosModel texto) async {
    final db = await database;
  }

  Future<void> updateTexto(TextosModel texto) async {
    final db = await database;
    await db.update(
      tableName,
      texto.toMap(),
      where: 'id = ?',
      whereArgs: [texto.id],
    );
  }

  Future<void> deleteTexto(int id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
