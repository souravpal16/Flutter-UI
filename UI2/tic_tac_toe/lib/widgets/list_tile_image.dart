import 'package:flutter/material.dart';

class ListTileImage extends StatelessWidget {
  final playerName;
  final imageurl;
  ListTileImage({this.playerName, this.imageurl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: ListTile(
        dense: true,
        leading: Text(
          playerName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        trailing: Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageurl),
            ),
          ),
        ),
      ),
    );
  }
}
