import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/screens/user_screen.dart';
import 'package:task_app/widgets/banner_widget.dart';
import '../widgets/ok_button_chip_widget.dart';
import '../services/network.dart';
import '../widgets/auth_form_text_field.dart';
import '../widgets/auth_form_buton_widget.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signup_screen";

  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      hint: 'Name',
                      controller: nameController,
                    ),
                    AuthFormTextField(
                      hint: 'Email',
                      controller: emailController,
                    ),
                    AuthFormTextField(
                      hint: 'Password',
                      controller: passwordController,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialogWidget(
                          context,
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: AuthButtonWidget(
                        title: 'Sign Up',
                        color: kPrimaryColor1Light,
                      ),
                    )
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

// void signUpButtonFunction(BuildContext context, String name, String email, String password) {
//   showDialogWidget(context);
// }

void showDialogWidget(
    BuildContext context, String name, String email, String password) {
  showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Signing Up...'),
      content: FutureBuilder<String>(
        future: signupUser(name, email, password),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${snapshot.data}'),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, UserScreen.routeName);
                  },
                  child: OkButtonChipWidget(),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisSize: MainAxisSize.min,
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
