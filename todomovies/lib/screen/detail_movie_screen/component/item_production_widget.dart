import 'package:flutter/material.dart';

class ItemProduction extends StatelessWidget {
  final String textProduct;
  final String textInformation;
  final IconData? icon;
  const ItemProduction({
    Key? key,
    required this.textProduct,
    required this.textInformation,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textProduct,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(textInformation,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
