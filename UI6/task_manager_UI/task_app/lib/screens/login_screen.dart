import 'package:flutter/material.dart';
import './signup_screen.dart';
import './user_screen.dart';
import '../constants.dart';
import '../widgets/auth_form_text_field.dart';
import '../services/network.dart';
import '../widgets/auth_form_buton_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/ok_button_chip_widget.dart';

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
            color: kPrimaryColor1Light,
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
          child: AuthButtonWidget(
            title: 'Login',
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ],
    );
  }
}

//helper function

void signUpButtonFunction(BuildContext context) {
  // Navigator.pushNamed(context, SignupScreen.routeName);
  //Navigator.push(context, _createRoute());
  Navigator.push(
    context,
    FadeInRoute(page: SignupScreen(), routeName: SignupScreen.routeName),
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;

      final tween = Tween(begin: begin, end: end);

      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.ease,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class FadeInRoute extends PageRouteBuilder {
  final Widget page;

  FadeInRoute({required this.page, required String routeName})
      : super(
          settings: RouteSettings(name: routeName), // set name here
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end);

            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500),
        );
}

void loginButtonFunction(BuildContext context, email, password) async {
  showDialogWidget(context, email, password);
}

Future<String> loggingUserAndLoadingTasks(
    BuildContext context, String email, String password) async {
  String result = await loginUser(email, password);

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
