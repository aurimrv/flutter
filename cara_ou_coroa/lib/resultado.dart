import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  String valor;
  Resultado(this.valor, {super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff61bd8c),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/moeda_${widget.valor}.png"),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("images/botao_voltar.png"),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
