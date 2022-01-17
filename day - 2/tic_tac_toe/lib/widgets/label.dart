import 'package:flutter/material.dart';
import '../data/constants.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: color3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text('START', style: style1),
      ),
    );
  }
}
