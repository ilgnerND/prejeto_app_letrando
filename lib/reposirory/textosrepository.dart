/*import 'package:primeiro_projeto_flutter/models/textosModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class TextosRepository {
  static final TextosRepository _instance = TextosRepository._internal();

  factory TextosRepository() => _instance;

  TextosRepository._internal();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    return _initDatabase().then((db) {
      _database = db;
      return _database;
    });

    /*
    _database = await _initDatabase();
    return _database;*/
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'textos.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE textos (
            id INTEGER PRIMARY KEY,
            img TEXT,
            titulo TEXT,
            autor TEXT,
            genero TEXT,
            dataPublicacao TEXT,
            tipoMidia TEXT,
            statusLeitura TEXT
          )
        ''');
      },
    ); // aguarda a conclusão da criação do banco de dados antes de retornar a conexão
    await database.execute("SELECT * FROM textos LIMIT 1");
    return database;
  }

  Future<int> insertTexto(TextosModel texto) async {
    final db = await database;
    return await db.insert(
      'textos',
      texto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getTextos() async {
    final db = await database; // aguarda a inicialização do banco de dados

    return await db.query('textos');
  }

  Future<void> deleteTexto(int id) async {
    final db = await database;
    await db.delete('textos', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTexto(TextosModel texto) async {
    final db = await database;
    await db.update('textos', texto.toMap(),
        where: 'id = ?', whereArgs: [texto.id]);
  }
}


/*
Future<List<Map<String, dynamic>>> getTextos() async {
  return await _database.then((db) {
    return db.query('textos');
  });
}
  
  Future<List<TextosModel>> getTextos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('textos');
    return List.generate(maps.length, (i) {
      return TextosModel.fromMap(maps[i]);
    });
  }*/*/