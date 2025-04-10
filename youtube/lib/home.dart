import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/em_alta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual=0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio( _resultado ),
      const EmAlta(),
      const Inscricoes(),
      const Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
          width: 98,
          height: 22,

        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
              );
              setState(() {
                _resultado = res!;
              });
            },
            icon: const Icon(Icons.search),
          ),

          /*
          IconButton(
              onPressed: (){print("Ação: camera");},
              icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: (){print("Ação: search");},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){print("Ação: account");},
            icon: Icon(Icons.account_circle),
          ),*/
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
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
        items: const [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.yellow,
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
