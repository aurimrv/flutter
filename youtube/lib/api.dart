import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const YOUTUBE_API_KEY="AIzaSyCX_PP5a1sRLeJXlWDPcz7jAorkh8a_Ri0";
const CHANNEL_ID="UCVHFbqXqoYvEWM1Ddxl0QDg";
const BASE_URL="https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> search(String queryStr) async {
    List<Video> videos = [];
    http.Response response = await http.get(
        Uri(
          scheme: "https",
          host: "www.googleapis.com",
          path: "youtube/v3/search",
          queryParameters: {
            'part':'snippet',
            'type':'video',
            'maxResults':'20',
            'order':'date',
            'key':YOUTUBE_API_KEY,
            'channelId':CHANNEL_ID,
            'q':queryStr
          }
        )
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      videos = jsonData["items"].map<Video>(
              (map) {
            return Video.fromJson(map);
          }
      ).toList();
    }
    return videos;
  }
}