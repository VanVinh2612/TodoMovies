import 'package:flutter/material.dart';

class ItemPersonDetail extends StatelessWidget {
  const ItemPersonDetail(
      {Key? key, required this.images, required this.name, this.characters})
      : super(key: key);
  final String images;
  final String name;
  final String? characters;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      // width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xa12a2a2a),
        border: Border(
          top: BorderSide(
            width: 0.3,
            color: Colors.grey,
          ),
          bottom: BorderSide(
            width: 0.3,
            color: Colors.grey,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(images),
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    characters ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
