import 'package:flutter/material.dart';
import './task_list_widget.dart';
import './user_screen_name_text_widget.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          userNameTextWidget(),
          SizedBox(height: 20),
          TaskListWidget(),
        ],
      ),
    );
  }
}
