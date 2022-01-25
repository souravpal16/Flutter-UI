import 'dart:convert';

import 'package:flutter/material.dart';
import './signup_screen.dart';
import './user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

import '../services/network.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            TextButton(
              onPressed: () async {
                // print('running 1\n');
                showDialogWidget(context);
                //print('running 4\n');

                // print('running 5\n');
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pushNamed(context, SignupScreen.routeName);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

//helper function

Future<String> loggingUserAndLoadingTasks(BuildContext context) async {
  String result = await loginUser();

  String ans =
      await Provider.of<TaskData>(context, listen: false).populateTasks();

  return result;
}

Future<void> showDialogWidget(BuildContext context) async {
  //print('running 2\n');
  showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Checking connection...'),
      content: FutureBuilder<String>(
        future: loggingUserAndLoadingTasks(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print('running @\n');
            return Column(
              children: [
                Text('${snapshot.data}'),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, UserScreen.routeName);
                    Navigator.popAndPushNamed(context, UserScreen.routeName);
                  },
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('${snapshot.error}'),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
          //print('running #\n');
          return Column(
            children: [
              CircularProgressIndicator(),
            ],
          );
        },
      ),
    ),
  );
  // print('running 3\n');
}
