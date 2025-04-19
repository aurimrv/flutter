import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();

  String _resultado = "Resultado";

  _recuperarCep() async {
    String cep = _controllerCep.text;

    http.Response response = await http.get(
        Uri(
          scheme: "https",
          host: "viacep.com.br",
          path: "ws/${cep}/json",
        ),
    ) as http.Response;

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _resultado = "${retorno["logradouro"]}, ${retorno["bairro"]}, ${retorno["localidade"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um CEP. ex: 01001000",
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _controllerCep,
            ),
            TextButton(
              onPressed: _recuperarCep,
              child: Text("Clique aqui")
            ),
            Text(_resultado),
          ],

        ),
      ),
    );
  }
}
