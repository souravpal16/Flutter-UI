import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/landing_page.dart';
import 'package:task_app/screens/user_screen.dart';
import 'screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/test_screen.dart';
import './screens/test_screen2.dart';
import './providers/task_provider.dart';
import './screens/add_task_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => LandingPage(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          UserScreen.routeName: (context) => UserScreen(),
          AddTaskScreen.routeName: (context) => AddTaskScreen(),
        },
      ),
    );
  }
}
