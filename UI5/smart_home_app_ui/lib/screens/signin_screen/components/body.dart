import 'package:flutter/material.dart';
import '../../../constants.dart';
import './authentication_form_widget.dart';
import './custom_text_widget.dart';
import './next_button_widget.dart';
import './welcome_message_widget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/home3.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.hardLight),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          WelcomeMessageWidget(),
          Spacer(),
          AuthenticationFormWidget(),
          SizedBox(
            height: 10,
          ),
          NextButton()
        ],
      ),
    );
  }
}
