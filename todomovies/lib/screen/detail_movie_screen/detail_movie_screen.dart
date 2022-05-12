import 'dart:ui';

import 'package:flutter/material.dart';

import 'component/detail_body_component.dart';

class DetailMovieScreen extends StatefulWidget {
  final int? id;
  const DetailMovieScreen({
    Key? key,
    this.id
  }) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailItemBody(id: widget.id),
    );
  }
}




