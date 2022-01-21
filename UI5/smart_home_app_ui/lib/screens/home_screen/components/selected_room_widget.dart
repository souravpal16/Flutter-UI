import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import './circular_avatar_widget.dart';

class SelectedRoomWidget extends StatefulWidget {
  SelectedRoomWidget({
    Key? key,
  }) : super(key: key);

  List<String> rooms = [
    'Living Room',
    'Bedroom',
    'Bathroom',
    'Kitchen',
    'Attic'
  ];

  int selectedIndex = 0;

  @override
  State<SelectedRoomWidget> createState() => _SelectedRoomWidgetState();
}

class _SelectedRoomWidgetState extends State<SelectedRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        //shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 25,
            bottom: 25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Text(
                  widget.rooms[index],
                  style: TextStyle(
                    color: widget.selectedIndex == index
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),
                onTap: () {
                  setState(
                    () {
                      widget.selectedIndex = index;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 3,
                backgroundColor:
                    widget.selectedIndex == index ? lightBlue : mediumBlack,
              )
            ],
          ),
        ),
        itemCount: widget.rooms.length,
      ),
    );
  }
}
