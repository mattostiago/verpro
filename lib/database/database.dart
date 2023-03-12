import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:verpro/src/models/produto_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ProdutoEntity])
abstract class AppDatabase extends FloorDatabase {}

/*
class DB {
  DB._();

  static final DB instance = DB._();

  //instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'serproUser.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    //await db.execute(_conta);
    // await db.execute(_outro);
    await db.insert(_produto);
  }

  String get _produto => '''
  CREATE TABLE produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    decricao TEXT,
    foto TEXT,
  );
''';
}
*/