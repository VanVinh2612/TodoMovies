import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_detail_model.dart';
import 'package:todomovies/network/api_detail_network.dart';

import 'component/detail_body_component.dart';

class DetailMovieScreen extends StatefulWidget {
  final int? id;
  const DetailMovieScreen({Key? key, this.id}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  late ApiDetailNetwork _apiDetailNetwork;
  late Future<MovieDetail>? futureMovieDetail;
  @override
  void initState() {
    super.initState();
    _apiDetailNetwork = ApiDetailNetwork();
    futureMovieDetail = _apiDetailNetwork.getDataMovieDetail(
        'https://api.themoviedb.org/3/movie/${widget.id}?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<MovieDetail>(
          future: futureMovieDetail,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return InheritedDataMovieDetail(
                snapshot,
                widget.id,
                child: const DetailItemBody(),
              );
            } else {
              return const Center(
                child: Text("Loading"),
              );
            }
          },
        ),
      ),
    );
  }
}

class InheritedDataMovieDetail extends InheritedWidget {
  final AsyncSnapshot<MovieDetail>? snapshot;
  final int? id;
  // ignore: use_key_in_widget_constructors
  const InheritedDataMovieDetail(this.snapshot, this.id,
      {required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedDataMovieDetail? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDataMovieDetail>();
  }
}
