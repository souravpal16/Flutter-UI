import 'package:flutter/material.dart';
import '../../../constants.dart';
import './custom_text_widget.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomTextWidget(
            text: 'Welcome',
            size: 35,
          ),
          CustomTextWidget(
            text: 'Lets make your home comfortable',
            size: 14,
          ),
        ],
      ),
    );
  }
}
