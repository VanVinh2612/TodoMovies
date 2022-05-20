import 'dart:ui';

import 'package:flutter/material.dart';

class ItemBackgroundPersonDetail extends StatelessWidget {
  const ItemBackgroundPersonDetail({
    Key? key,
    required this.imageInfo,
  }) : super(key: key);
  final String imageInfo;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.35,
      child: ClipRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Image.network(
            imageInfo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
