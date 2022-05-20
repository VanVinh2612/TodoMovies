// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todomovies/models/images_movie_detail.dart';
import 'package:todomovies/network/api_images_movie_detail_network.dart';
import 'package:todomovies/screen/detail_movie_screen/detail_movie_screen.dart';

class ListImagesDetail extends StatefulWidget {
  const ListImagesDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ListImagesDetail> createState() => _ListImagesDetailState();
}

class _ListImagesDetailState extends State<ListImagesDetail> {
  late ApiImagesMovieDetailNetwork _apiImagesMovieDetailNetwork;
  late Future<ImagesMovieDetail>? imagesMovieDetail;
  @override
  void initState() {
    super.initState();
    _apiImagesMovieDetailNetwork = ApiImagesMovieDetailNetwork();
  }

  @override
  Widget build(BuildContext context) {
    int? _indexImage = 0;
    final id = InheritedDataMovieDetail.of(context)?.id;
    imagesMovieDetail = _apiImagesMovieDetailNetwork.getDataImageMovieDetail(
        'https://api.themoviedb.org/3/movie/$id/images?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits');
    return FutureBuilder<ImagesMovieDetail>(
      future: imagesMovieDetail,
      builder: (context, snapshot) {
        if (snapshot.data?.backdrops?.length != null) {
          _indexImage = snapshot.data?.backdrops?.length;
          if (_indexImage! > 10) {
            _indexImage = 5;
          }
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
                "Something wrong with message: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _indexImage,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w300/${snapshot.data?.backdrops?[index].filePath}',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: Text("Loading"),
          );
        }
      },
    );
  }
}
