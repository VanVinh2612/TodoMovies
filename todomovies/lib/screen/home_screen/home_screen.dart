import 'package:flutter/material.dart';

import 'component/bottom_navigation_component.dart';
import 'component/home_body_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.black87,
      body: NowPlayingBody(),
      bottomNavigationBar: BuildBottomNavigation(),
    );
  }
}
