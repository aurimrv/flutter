import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/video.dart';

class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio( this.pesquisa, {super.key} );

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listVideos( String pesquisa ) {
    Api api = Api();
    return api.search( pesquisa );
  }

  @override void initState() {
    super.initState();
    print("Chamado 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2 - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("Chamado 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3 - build");
    return FutureBuilder<List<Video>>(
        future: _listVideos( widget.pesquisa ),
        builder: (context, snapshot){
          switch( snapshot.connectionState ) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if ( snapshot.hasData ) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video>? videos = snapshot.data;
                      Video? video = videos?[ index ];

                      return GestureDetector(
                        onTap: (){
                          print("Cliqued: ${video.id}");
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(video!.image)
                                  )
                              ),
                            ),
                            ListTile(
                              title: Text( video.title ),
                              subtitle: Text( video.channel ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    itemCount: snapshot.data!.length);
              } else {
                return const Center(
                  child: Text("Nenhum dado para ser exibido."),
                );
              }
          }
        }
    );
  }
}
