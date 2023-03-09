import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    await db.insert('produto', {});
  }
}
