import 'package:consumo_servico_future/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //https://jsonplaceholder.typicode.com/posts
  Future<List<Post>> _recuperarPosts() async {
    http.Response response = await http.get(
      Uri(
        scheme: "https",
        host: "jsonplaceholder.typicode.com",
        path: "posts"
      )
    );

    var dadosJson = json.decode( response.body );
    List<Post>? posts = List.empty(growable: true);
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      posts.add(p);
    }

    return posts;
  }

  _post() async {
    var corpo = json.encode(
      {
        "userId": 120,
        "id": null,
        "title": "Título",
        "body": "Corpo da postagem"
      }
    );
    http.Response response = await http.post(
      Uri(
        scheme: "https",
        host: "jsonplaceholder.typicode.com",
        path: "posts"
      ),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  _put() async {
    var corpo = json.encode(
        {
          "userId": 120,
          "id": null,
          "title": "Título alterado",
          "body": "Corpo da postagem alterada"
        }
    );
    http.Response response = await http.put(
      Uri(
          scheme: "https",
          host: "jsonplaceholder.typicode.com",
          path: "posts/2"
      ),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  _patch() async {
    var corpo = json.encode(
        {
          "userId": 120,
          "body": "Corpo da postagem alterada"
        }
    );
    http.Response response = await http.patch(
      Uri(
          scheme: "https",
          host: "jsonplaceholder.typicode.com",
          path: "posts/2"
      ),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(
      Uri(
          scheme: "https",
          host: "jsonplaceholder.typicode.com",
          path: "posts/2"
      ),
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: _post,
                    child: Text(
                        "Salvar",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber
                  ),
                ),
                TextButton(
                  onPressed: _put,
                  child: Text(
                    "Atualizar Put",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber
                  ),
                ),
                TextButton(
                  onPressed: _patch,
                  child: Text(
                    "Atualizar Patch",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber
                  ),
                ),
                TextButton(
                  onPressed: _delete,
                  child: Text(
                    "Remover",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPosts(),
                builder: (context, snapshot){
                  switch( snapshot.connectionState ){
                    case ConnectionState.none :
                    case ConnectionState.waiting :
                      return Center(
                          child: CircularProgressIndicator()
                      );
                    case ConnectionState.active :
                    case ConnectionState.done :
                      if( snapshot.hasError ){
                        print("lista: Erro ao carregar" + snapshot.error.toString());
                      }else {
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              List<Post>? lista = snapshot.data;
                              Post? post = lista?[index];
                              return ListTile(
                                title: Text(post!.title),
                                subtitle: Text(post.id.toString()),
                              );
                            }
                        );
                      }
                      break;
                  }
                  return Center(
                    child: Text( "" ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
