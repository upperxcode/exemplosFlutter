import 'package:sqlite3/sqlite3.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'dart:io' as io;

const databaseName = 'desepas.db';

class DB {
  DB._();

  static final DB instance = DB._();

  static late Database _database;

  bool created = false;

  Future<Database> get database async {
    if (!created) {
      await _initDatabase();
      created = true;
    }

    return _database;
  }

  _initDatabase() async {
    final dir = await p.getApplicationDocumentsDirectory();

    var path = "${dir.path.toString()}/$databaseName";

    if (!io.File(path).existsSync()) {
      _database = sqlite3.open(path);
      _database.execute(_despesa);
    } else {
      _database = sqlite3.open(path);
    }
  }

  String get _despesa => '''
    CREATE TABLE despesa (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      value REAL,
      date  INT
    );
''';
}
