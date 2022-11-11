//Aqui da para colocar em outro arquivo
import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

const MONGO_CONN_URL = "mongodb+srv://lucasp_alves8:flutterLucas@cluster0.pzox6yh.mongodb.net/projetoFinalFlutter?retryWrites=true&w=majority";
const USER_COLLECTION = "users";


class DatabaseHelper {

  static var db, userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
     userCollection = db.collection(USER_COLLECTION);
  }

  static insert(String userName, String userEmail, String userPassword) async{
    await userCollection.insert({
      'name': userName, 
      'email': userEmail, 
      'passworld': userPassword, 
      'balance': 0
      });
  }

  static getEmail(String email) async{
    var emailFound = await userCollection.findOne(where.eq("email", '${email}').fields(['str_field','email']));
    return emailFound;
  }

  static getPassword(String password) async{
    var emailFound = await userCollection.findOne(where.eq("password", '${password}').fields(['str_field','email']));
    return emailFound;
  }

}







   
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:mongo_dart/mongo_dart.dart';

// class DatabaseHelper {

//  static const _databaseName = "SmartCoin.db";
//  static const _databaseVersion = 1;
//  static const table = 'TBUser';

// // torna esta classe singleton
// DatabaseHelper._privateConstructor(); // construtor privado
// static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
 
// // garante somente uma referência ao banco de dados
// static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     // instancia o db na primeira vez que for acessado
//     _database = await _initDatabase();
//     return _database!;
//   }

//   // abre o banco de dados e o cria se ele não existir
//   _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   // Código SQL para criar o banco de dados e a tabela
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             id INTEGER PRIMARY KEY,
//             name TEXT NOT NULL,
//             email TEXT NOT NULL,
//             password TEXT NOT NULL
//             balance INTEGER NOT NULL
//             saldo INTEGER NOT NULL,
//           )
//           ''');
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(table, row);
//   }





// }












