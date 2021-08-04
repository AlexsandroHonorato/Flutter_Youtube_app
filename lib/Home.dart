

import 'package:flutter/material.dart';

import 'CustomSearchDelegate.dart';
import 'telas/Adicionar.dart';
import 'telas/Biblioteca.dart';
import 'telas/Explorar.dart';
import 'telas/Inicio.dart';
import 'telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _presquisa = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_presquisa),
      Explorar(),
      Adicionar(),
      Inscricao(),
      Biblioteca(),
    ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String search = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _presquisa = search;
                });
              },
          ),
          /*IconButton(
              icon: Icon(Icons.cast_connected),
              onPressed: (){
                print("açao: video cam");
              }
          ),
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: (){
                print("açao: pesquisa");
              }
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                print("açao: conta");
              }
          ) */


        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
        BottomNavigationBarItem(
         // backgroundColor: Colors.grey,
                 icon: Icon(Icons.home),
                   label: 'Home',
            ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.grey,
            icon: Icon(Icons.explore),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.grey,
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Adicionar',
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.grey,
            icon: Icon(Icons.subscriptions_outlined),
            label: 'Inscrições',
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.grey,
            icon: Icon(Icons.video_library_outlined),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
