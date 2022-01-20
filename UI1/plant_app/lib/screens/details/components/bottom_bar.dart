import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
            ),
          ),
          width: size.width / 2,
          height: 80,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Buy Now',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text('Description',
                style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
