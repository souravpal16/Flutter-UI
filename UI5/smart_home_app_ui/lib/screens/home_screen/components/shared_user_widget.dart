import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import './circular_avatar_widget.dart';
import './selected_room_widget.dart';
import '../../../models/devices.dart';

class SharedUsersRowWidget extends StatelessWidget {
  const SharedUsersRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shared Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: lightBlack,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Row(
            children: [
              CircularAvatarWidget(
                img: 'assets/images/user_1.jpg',
                margin: 5,
                size: 25,
              ),
              CircularAvatarWidget(
                img: 'assets/images/user_2.jpg',
                margin: 5,
                size: 25,
              ),
              CircularAvatarWidget(
                img: 'assets/images/user_3.jpg',
                margin: 5,
                size: 25,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 25,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
