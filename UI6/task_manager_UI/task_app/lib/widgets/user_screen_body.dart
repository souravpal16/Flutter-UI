import 'package:flutter/material.dart';
import '../utils/logout_procedure.dart';
import '../screens/login_screen.dart';
import './task_list_widget.dart';
import './user_screen_name_text_widget.dart';
import '../services/network.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              userNameTextWidget(),
              LogoutIcon(),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          TaskListWidget(),
        ],
      ),
    );
  }
}

class LogoutIcon extends StatelessWidget {
  const LogoutIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.logout,
        size: 30,
      ),
      onPressed: () async {
        //plan is to show a dialog box
        //for now just await would do.
        await logoutUserFromServer();
        //first logout from server as jwt token is needed
        //Then remove the token.ss
        await logoutProcedure();
        Navigator.popAndPushNamed(
          context,
          LoginScreen.routeName,
        );
      },
    );
  }
}
