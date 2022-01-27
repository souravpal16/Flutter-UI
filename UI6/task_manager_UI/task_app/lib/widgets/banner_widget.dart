import 'package:flutter/material.dart';

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
        color: kBannerColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'DAILY',
            style: kBannerTextStyle,
          ),
          Text(
            'TASK PLANNER',
            style: kBannerTextStyle,
          ),
        ],
      ),
    );
  }
}
