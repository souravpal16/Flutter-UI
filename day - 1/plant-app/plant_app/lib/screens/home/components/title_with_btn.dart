import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final Function()? press; //explore this functions

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding / 2),
      child: Row(
        children: [
          TitleWithCustomUnderLine(text: title),
          const Spacer(),
          FlatButton(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: press,
            child: const Text(
              'More',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
