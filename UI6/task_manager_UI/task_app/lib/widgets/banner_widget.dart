import 'package:flutter/material.dart';
import './banner_text.dart';
import '../constants.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.only(top: ),
      height: size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
      child: BannerText(),
    );
  }
}
