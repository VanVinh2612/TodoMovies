import 'package:flutter/material.dart';
import 'package:todomovies/screen/detail_movie_screen/component/item_production_widget.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

class ProductionDetail extends StatelessWidget {
  const ProductionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataMovieDetail.of(context)?.snapshot;
    List<String>? _getListGenre() {
      final genre = snapshot?.data?.genres;
      List<String> listGenre = [];
      if (genre != null) {
        for (var item in genre) {
          listGenre.add(item.name ?? '');
        }
      }
      return listGenre;
    }

    return Column(
      children: [
        itemCustomList(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ItemProduction(
              textProduct: 'Release Date',
              textInformation: '${snapshot?.data?.releaseDate}'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ItemProduction(
              textProduct: 'Runtime',
              textInformation: '${snapshot?.data?.runtime} min'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const ItemProduction(
              textProduct: 'Rating', textInformation: 'Not Available'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ItemProduction(
              textProduct: 'Genre',
              textInformation: _getListGenre()?.join(', ') ?? ''),
        )
      ],
    );
  }

  Widget itemCustomList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      color: const Color(0xff2a2a2a),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.93,
            child: const ItemProduction(
                textProduct: 'Custom Lists', textInformation: 'None'),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}
