import 'package:flutter/material.dart';
import '../data/constants.dart';
import '../widgets/image_choose_container.dart';
import '../widgets/custom_label.dart';

class SideChooseWidget extends StatefulWidget {
  @override
  State<SideChooseWidget> createState() => _SideChooseWidgetState();
}

class _SideChooseWidgetState extends State<SideChooseWidget> {
  var box1color = color3;
  var box2color = color1;
  var box1url = 'images/darkcross.png';
  var box2url = 'images/circle.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Choose your side',
                style: style2,
              ),
              const Text(
                '(Player One)',
                style: style2,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  box1color = color3;
                  box2color = color1;
                  box1url = 'images/darkcross.png';
                  box2url = 'images/circle.png';
                  setState(() {});
                },
                child: ImageCustomContainer(
                  bgcolor: box1color,
                  imageurl: box1url,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  box1color = color1;
                  box2color = color3;
                  box1url = 'images/cross.png';
                  box2url = 'images/darkcircle.png';
                  setState(() {});
                },
                child: ImageCustomContainer(
                  bgcolor: box2color,
                  imageurl: box2url,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      String playerOne = "";
                      if (box1color == color3) {
                        playerOne = 'cross';
                      } else {
                        playerOne = 'circle';
                      }
                      Navigator.pushNamed(context, '/gameScreen',
                          arguments: {'playerOne': playerOne});
                    },
                    child: CustomLabelWidget(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
