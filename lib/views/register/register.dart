
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:ui';

import 'package:controle_financas/models/user.dart';
import 'package:controle_financas/util/databaseHelper.dart';
import 'package:controle_financas/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:controle_financas/util/validator.dart'; 

import '../../widgets/circular_image_widget.dart';
class Register extends StatefulWidget {
  static const nomeRota = "/userRegister";

  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  User? user = User();

   //Controllers
   final controllerNome = TextEditingController();
   final controllerEmail = TextEditingController();
   final controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerNome.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

    @override
  void initState() { //Fica escutando o controller e Salva na entidade pessoa 
    super.initState();
    controllerNome.addListener(() {
      user?.name = controllerNome.text;

    });
    controllerEmail.addListener(() {
      user?.email = controllerEmail.text;
    });
    controllerPassword.addListener(() {
      user?.password = controllerPassword.text;
    });
  }

  bool validate = false;

  //References the manager database class
  //final DatabaseHelper dbHelper = DatabaseHelper.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView( 
        child: Form(
          key: _formKey,
          child: _formUI(),
        ),
      )
    );
  }

  Widget _formUI() {
    return Column(
      children: <Widget>[
        
        //Name field
        Container(
          margin: const EdgeInsets.all(30.0),
          alignment: Alignment.center,
          width: 500,
          child: TextFormField(
            controller: controllerNome, 
            style: TextStyle ( color: Colors.white ),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: 'Nome:',
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.lightBlueAccent,
                )            
              ),

            ),
              validator: Validador.validarNome(),         
            maxLength: 50,
          ),
        ),

        //Email field
        Container(
          margin: const EdgeInsets.only(
            left: 30.0, 
            right: 30.0, 
            top: 10.0, 
            bottom: 30.0
            ),
          alignment: Alignment.center,
          width: 500,
          child: TextFormField(
            controller: controllerEmail, 
            style: TextStyle ( color: Colors.white ),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: 'Email:',
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.lightBlueAccent,
                )            
              ),

            ),
            validator: Validador.validarEmail(),         
            maxLength: 50,
          ),
        ),

        //password field
        Container(
          margin: const EdgeInsets.only(
            left: 30.0, 
            right: 30.0, 
            top: 10.0, 
            bottom: 10.0
          ),
          alignment: Alignment.center,
          width: 500,
          child: TextFormField(
          controller: controllerPassword,   
            style: TextStyle ( color: Colors.white ),
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                  )              
                ),
            ),
                //validator: Validador.validarNome(),          
            maxLength: 50,
          ),
        ),

        const SizedBox(height: 15.0),
        
        ElevatedButton(
              onPressed: inserir,
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
      ]
    );
      
  }

    inserir() async {
      var emailFound;
      WidgetsFlutterBinding.ensureInitialized();
      await DatabaseHelper.connect();
      emailFound = await DatabaseHelper.getEmail(controllerEmail.text);
      
      if(emailFound == null){
        await DatabaseHelper.insert(controllerNome.text, controllerEmail.text, controllerPassword.text);
        return AlertDialog(
          title: const Text('SmartCoin'),
          content: const Text('Cadastro realizado com sucesso!'),
          actions: [
            TextButton(
              child: const Text('Voltar para a tela de login'),
              onPressed: () {
                Navigator.pushNamed(context, Login.nomeRota);
              },
            ),
          ],
        );
      }else{
        print("n rolou");
        return AlertDialog(
          title: const Text('SmartCoin'),
          content: const Text('Este email já esta cadastrado!'),
          actions: [
            TextButton(
              child: const Text('Voltar para a tela de login'),
              onPressed: () {
                Navigator.pushNamed(context, Login.nomeRota);
              },
            ),
          ],
        );
      }
      
      
      
      }

      _voltarDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cadastro de Aniversários'),
          content: const Text('Cadastro Efetuado Com Sucesso !'),
          actions: [
            TextButton(
              child: const Text('Voltar para a tela inicial'),
              onPressed: () {
                Navigator.pushNamed(context, Login.nomeRota);
              },
            ),
          ],
        );
      },
    );
  }
}