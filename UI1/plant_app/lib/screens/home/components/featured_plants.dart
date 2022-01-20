import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          featured_plants_card(image: 'assets/images/bottom_img_1.png'),
          featured_plants_card(image: 'assets/images/bottom_img_2.png'),
          featured_plants_card(image: 'assets/images/bottom_img_1.png')
        ],
      ),
    );
  }
}

class featured_plants_card extends StatelessWidget {
  const featured_plants_card({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: 185,
      margin:
          const EdgeInsets.only(left: kDefaultPadding, bottom: kDefaultPadding),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
