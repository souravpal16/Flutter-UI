import 'package:flutter/material.dart';

class ShapeImageWidget extends StatelessWidget {
  final imageurl;
  final width;
  final height;
  ShapeImageWidget({this.imageurl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageurl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
