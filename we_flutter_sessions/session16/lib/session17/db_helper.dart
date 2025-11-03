import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'ecommerce.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullname TEXT NOT NULL,
        password TEXT NOT NULL,
        type TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE product (
        code INTEGER PRIMARY KEY,
        product_name TEXT,
        price REAL,
        image_url TEXT,
        qu INTEGER,
        discount REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY,
        user_id INTEGER,
        product_code INTEGER,
        qu INTEGER,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION,
        FOREIGN KEY (product_code) REFERENCES product (code) ON DELETE NO ACTION
      )
    ''');

    await db.execute('''
      CREATE TABLE fav (
        id INTEGER PRIMARY KEY,
        user_id INTEGER,
        product_code INTEGER,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION,
        FOREIGN KEY (product_code) REFERENCES product (code) ON DELETE NO ACTION
      )
    ''');
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return await db.query(table);
  }
}
