import 'package:flutter/material.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/user_screen.dart';
import '../utils/token_shared_preference.dart';
import '../constants.dart';
import '../widgets/banner_text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _flag = false;

  Future<void> runTokenCheck() async {
    bool ans = await checkToken();
    _flag = ans;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //runTokenCheck();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<bool>(
      future: checkToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == false) {
            print('NO token');
            return LoginScreen();
          } else {
            print('Yes token');
            return UserScreen();
          }
        } else if (snapshot.hasError) {}
        print('Normal branding page');
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: BannerText(),
        );
      },
    );
  }
}
