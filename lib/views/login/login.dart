// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../widgets/circular_image_widget.dart';

class Login extends StatefulWidget {
  static const nomeRota = "/login";

  const Login({Key? key}) : super(key: key);
  
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
   @override
    Widget build(BuildContext context){
      return Scaffold(
        body: Column(
           children: [
              Container(
                  margin: const EdgeInsets.all(100.0),
                  alignment: Alignment.center,
                  child: CircularImageWidget(
                  imageProvider: AssetImage('images/logo1.png'),
                  width: 150,
                  heigth: 150,
                )  
              ),
              Text(
                "Login"
                //Colocar uma margin aqui
              ),
              _formUI(),
              _formUI(),
          ],
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
            //controller: controllerNome,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 3.0,
                )
              ),
            ),
            //validator: Validador.validarNome(),          
          maxLength: 50,
          )  
        ),


        Container(
          margin: const EdgeInsets.all(30.0),
          alignment: Alignment.center,
          width: 500,
          child: TextFormField(
            //controller: controllerNome,
            decoration: InputDecoration(
              hintText: 'Senha',
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 3.0,
                )
              ),
            ),
            //validator: Validador.validarNome(),          
          maxLength: 50,
          )  
        ),
            

          //AQUI ENTRA UM BOTAO PARA ENVIAR

      ]
    );
      
  }
}   

