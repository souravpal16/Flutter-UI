import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../utils/name_shared_preference.dart';

class userNameTextWidget extends StatelessWidget {
  const userNameTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadName(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String name = snapshot.data ?? 'Error';
          String formattedName = name[0].toUpperCase() + name.substring(1);
          print(formattedName);
          return AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Hi ${formattedName}! 👋',
                textStyle: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              )
            ],
            totalRepeatCount: 1,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
