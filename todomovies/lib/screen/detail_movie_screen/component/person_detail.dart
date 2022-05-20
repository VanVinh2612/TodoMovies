import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/screen/detail_movie_screen/component/item_person_detail.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

class ListPersonDetail extends StatelessWidget {
  const ListPersonDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    Crew? getListCrew() {
      final listCrew = snapshot?.data?.credits?.crew;
      if (listCrew != null) {
        for (int i = 0; i < listCrew.length; i++) {
          if (listCrew[i].department?.compareTo('Directing') == 0 &&
              listCrew[i].job?.compareTo('Director') == 0) {
            return listCrew[i];
          }
        }
      }
      return null;
    }

    String imageUrl() {
      if (getListCrew()?.profilePath != null) {
        return 'https://image.tmdb.org/t/p/original/${getListCrew()?.profilePath}';
      } else {
        return 'http://hinhnenhd.com/wp-content/uploads/2021/08/bia-Tai-mien-phi-3000-avatar-dep-tuyet-duoc-chon-loc.jpg';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Director',
            style: TextStyle(color: Colors.white54),
          ),
        ),
        ItemPersonDetail(
          images: imageUrl(),
          name: '${getListCrew()?.name}',
        ),
      ],
    );
  }
}
