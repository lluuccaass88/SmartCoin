import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
 static const _databaseName = "SmartCoin.db";
 static const _databaseVersion = 1;
 static const table = 'TBUser';

// torna esta classe singleton
DatabaseHelper._privateConstructor(); // construtor privado
static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
 
// garante somente uma referência ao banco de dados
static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database!;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL
            balance INTEGER NOT NULL
            saldo INTEGER NOT NULL,
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

}