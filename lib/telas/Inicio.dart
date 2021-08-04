import 'package:flutter/material.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';

import 'package:youtube_app/API.dart';
import 'package:youtube_app/model/Video.dart';

class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideo(String pesquisa) {
    API api = API();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideo(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videoList = snapshot.data;
                    Video videoItem = videoList[index];

                    return GestureDetector(
                      onTap: () {
                        // FlutterYoutube.playYoutubeVideoById(
                        //     apiKey: CHAVE_YOUTUBE_API,
                        //     videoId: videoItem.id,
                        //     autoPlay: true,
                        //   fullScreen: true,
                        // );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(videoItem.image)),
                            ),
                          ),
                          ListTile(
                            title: Text(videoItem.titulo),
                            subtitle: Text(videoItem.channel),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!!!"),
              );
            }
            break;
        }
      },
    );
  }
}
