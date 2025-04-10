import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _appImage = const AssetImage("./images/padrao.png");
  var _message = "Escolha uma opção abaixo";
  int _appScore = 0;
  int _userScore = 0;

  void _resetGameState() {
    setState(() {
      _appImage = const AssetImage("./images/padrao.png");
      _message = "Escolha uma opção abaixo";
      _appScore = 0;
      _userScore = 0;
    });
  }

  void _selectedOption(String usrChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var rand = Random().nextInt(3);
    var appChoice = options[rand];

    switch(appChoice) {
      case "pedra":
        setState(() {
          _appImage = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _appImage = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _appImage = const AssetImage("images/tesoura.png");
        });
        break;
    }
    // Validation
    if ((usrChoice == "pedra" && appChoice == "tesoura" ) ||
        (usrChoice == "tesoura" && appChoice == "papel" ) ||
        (usrChoice == "papel" && appChoice == "pedra" )) {
      setState(() {
        _message = "Parabéns!!! Você ganhou.";
        _userScore++;
      });
    } else if ((appChoice == "pedra" && usrChoice == "tesoura" ) ||
        (appChoice == "tesoura" && usrChoice == "papel" ) ||
        (appChoice == "papel" && usrChoice == "pedra" )) {
      setState(() {
        _message = "Você perdeu.";
        _appScore++;
      });
    } else {
      setState(() {
        _message = "Empatamos.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
          Image(
            image: _appImage,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Image.asset("./images/pedra.png", height: 100),
                onTap: () => _selectedOption("pedra"),
              ),
              GestureDetector(
                child: Image.asset("./images/papel.png", height: 100),
                onTap: () => _selectedOption("papel"),
              ),
              GestureDetector(
                child: Image.asset("./images/tesoura.png", height: 100),
                onTap: () => _selectedOption("tesoura"),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("User Score: $_userScore"),
                Text("App Score: $_appScore"),
              ],
            ),
            TextButton.icon(
                onPressed: () => _resetGameState(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                ),
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
