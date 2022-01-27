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
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(70),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 15,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Color(0xff283618),
        ),
        decoration: InputDecoration(
          labelText: hint,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          labelStyle: TextStyle(
            color: Color(0xff1b4332),
          ),
          //hintText: hint,
        ),
      ),
    );
  }
}
