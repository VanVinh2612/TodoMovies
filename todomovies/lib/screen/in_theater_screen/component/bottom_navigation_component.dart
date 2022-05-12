import 'dart:ui';

import 'package:flutter/material.dart';

class BuildBottomNavigation extends StatefulWidget {
  const BuildBottomNavigation({Key? key}) : super(key: key);

  @override
  State<BuildBottomNavigation> createState() => _BuildBottomNavigationState();
}

class _BuildBottomNavigationState extends State<BuildBottomNavigation> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavigation(Icons.star, 'Discover', 0),
              bottomNavigation(Icons.list, 'My List', 1),
              bottomNavigation(Icons.search, 'Search', 2),
              bottomNavigation(Icons.note, 'News', 3),
              bottomNavigation(Icons.settings, 'Settings', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigation(IconData icon, String? title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        margin: const EdgeInsets.only(top: 10.0),
        height: 60.0,
        child: Column(
          children: [
            Icon(icon,
                color: index == _selectedItemIndex
                    ? Colors.redAccent
                    : Colors.grey),
            Text(
              title!,
              style: TextStyle(
                  color: index == _selectedItemIndex
                      ? Colors.redAccent
                      : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
