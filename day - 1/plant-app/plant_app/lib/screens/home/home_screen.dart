import 'package:flutter/material.dart';
import './components/body.dart';
import './components/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Body(),
    );
  }
}
