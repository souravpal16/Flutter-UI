import 'package:flutter/material.dart';
import '../data/constants.dart';
import '../widgets/shape_image.dart';
import '../widgets/label.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShapeImageWidget(
                    imageurl: 'images/cross.png',
                    height: 150.0,
                    width: 150.0,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ShapeImageWidget(
                    imageurl: 'images/circle.png',
                    height: 150.0,
                    width: 150.0,
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chooseSide');
                },
                child: LabelWidget())
          ],
        ),
      ),
    );
  }
}
