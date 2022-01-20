import 'package:flutter/material.dart';
import '../data/constants.dart';

class CustomLabelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 90,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color3,
      ),
      child: const Center(
        child: Text(
          'NEXT',
          style: style1,
        ),
      ),
    );
  }
}
