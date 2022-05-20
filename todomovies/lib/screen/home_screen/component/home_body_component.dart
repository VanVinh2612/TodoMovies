import 'dart:ui';

import 'package:flutter/material.dart';

import 'listview_movie_component.dart';

class NowPlayingBody extends StatefulWidget {
  const NowPlayingBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NowPlayingBody> createState() => _NowPlayingBodyState();
}

class _NowPlayingBodyState extends State<NowPlayingBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double _scrollOffset = 0;

  double _getSigmaValue() {
    double value = (_scrollOffset / 400) * 20;
    return value.clamp(0.0, 20.0);
  }

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
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            tabBarViewWidget(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: tabBarWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBarViewWidget() {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TabBarView(
        controller: tabController,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels > 0) {
                _scrollOffset = 200;
              } else {
                _scrollOffset = 0;
              }
              setState(() {});
              return true;
            },
            child: const ShowMoviesTab(category: 'now_playing'),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels > 0) {
                _scrollOffset = 200;
              } else {
                _scrollOffset = 0;
              }
              setState(() {});
              return true;
            },
            child: const ShowMoviesTab(category: 'upcoming'),
          ),
        ],
      ),
    );
  }

  Widget tabBarWidget(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: _getSigmaValue(), sigmaY: _getSigmaValue()),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.height,
          // height: 50.0,
          decoration: BoxDecoration(
            color: const Color(0xff49464b),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              TabBar(
                indicator: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                controller: tabController,
                tabs: const [
                  Tab(
                    text: ('In Theater'),
                  ),
                  Tab(
                    text: ('Up Coming'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
