import 'dart:ui';

import 'package:flutter/material.dart';

class DetailItemBody extends StatefulWidget {
  final int? id;
  const DetailItemBody({Key? key, this.id}) : super(key: key);

  @override
  State<DetailItemBody> createState() => DetailItemBodyState();
}

class DetailItemBodyState extends State<DetailItemBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: height * 0.8,
                  width: width,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: itemAppBar(width, height),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text('data'),
                          Text('data'),
                        ],
                      ),
                      const Text('data'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemAppBar(double width, double height) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height * 0.06,
              child: const Center(
                child: Text(
                  'title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              top: height * 0.06 * 0.15,
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_back_ios_new),
              ),
            )
          ],
        ),
      ),
    );
  }
}
