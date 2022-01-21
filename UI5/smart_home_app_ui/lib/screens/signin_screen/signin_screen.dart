import 'package:flutter/material.dart';
import './components/body.dart';
import '../../constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
