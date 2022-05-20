import 'package:flutter/material.dart';

class ItemInfoPerso extends StatelessWidget {
  const ItemInfoPerso({
    Key? key,
    required this.age,
    required this.address,
    required this.indexMovie,
    required this.imageInfo,
  }) : super(key: key);
  final String age, address, indexMovie, imageInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.24,
          height: MediaQuery.of(context).size.height * 0.24,
          // margin: EdgeInsets.only(bottom: 30.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageInfo),
            // radius: 23,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            age,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            address,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            indexMovie,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
