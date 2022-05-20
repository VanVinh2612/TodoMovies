import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todomovies/models/person_detail_model.dart';


class ApiPersonDetailNetwork {
  Future<PersonDetail> getDataPersonDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PersonDetail.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can \'t get results');
    }
  }
}
