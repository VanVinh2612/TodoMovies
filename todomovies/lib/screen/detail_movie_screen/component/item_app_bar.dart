import 'dart:ui';

import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.06,
              margin: const EdgeInsets.only(left: 60.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              top: height * 0.06 * 0.15,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
