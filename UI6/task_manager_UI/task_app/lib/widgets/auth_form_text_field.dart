import 'dart:math';

import 'package:flutter/material.dart';

class AuthFormTextField extends StatelessWidget {
  const AuthFormTextField({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: min(700, size.width),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(70),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 15,
      ),
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
