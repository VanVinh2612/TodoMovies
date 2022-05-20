import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todomovies/models/images_movie_detail.dart';

class ApiImagesMovieDetailNetwork {
  Future<ImagesMovieDetail> getDataImageMovieDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    // final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (response.statusCode == 200) {
      return ImagesMovieDetail.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can \'t get results');
    }
  }
}
