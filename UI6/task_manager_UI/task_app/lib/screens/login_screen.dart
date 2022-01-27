import 'dart:convert';

import 'package:flutter/material.dart';
import './signup_screen.dart';
import './user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../widgets/auth_form_text_field.dart';
import '../services/network.dart';
import '../widgets/auth_form_buton_widget.dart';
import '../widgets/banner_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    AuthFormTextField(
                      hint: 'Email',
                      controller: emailController,
                    ),
                    AuthFormTextField(
                      hint: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonRow(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            signUpButtonFunction(context);
          },
          child: AuthButtonWidget(
            title: 'Sign Up',
            color: kPrimaryColor1,
          ),
        ),
        GestureDetector(
          onTap: () {
            loginButtonFunction(
              context,
              emailController.text,
              passwordController.text,
            );
          },
          child: AuthButtonWidget(title: 'Login', color: kPrimaryColor2),
        ),
      ],
    );
  }
}

//helper function

void signUpButtonFunction(BuildContext context) {
  Navigator.pushNamed(context, SignupScreen.routeName);
}

void loginButtonFunction(BuildContext context, email, password) async {
  showDialogWidget(context, email, password);
}

Future<String> loggingUserAndLoadingTasks(
    BuildContext context, String email, String password) async {
  String result = await loginUser(email, password);

  String ans =
      await Provider.of<TaskData>(context, listen: false).populateTasks();

  return result;
}

Future<void> showDialogWidget(
    BuildContext context, String email, String password) async {
  showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Logging in...'),
      content: FutureBuilder<String>(
        future: loggingUserAndLoadingTasks(context, email, password),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${snapshot.data}'),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, UserScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${snapshot.error}'),
                TextButton(
                  child: Text(
                    'OK',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
            ],
          );
        },
      ),
    ),
  );
}
