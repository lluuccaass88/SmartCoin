// ignore_for_file: prefer_const_constructors

import 'dart:ui';

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
              //validator: Validador.validarNome(),          
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
                //controller: controllerNome,   
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
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            )
            ),
        )



          //AQUI ENTRA UM BOTAO PARA ENVIAR

      ]
    );
      
  }

    inserir() {
   print("oi");
  }

}   

