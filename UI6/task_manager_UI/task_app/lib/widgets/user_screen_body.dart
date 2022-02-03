import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';
import '../utils/logout_procedure.dart';
import '../screens/login_screen.dart';
import './task_list_widget.dart';
import './user_screen_name_text_widget.dart';
import '../services/network.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

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
          const SizedBox(
            height: 30,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              userNameTextWidget(),
              Spacer(),
              ToggleThemeWidget(),
              LogoutIcon(),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          TaskListWidget(),
        ],
      ),
    );
  }
}

class ToggleThemeWidget extends StatefulWidget {
  const ToggleThemeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ToggleThemeWidget> createState() => _ToggleThemeWidgetState();
}

class _ToggleThemeWidgetState extends State<ToggleThemeWidget> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveThumbColor: kBannerColorDark,
      inactiveTrackColor: kPrimaryColor1Light,
      activeColor: Colors.black,
      activeTrackColor: kBannerColorLight,
      value: _value,
      onChanged: (value) {
        Provider.of<ThemeProvider>(context, listen: false).toggle();
        _value = value;
        setState(() {});
      },
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
        color: Theme.of(context).textTheme.bodyText2?.color,
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
