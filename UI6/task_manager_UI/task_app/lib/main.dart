import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/landing_page.dart';
import 'package:task_app/screens/user_screen.dart';
import 'screens/login_screen.dart';
import './screens/signup_screen.dart';
import './providers/task_provider.dart';
import './screens/add_task_screen.dart';
import 'constants.dart';
import './providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider, child) =>
            child ?? Text('hello world'),
        child: MainAppBegins(),
      ),
    );
  }
}

class MainAppBegins extends StatelessWidget {
  const MainAppBegins({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).light
          ? lightTheme(context)
          : darkTheme(context),
      routes: {
        '/': (context) => LandingPage(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        UserScreen.routeName: (context) => UserScreen(),
        AddTaskScreen.routeName: (context) => AddTaskScreen(),
      },
    );
  }
}
