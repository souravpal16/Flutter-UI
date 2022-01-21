import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import './circular_avatar_widget.dart';
import './selected_room_widget.dart';
import '../../../models/devices.dart';
import './shared_user_widget.dart';

class HomeUserMessage extends StatelessWidget {
  const HomeUserMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good morning, Mr. Pal!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          'Today Jan 20, 2022',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '27',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\u00b0C',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              'Cloudy',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
