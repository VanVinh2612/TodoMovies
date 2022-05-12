import 'package:flutter/material.dart';

import 'component/bottom_navigation_component.dart';
import 'component/now_playing_body_component.dart';

class InTheaterScreen extends StatelessWidget {
  const InTheaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.black87,
      body: NowPlayingBody(),
      bottomNavigationBar: BuildBottomNavigation(),
    );
  }
}
