import 'package:flutter/material.dart';
import '../screens/add_task_screen.dart';

class FloatingActionbuttonWidget extends StatelessWidget {
  const FloatingActionbuttonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.add,
        color: Theme.of(context).textTheme.bodyText1?.color,
      ),
      onPressed: () {
        Navigator.pushNamed(context, AddTaskScreen.routeName);
      },
    );
  }
}
