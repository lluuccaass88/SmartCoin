import 'package:flutter/material.dart';

import 'package:controle_financas/views/my_homepage.dart';
import 'package:controle_financas/views/splashScreen';

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
      home: MyHomePage(),
            //A rota do splashscreen
      // initialRoute: SplashScreen.nomeRota,
      //  routes: {
      //    SplashScreen.nomeRota: (context) => SplashScreen(),
      );
  }
}
