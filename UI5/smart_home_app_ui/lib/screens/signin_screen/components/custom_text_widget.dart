import 'package:flutter/material.dart';
import '../../../constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
