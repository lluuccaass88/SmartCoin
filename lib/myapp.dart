import 'package:flutter/material.dart';
import 'package:controle_financas/views/my_homepage.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.nomeRota, //Rota inicial 
      /*routes: {
        MyHomePage.nomeRota: (context) => MyHomePage(),
        CadastrasPessoa.nomeRota: ((context) => CadastrasPessoa())
       // DetalhesAniversario.nomeRota: ((context) => DetalhesAniversario)
      }*/ //Definindo as rotas daaplicação
    );
  }
}

