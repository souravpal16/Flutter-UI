import 'package:flutter/material.dart';
import '../data/constants.dart';

List<Widget> gameLines(double width, Color color) {
  return <Widget>[
    Positioned(
      top: 10,
      left: 10 + (width - 20) / 3,
      child: SizedBox(
        height: width - 20,
        width: 5,
        child: Container(
          decoration: BoxDecoration(color: color),
        ),
      ),
    ),
    Positioned(
      top: 10,
      left: 10 + 2 * (width - 20) / 3,
      child: SizedBox(
        height: width - 20,
        width: 5,
        child: Container(
          decoration: BoxDecoration(color: color),
        ),
      ),
    ),
    Positioned(
      left: 10,
      top: 10 + 2 * (width - 20) / 3,
      child: SizedBox(
        height: 5,
        width: width - 20,
        child: Container(
          decoration: BoxDecoration(color: color),
        ),
      ),
    ),
    Positioned(
      left: 10,
      top: 10 + (width - 20) / 3,
      child: SizedBox(
        height: 5,
        width: width - 20,
        child: Container(
          decoration: BoxDecoration(color: color),
        ),
      ),
    )
  ];
}
