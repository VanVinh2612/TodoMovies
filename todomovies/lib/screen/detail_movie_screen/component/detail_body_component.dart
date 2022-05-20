
import 'package:flutter/material.dart';
import 'package:todomovies/screen/detail_movie_screen/component/item_app_bar.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

import 'item_detail_body_component.dart';

class DetailItemBody extends StatefulWidget {
  final int? id;
  const DetailItemBody({Key? key, this.id}) : super(key: key);

  @override
  State<DetailItemBody> createState() => DetailItemBodyState();
}

class DetailItemBodyState extends State<DetailItemBody> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    return Stack(
      children: [
        Container(
          color: Colors.black,
          child: const ItemDetailBody(),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: ItemAppBar(title: '${snapshot?.data?.originalTitle}'),
        ),
      ],
    );
  }
}

