
import 'package:flutter/material.dart';

class ItemAppBarPerson extends StatelessWidget {
  const ItemAppBarPerson({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: width,
          height: height * 0.06,
          // padding: const EdgeInsets.only(left: 60.0),
          color: const Color(0xff2a2a2a),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 15.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.red,
                ),
                Text(
                  'Back',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
