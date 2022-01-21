import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import './circular_avatar_widget.dart';
import './selected_room_widget.dart';
import '../../../models/devices.dart';
import './shared_user_widget.dart';
import './home_user_message.dart';

class DeviceGridWidget extends StatelessWidget {
  const DeviceGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: devices.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: lightBlack,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  //iconSize: 0,
                  padding: EdgeInsets.all(0),
                  icon: SvgPicture.asset(
                    devices[index].icon,
                    height: 30,
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                Text(
                  devices[index].title,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  devices[index].on ? 'On' : 'Off',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Switch(
                  activeColor: mediumBlue,
                  activeTrackColor: mediumBlack,
                  value: devices[index].on,
                  onChanged: (value) {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
