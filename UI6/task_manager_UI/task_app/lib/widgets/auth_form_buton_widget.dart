import 'package:flutter/material.dart';
import '../constants.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xff74c69d),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
