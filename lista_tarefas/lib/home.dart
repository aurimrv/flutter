import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();

  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa() {
    String novaTarefa = _controllerTarefa.text;
    // Recuperar lista da GUI
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = novaTarefa;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });
    _controllerTarefa.text = "";
    _salvarArquivo();
  }

  _salvarArquivo() async {
    File arquivo = await _getFile();

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    File arquivo = await _getFile();
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then(( dados ){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });

  }

  Widget criarItemLista(context, index){
    //final item = _listaTarefas[index]['titulo'] + index.toString();

    return Dismissible(
        key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: ( direction ){

          // Armazenando ultima tarefa para undo
          _ultimaTarefaRemovida = _listaTarefas[index];

          _listaTarefas.removeAt(index);
          _salvarArquivo();

          //Snackbar
          final snackbar = SnackBar(
            duration: Duration(seconds: 5),
            content: Text("Tarefa removida!!"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: (){
                // Restaurando tarefa
                setState(() {
                  _listaTarefas.insert(index, _ultimaTarefaRemovida);
                });
                _salvarArquivo();
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: Colors.white
              ),
            ],
          ),
        ),
        child: CheckboxListTile(
            title: Text(_listaTarefas[index]['titulo']),
            value: _listaTarefas[index]['realizada'],
            onChanged: (valorAlterado){
              setState(() {
                _listaTarefas[index]['realizada'] = valorAlterado;
              });
              _salvarArquivo();
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: const InputDecoration(
                      labelText: "Digite sua tarefa",
                    ),
                    onChanged: (text){

                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: (){
                        //Salvar
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                );
              }
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: criarItemLista
            ),
          ),
          //const Text("conteúdo"),
        ],
      )
    );
  }
}
