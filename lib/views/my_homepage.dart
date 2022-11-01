// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element
import 'package:flutter/material.dart';


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
      drawer: _buildMenu(), 
      appBar: AppBar(
        title: Text("Não esqueça"),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }

  Widget _buildMenu(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Opções'),
            ),
          ),
          ListTile(
            title: const Text('Cadastrar Pessoa'),
           /* onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastrasPessoa(),
                )
              );
            }*/
          ),
          ListTile(
            title: const Text('Pesquisar pessoa')
          )
        ],
      ),
    );
  }
}