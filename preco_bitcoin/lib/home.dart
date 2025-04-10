import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0,00";

  void _atualizaPreco() async {
      http.Response resp = await http.get(
          Uri(
           scheme: "https",
           host: "blockchain.info",
           path: "ticker"
          ));
      Map<String, dynamic> retorno = json.decode(resp.body);
      setState(() {
        _preco = retorno["BRL"]["buy"].toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$ $_preco",
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _atualizaPreco(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                child: const Text(
                  "Atualizar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
