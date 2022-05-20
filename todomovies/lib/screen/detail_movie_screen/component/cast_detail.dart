import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

import '../../detail_person_movie_screen/detail_person_movie_screen.dart';
import 'item_person_detail.dart';

class CastDetail extends StatefulWidget {
  const CastDetail({Key? key}) : super(key: key);

  @override
  State<CastDetail> createState() => _CastDetailState();
}

class _CastDetailState extends State<CastDetail> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    List<Cast>? listCast = snapshot?.data?.credits?.cast;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Cast',
            style: TextStyle(color: Colors.white54),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
              itemCount: listCast?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonDetailMovie(
                                id: listCast?[index].id),
                          ));
                    },
                  child: ItemPersonDetail(
                      images: (listCast![index].profilePath != null)
                          ? 'https://image.tmdb.org/t/p/original/${listCast[index].profilePath}'
                          : 'https://bathanh.com.vn/wp-content/uploads/2017/08/default_avatar.png',
                      name: '${listCast[index].name}',
                      characters: 'as ${listCast[index].character}'),
                );
              }),
        ),
      ],
    );
  }
}
