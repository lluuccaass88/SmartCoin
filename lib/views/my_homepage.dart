// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:controle_financas/util/databaseHelper.dart';

class MyHomePage extends StatefulWidget {
  static const nomeRota = "/myhomepage";

  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer:  _buildMenu(),
      appBar: AppBar(
        
        title: Text("Smart Coin"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      
       body: Center(
         child: Column(
          children: [
            _balanceContainerWidth(),
         ],
         ) 
         
         
       ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
        
      
    );
  }
}

//Widgets

  Widget _buildMenu(){
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 80.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 0, 231, 12),
              ),
              child: Text('Opções'),
            ),
          ),
          // ignore: prefer_const_constructors
          ListTile(
            title: const Text('Cadastrar Pessoa'),
            // onTap: (){
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => CadastrasPessoa(),
            //     )
            //   );
            // }
          ),
          // ignore: prefer_const_constructors
          ListTile(
            title: const Text('Pesquisar pessoa')
          )
        ],
      ),
    );
  }


Widget _balanceContainerWidth() {
  return Container(
    //margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(10.0),
    width: double.infinity,
    decoration: _myBoxDecoration(), //             <--- BoxDecoration here
    child: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
      Align(
        alignment: Alignment.centerLeft,
          child: Text(
            "Saldo Atual:",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              )
            ),
      ),

      Text(
      "300,00",
        style: TextStyle(
          fontSize: 35.0,
          color: Colors.white,
        )
      ),
    ]   
    ),
    
    
  
  );
}



//Style
//Balance container 
BoxDecoration _myBoxDecoration() {
  return BoxDecoration(
    border: Border(
      bottom: BorderSide(
         color: Colors.lightBlueAccent,
        width: 3.0,
      )
    )
    );
}