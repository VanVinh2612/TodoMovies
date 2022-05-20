import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todomovies/screen/detail_movie_screen/component/cast_detail.dart';
import 'package:todomovies/screen/detail_movie_screen/component/item_image_detail.dart';
import 'package:todomovies/screen/detail_movie_screen/component/person_detail.dart';
import 'package:todomovies/screen/detail_movie_screen/component/production_detail.dart';

import 'image_list_movie_detail.dart';

class ItemDetailBody extends StatelessWidget {
  const ItemDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ItemImageDetail(),
          itemRatingWidget(context),
          const ImageListMovieDetail(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const ProductionDetail(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const ListPersonDetail(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const SingleChildScrollView(child: CastDetail()),
        ],
      ),
    );
  }

  Widget itemRatingWidget(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.1,
      width: width,
      padding: EdgeInsets.symmetric(vertical: width * 0.008, horizontal: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.3,
            color: Colors.grey,
          ),
          bottom: BorderSide(
            width: 0.3,
            color: Colors.grey,
          ),
        ),
        color: Color(0xa12a2a2a),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'My Rating',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          const Text(
            'Rate This Movie',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset('assets/svgs/star.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset('assets/svgs/star.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset('assets/svgs/star.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset('assets/svgs/star.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset('assets/svgs/star.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
