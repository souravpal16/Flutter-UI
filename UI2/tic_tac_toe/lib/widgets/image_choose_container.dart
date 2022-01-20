import 'package:flutter/material.dart';

class ImageCustomContainer extends StatelessWidget {
  final bgcolor;
  final imageurl;

  ImageCustomContainer({this.bgcolor, this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 270,
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: 0.8,
          image: AssetImage(imageurl),
        ),
        color: bgcolor,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
