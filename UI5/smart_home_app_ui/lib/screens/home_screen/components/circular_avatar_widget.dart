import 'package:flutter/material.dart';

class CircularAvatarWidget extends StatelessWidget {
  const CircularAvatarWidget({
    Key? key,
    required this.margin,
    required this.img,
    required this.size,
  }) : super(key: key);

  final String img;
  final double size;
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: CircleAvatar(
        radius: size,
        backgroundImage: AssetImage(img),
      ),
    );
  }
}
