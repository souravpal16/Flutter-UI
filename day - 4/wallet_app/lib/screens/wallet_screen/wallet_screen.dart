import 'package:flutter/material.dart';
import './components/body.dart';
import '../../constants.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        backgroundColor: darkBlack,
        body: Body(),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavBarItem(selected: true, icon: Icons.access_alarm),
          BottomNavBarItem(selected: false, icon: Icons.access_alarm),
          BottomNavBarItem(selected: false, icon: Icons.access_alarm),
          BottomNavBarItem(selected: false, icon: Icons.access_alarm),
        ],
      ),
      color: darkBlack,
      height: 40,
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({Key? key, required this.selected, required this.icon})
      : super(key: key);

  final bool selected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: selected ? lightGray : Colors.white,
      size: 25,
    );
  }
}
