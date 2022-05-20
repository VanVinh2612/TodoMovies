import 'package:flutter/material.dart';
import 'package:todomovies/models/person_detail_model.dart';
import 'package:todomovies/screen/detail_person_movie_screen/detail_person_movie_screen.dart';

import 'item_background_person_detail.dart';
import 'item_info_person.dart';
import 'item_movies_person.dart';

class ItemsBodyPersonDetail extends StatefulWidget {
  const ItemsBodyPersonDetail({Key? key}) : super(key: key);

  @override
  State<ItemsBodyPersonDetail> createState() => _ItemsBodyPersonDetailState();
}

class _ItemsBodyPersonDetailState extends State<ItemsBodyPersonDetail>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedDataPersonDetail.of(context)?.snapshot;
    String _getYearsOld() {
      if (snapshot?.data?.birthday != null) {
        String? yearOfBirth = snapshot?.data?.birthday?.split('-')[0];
        String yearOld;
        if (snapshot?.data?.deathday != null) {
          String? yearOfDeath = snapshot?.data?.deathday?.split('-')[0];
          yearOld =
              (int.parse(yearOfDeath!) - int.parse(yearOfBirth!)).toString();
        }
        yearOld = (DateTime.now().year - int.parse(yearOfBirth!)).toString();
        return yearOld;
      }
      return 'Unknow';
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ItemBackgroundPersonDetail(
                imageInfo: (snapshot?.data?.profilePath != null)
                    ? 'https://image.tmdb.org/t/p/original/${snapshot?.data?.profilePath}'
                    : 'https://bathanh.com.vn/wp-content/uploads/2017/08/default_avatar.png',
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.width * 0.02,
                child: ItemInfoPerso(
                    imageInfo: (snapshot?.data?.profilePath != null)
                        ? 'https://image.tmdb.org/t/p/original/${snapshot?.data?.profilePath}'
                        : 'https://bathanh.com.vn/wp-content/uploads/2017/08/default_avatar.png',
                    age: '${_getYearsOld()} Years old',
                    address: '${snapshot?.data?.placeOfBirth}',
                    indexMovie: '12 Movies'),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: tabBarWidget(context),
          ),
          Container(
            color: const Color(0xff2a2a2a),
            child: tabBarViewWidget(),
          ),
        ],
      ),
    );
  }

  Widget tabBarWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height * 0.035,
          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            controller: tabController,
            tabs: const [
              Tab(
                text: ('Biography'),
              ),
              Tab(
                text: ('Movies'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tabBarViewWidget() {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height * 0.8,
      child: TabBarView(
        controller: tabController,
        children: [
          itemBiographyWidget(),
          itemListMoviesWidget(),
        ],
      ),
    );
  }

  Widget itemListMoviesWidget() {
    final snapshot = InheritedDataPersonDetail.of(context)?.snapshot;
    List<Cast>? cast = snapshot?.data?.credits?.cast;
    List<Cast>? crew = snapshot?.data?.credits?.crew;
    List<Cast>? listCast() {
      if (cast!.isNotEmpty && crew!.isNotEmpty) {
        if (cast.isEmpty) {
          return crew;
        } else if (crew.isEmpty) {
          return cast;
        } else {
          for (int i = 0; i < cast.length; i++) {
            for (int j = 1; j < crew.length; j++) {
              if (cast[i].id == crew[j].id) {
                return cast;
              }
              return cast + crew;
            }
          }
        }
      }
      return null;
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listCast()?.length,
      itemBuilder: (context, index) => ItemMoviesPerson(
        image: (listCast()?[index].posterPath != null)
            ? 'https://image.tmdb.org/t/p/w92/${listCast()?[index].posterPath}'
            : 'https://jdict.net/_next/static/default-avatar.png',
        nameMovie: '${listCast()?[index].originalTitle}',
        years: '${listCast()?[index].releaseDate}',
      ),
    );
  }

  Widget itemBiographyWidget() {
    final snapshot = InheritedDataPersonDetail.of(context)?.snapshot;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '${snapshot?.data?.biography}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
