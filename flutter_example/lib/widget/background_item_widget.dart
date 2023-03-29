import 'package:flutter/material.dart';

class BackgroundItemWidget extends StatelessWidget {
  final double top, left, width, height;
  final Color color;
  const BackgroundItemWidget({Key? key, required this.top,
    required this.left, required this.color, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Row(
        children: [
          Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(360),
            ),
          ),
        ],
      ),
    );
  }
}
