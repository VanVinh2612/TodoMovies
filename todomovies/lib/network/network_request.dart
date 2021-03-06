import 'dart:convert';

import 'package:todomovies/models/now_playing_model.dart';

import 'package:http/http.dart' as http;

class NetWorkRequest {
  Future<NowPlaying> fetchResults(String url) async {
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
