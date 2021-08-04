class Video{
  String id;
  String titulo;
  String image;
  String channel;
  String description;

  Video({this.id, this.titulo, this.image, this.channel, this.description});

  //DESSA MANEIRA SE TIVER CHAMADAS DE VIDEO OCUPARA CHAMADAS NA MEMORIA
  /*static converterJson(Map<String, dynamic> json){
   return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"]
   );
  }*/

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelTitle"]
    );
  }

}

