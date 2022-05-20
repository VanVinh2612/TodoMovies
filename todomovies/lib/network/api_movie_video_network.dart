import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todomovies/models/movie_video_model.dart';

class ApiMovieVideoNetwork {
  Future<VideoMovieDetail> getDataMovieVideoDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = VideoMovieDetail.fromJson(jsonDecode(response.body));
      return data;
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can \'t get results');
    }
  }
}
