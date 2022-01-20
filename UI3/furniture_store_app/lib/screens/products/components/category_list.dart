import 'package:flutter/material.dart';
import '../../../constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List<String> categories = <String>['All', 'Sofa', 'Park bench', 'Armchair'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == selectedIndex
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2,
            ),
            child: Text(
              categories[index],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
