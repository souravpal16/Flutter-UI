import 'package:flutter/material.dart';
import 'header_with_search.dart';
import 'title_with_btn.dart';
import 'rcommended_plants.dart';
import 'featured_plants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWtihSearchBox(size: size),
          TitleWithButton(title: 'Recommended', press: () {}),
          RecommendedPlants(),
          TitleWithButton(title: 'Featured Plants', press: () {}),
          FeaturedPlants()
        ],
      ),
    );
  }
}
