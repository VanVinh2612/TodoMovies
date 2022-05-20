import 'package:flutter/material.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

import 'ListImagesDetail.dart';

class ImageListMovieDetail extends StatelessWidget {
  const ImageListMovieDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    return Container(
      // height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xa12a2a2a),
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
      child: Column(
        children: [
          const ListImagesDetail(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              '${snapshot?.data?.overview}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
