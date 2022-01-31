import 'package:flutter/material.dart';
import '../constants.dart';

class BannerText extends StatelessWidget {
  const BannerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'DAILY',
          style: kBannerTextStyle(context),
        ),
        Text(
          'TASK PLANNER',
          style: kBannerTextStyle(context),
        ),
      ],
    );
  }
}
