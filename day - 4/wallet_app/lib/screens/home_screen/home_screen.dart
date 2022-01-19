import 'package:flutter/material.dart';
import './components/body.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppBar(
        title: Text(
          'E-wallet',
          style: TextStyle(color: lightSkin),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: darkBlack,
      ),
      body: Body(),
    );
  }
}
