import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import './circular_avatar_widget.dart';
import './selected_room_widget.dart';
import '../../../models/devices.dart';
import './shared_user_widget.dart';
import './home_user_message.dart';
import './device_grid_widget.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  //int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
      ),
      child: Column(
        children: [
          HomeUserMessage(),
          const SizedBox(
            height: 50,
          ),
          SharedUsersRowWidget(),
          Expanded(
            child: SelectedRoomWidget(),
          ),
          Expanded(
            flex: 3,
            child: DeviceGridWidget(),
          ),
        ],
      ),
    );
  }
}
