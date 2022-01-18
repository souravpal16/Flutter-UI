import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_store_app/constants.dart';
import '../../../components/search_bar.dart';
import '../components/category_list.dart';
import '../../../models/product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SearchBar(
          onChanged: (value) {},
        ),
        CategoryList(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) => ItemCard(
                  price: products[index].price,
                  image: products[index].image,
                  title: products[index].title,
                  index: index,
                ),
                itemCount: products.length,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.price,
    required this.image,
    required this.title,
    required this.index,
  }) : super(key: key);

  final int price, index;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //padding: const EdgeInsets.all(kDefaultPadding),
      width: size.width,
      height: 180,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: index % 2 == 0 ? kGreenColor : kSecondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding + 10,
                top: kDefaultPadding,
                bottom: kDefaultPadding),
            decoration: BoxDecoration(
              boxShadow: [kDefaultShadow],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5,
                vertical: kDefaultPadding / 4,
              ),
              decoration: BoxDecoration(
                color:
                    kTextLightColor, // index % 2 == 0 ? kSecondaryColor : kBlueColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(
                '\$${price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              //width: 100,
              height: 150,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: kDefaultPadding + 20,
            top: kDefaultPadding + 35,
            child: Container(
              width: 180,
              child: Text(
                title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
