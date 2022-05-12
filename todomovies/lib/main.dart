import 'package:flutter/material.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';
import 'package:todomovies/screen/in_theater_screen/in_theater_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailMovieScreen(id: 2),
    );
  }
}
