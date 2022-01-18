import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 4,
        horizontal: kDefaultPadding,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextField(
        onChanged: (value) {},
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: SvgPicture.asset('assets/icons/search.svg'),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
