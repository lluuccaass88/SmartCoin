import 'package:controle_financas/views/login/login.dart';
import 'package:flutter/material.dart';

import 'package:controle_financas/views/my_homepage.dart';
import 'package:controle_financas/views/splashScreen';
import 'package:controle_financas/views/login/login.dart';
import 'package:controle_financas/views/register/register.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de\assets-for-api-docs\assets\material\Colors.lightBlue.png Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Login(),
      initialRoute: Login.nomeRota,
      routes: {
        Login.nomeRota:((context) => Login()),
        Register.nomeRota:((context) => Register()),
        MyHomePage.nomeRota:(context) => MyHomePage(),
      },

      );
  }
}
