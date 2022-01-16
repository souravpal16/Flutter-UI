import 'package:flutter/material.dart';
import './image_with_icons.dart';
import './bottom_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        ImageWithIcons(size: size),
        const Spacer(),
        BottomBar(size: size)
      ],
    );
  }
}
