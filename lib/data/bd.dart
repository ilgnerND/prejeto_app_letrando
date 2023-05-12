import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class BD {
  // Construtor com acesso privado
  BD._();
  // Criar uma instancia de DB
  static final BD instance = BD._();
  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    sqflite_ffi.databaseFactory = databaseFactoryFfi;
    return await openDatabase(
      join(await getDatabasesPath(), 'textos.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_textos);
    //await db.insert('textos');
  }

  String get _textos => '''
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
        ''';
}
