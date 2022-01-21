import 'package:flutter/material.dart';
import '../../../constants.dart';
import './custom_text_widget.dart';
import './input_field_widget.dart';

class AuthenticationFormWidget extends StatelessWidget {
  const AuthenticationFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
          ),
          child: CustomTextWidget(
            size: 20,
            text: 'Sign In',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InputFieldWidget(hintText: 'Username'),
        const SizedBox(
          height: 15,
        ),
        InputFieldWidget(hintText: 'Password'),
      ],
    );
  }
}
