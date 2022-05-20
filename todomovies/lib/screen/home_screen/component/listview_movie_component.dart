import 'package:flutter/material.dart';
import 'package:todomovies/models/now_playing_model.dart';
import 'package:todomovies/network/network_request.dart';

import '../../detail_movie_screen/detail_movie_screen.dart';

const url = "https://image.tmdb.org/t/p/w500";

class ShowMoviesTab extends StatefulWidget {
  const ShowMoviesTab({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  State<ShowMoviesTab> createState() => _ShowMoviesTabState();
}

class _ShowMoviesTabState extends State<ShowMoviesTab> {
  Future<NowPlaying>? futureNowPlaying;
  @override
  void initState() {
    super.initState();
    futureNowPlaying = NetWorkRequest().fetchResults(
        "https://api.themoviedb.org/3/movie/${widget.category}?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&page=1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(
          bottom: 110.0,
        ),
        padding: const EdgeInsets.only(top: 70.0),
        child: FutureBuilder<NowPlaying>(
          future: futureNowPlaying,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                // controller: ScrollController.,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7,
                ),
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailMovieScreen(
                                id: snapshot.data?.results?[index].id),
                          ));
                    },
                    child: Image.network(
                        '$url${snapshot.data?.results?[index].posterPath}'),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
