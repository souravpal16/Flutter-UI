import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/user_screen.dart';
import 'screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/test_screen.dart';
import './screens/test_screen2.dart';
import './providers/task_provider.dart';
import './screens/add_task_screen.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          UserScreen.routeName: (context) => UserScreen(),
          AddTaskScreen.routeName: (context) => AddTaskScreen(),
        },
      ),
    );
  }
}
