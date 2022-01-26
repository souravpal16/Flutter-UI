import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import './add_task_screen.dart';
import '../widgets/user_screen_name_text_widget.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/user_screen_body.dart';

class UserScreen extends StatefulWidget {
  static const String routeName = "/user_screen";

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor1,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: KIcon,
      //     onPressed: () {},
      //   ),
      //   backgroundColor: KbackgroundColor,
      //   elevation: 0,
      // ),
      floatingActionButton: FloatingActionbuttonWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Body(),
      ),
    );
  }
}