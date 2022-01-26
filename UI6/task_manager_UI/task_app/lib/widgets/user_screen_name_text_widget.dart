import 'package:flutter/material.dart';

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
          return Text(
            'Hi ${formattedName}! 👋',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
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
