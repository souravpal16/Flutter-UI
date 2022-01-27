import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/add_task_screen.dart';

class FloatingActionbuttonWidget extends StatelessWidget {
  const FloatingActionbuttonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kBannerColor,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, AddTaskScreen.routeName);
      },
    );
  }
}
