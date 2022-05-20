import 'package:flutter/material.dart';
import 'package:todomovies/screen/detail_person_movie_screen/component/item_app_bar._person.dart';
import 'package:todomovies/screen/detail_person_movie_screen/detail_person_movie_screen.dart';

import 'items_body_person_detail.dart';

class PersonDetailMovieBody extends StatelessWidget {
  const PersonDetailMovieBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataPersonDetail.of(context)?.snapshot;
    return Stack(
      children: [
        Container(
          color: Colors.black,
          child: const ItemsBodyPersonDetail(),
        ),
        Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: ItemAppBarPerson(title: '${snapshot?.data?.name}')),
      ],
    );
  }
}
