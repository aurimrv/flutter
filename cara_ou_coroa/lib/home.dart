import 'dart:math';

import 'package:cara_ou_coroa/resultado.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _jogar() {
    var itens = ["cara", "coroa"];
    var numero = Random().nextInt( itens.length);
    var resultado = itens[numero];
    
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultado(resultado),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd8c),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/logo.png"),
                GestureDetector(
                  onTap: _jogar,
                  child: Image.asset("images/botao_jogar.png"),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
