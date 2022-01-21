import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../home_screen/home_screen.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 5),
          margin: const EdgeInsets.only(
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: mediumBlue,
          ),
          child: Row(
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
