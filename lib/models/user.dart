//import 'package:agenda_aniversario_bd/database_helper.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  double balance = 0;
  

 User();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'password': password,
      'balance': balance
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

// User.fromMap(Map map) {
//    id = map[‘id’];
//    nome = map[‘nome’];
//    saldo = map['saldo'];
// }

// Map toMap() {
//    Map<String, dynamic> map = {
//      ‘nome’: nome,
//      ‘email’: email,
//      ‘aniversario’: aniversario,
//      ‘categoria’: categoria,
//    };

//    // O id pode ser nulo caso o registro esteja sendo criado já que é o banco de dados que
//    // atribui o ID ao registro no ato de salvar. Por isso devemos testar antes de atribuir
//    if (id != null) {
//      map[‘id’] = id;
//    }
//    return map;
//  } //Fecha toMap

}// Fecha class
