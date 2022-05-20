import 'package:flutter/material.dart';
import 'package:todomovies/models/person_detail_model.dart';
import 'package:todomovies/network/api_person_detail_network.dart';
import 'package:todomovies/screen/detail_person_movie_screen/component/person_detail_movie_body.dart';

class PersonDetailMovie extends StatefulWidget {
  const PersonDetailMovie({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  State<PersonDetailMovie> createState() => _PersonDetailMovieState();
}

class _PersonDetailMovieState extends State<PersonDetailMovie> {
  late ApiPersonDetailNetwork _apiPersonDetailNetwork;
  late Future<PersonDetail>? personDetail;
  @override
  void initState() {
    super.initState();
    _apiPersonDetailNetwork = ApiPersonDetailNetwork();
    personDetail = _apiPersonDetailNetwork.getDataPersonDetail(
        'https://api.themoviedb.org/3/person/${widget.id}?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<PersonDetail>(
          future: personDetail,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return InheritedDataPersonDetail(
                snapshot,
                widget.id,
                child: const PersonDetailMovieBody(),
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
class InheritedDataPersonDetail extends InheritedWidget {
  final AsyncSnapshot<PersonDetail>? snapshot;
  final int? id;
  // ignore: use_key_in_widget_constructors
  const InheritedDataPersonDetail(this.snapshot, this.id,
      {required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedDataPersonDetail? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDataPersonDetail>();
  }
}
