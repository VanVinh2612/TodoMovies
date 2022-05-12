import 'dart:convert';

import 'package:todomovies/models/now_playing_model.dart';

import 'package:http/http.dart' as http;

class NetWorkRequest {
  // static const String url =
  //     "https://api.themoviedb.org/3/movie/now_playing?api_key=d79d9f8467a0e6d7b24624c522cb2ab3";

  // void getMovieData() async {
  //   final response = await http.get(Uri.parse(url));
  //   final data = jsonDecode(response.body) as Map<String, dynamic>?;
  //   if (data == null) {
  //     return;
  //   }
  //   final listResults = Results.fromJson(data);
  // }
  // static List<NowPlaying> parsResults(String responseBody) {
  //   // Future<NowPlaying> future = fetchResults();
  //   var list = jsonDecode(responseBody) as Map<String, dynamic>;
  //   List<NowPlaying> nowPlayingData =
  //       (list as List).map((model) => NowPlaying.fromJson(model)).toList();
  //   return nowPlayingData;
  // }
  final String url;
  NetWorkRequest(this.url);
  Future<NowPlaying> fetchResults() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NowPlaying.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can \'t get results');
    }
  }
}
