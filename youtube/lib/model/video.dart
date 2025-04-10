class Video {
  String id="";
  String title="";
  String description="";
  String image="";
  String channel="";

  Video({required this.id, required this.title, required this.description,
    required this.image, required this.channel});

  static jsonConverter(Map<String,dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        title: json["snippet"]["title"],
        description: json["snippet"]["description"],
        image: json["snippet"]["thumbnails"]["high"]["url"],
        channel: json["snippet"]["channelTitle"],
    );
  }

  factory Video.fromJson(Map<String,dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelTitle"],
    );
  }
}