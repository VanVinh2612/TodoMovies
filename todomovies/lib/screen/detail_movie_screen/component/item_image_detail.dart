import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/screen/detail_movie_screen/component/item_video_player_trailer.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

import '../../../common/wave_clipper.dart';

class ItemImageDetail extends StatelessWidget {
  const ItemImageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: height * 0.95,
          width: width,
          child: Image.network(
            'https://image.tmdb.org/t/p/original${snapshot?.data?.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: Colors.black,
              width: width,
              height: height * 0.23,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: width * 0.07),
                    padding: const EdgeInsets.only(left: 10.0),
                    child: itemTitleDetailWidget(snapshot),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: itemsButtonDetail(context, snapshot),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemTitleDetailWidget(AsyncSnapshot<MovieDetail>? snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              getYearOfDay('${snapshot?.data?.releaseDate}'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            Container(
              width: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SvgPicture.asset('assets/svgs/Oval.svg'),
            ),
            Text(
              '${snapshot?.data?.runtime} min',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${snapshot?.data?.originalTitle}'.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget itemsButtonDetail(
      BuildContext context, AsyncSnapshot<MovieDetail>? snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VideoTrailerMovie(id: snapshot?.data?.id),
                ));
          },
          child: const Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 40,
          ),
        ),
        const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
        const Icon(
          Icons.ios_share,
          color: Colors.white,
          size: 40,
        ),
      ],
    );
  }
}

String getYearOfDay(String str) {
  var result = str.split('-');
  return result[0];
}
