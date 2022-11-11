// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:controle_financas/models/user.dart';
import 'package:controle_financas/views/register/register.dart';
import 'package:flutter/material.dart';
import 'package:controle_financas/util/validator.dart'; 

import '../../util/databaseHelper.dart';
import '../../widgets/circular_image_widget.dart';

class Login extends StatefulWidget {
  static const nomeRota = "/login";

  const Login({Key? key}) : super(key: key);
  
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
   
  final _formKey = GlobalKey<FormState>();

  User user = User();

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

    @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

    @override
  void initState() { //Fica escutando o controller e Salva na entidade pessoa 
    super.initState();
    controllerEmail.addListener(() {
      user?.email = controllerEmail.text;
    });
    controllerPassword.addListener(() {
      user?.password = controllerPassword.text;
    });
  }

   bool validate = false;
   
   @override
    Widget build(BuildContext context){
      return Scaffold(
        body: Column(
           children: [
              Container(
                  margin: const EdgeInsets.only(
                    top: 100.0,
                    bottom: 30.0
                  ),
                  alignment: Alignment.center,
                  child: CircularImageWidget(
                  imageProvider: AssetImage('images/logo1.png'),
                  width: 150,
                  heigth: 150,
                )  
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 30.0,
                  ),
                //Colocar uma margin aqui
              ),
              Form(
                key: _formKey,
                child: _formUI(),
              )
              ]
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      );
  }

  Widget _formUI() {
    return Column(
      children: <Widget>[
        
        Container(
          margin: const EdgeInsets.all(30.0),
          alignment: Alignment.center,
          width: 500,
          child: TextFormField(
          controller: controllerEmail, 
            style: TextStyle ( color: Colors.white ),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                )            
              ),

            ),
            validator: Validador.validarEmail(),         
            maxLength: 50,
          ),
        ),

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
              onPressed: realizarLogin,
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: InkWell(
                child: Text(
                  'Cadestre-se',
                  style: TextStyle(
                    color: Colors.lightBlueAccent
                  ),
                  ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(

                      builder: (context) => Register(),
                    )
                  );
                }
              ),  
            )
      ]
    );
      
  }

  realizarLogin() {
    int i = 0;
    verfEmail();
    verfPassword();
    print("oiws"); 
   //print("Email: " + i + "Senha: " + user.password);
  }

  verfEmail() async{
    WidgetsFlutterBinding.ensureInitialized();
    await DatabaseHelper.connect();
    
    var emailFound = await DatabaseHelper.getEmail(controllerEmail.text);

    if(emailFound == null){
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('SmartCoin'),
              content: const Text('Email não encontrado!'),
              actions: [
                TextButton(
                  child: const Text('Ok'),
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

  verfPassword() async{
    WidgetsFlutterBinding.ensureInitialized();
    await DatabaseHelper.connect();
    
    var passwordFound = await DatabaseHelper.getPassword(controllerPassword.text);

    if(passwordFound == null){
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('SmartCoin'),
              content: const Text('Senha incorreta!'),
              actions: [
                TextButton(
                  child: const Text('Ok'),
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
}



