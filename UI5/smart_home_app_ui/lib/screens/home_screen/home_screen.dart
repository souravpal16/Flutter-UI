import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import './components/body.dart';
import './components/circular_avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      backgroundColor: mediumBlack,
      appBar: AppBarWidget(),
      body: Body(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(90, 40),
            topRight: Radius.elliptical(90, 40),
          ),
        ),
        child: BottomNavBarRow(),
      ),
    );
  }
}

class BottomNavBarRow extends StatefulWidget {
  BottomNavBarRow({
    Key? key,
  }) : super(key: key);

  int index = 0;
  final List<Widget> icons = [];
  @override
  State<BottomNavBarRow> createState() => _BottomNavBarRowState();
}

class _BottomNavBarRowState extends State<BottomNavBarRow> {
  void onPress(int index) {
    widget.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomNavBarIcon(
          index: 0,
          onPress: onPress,
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          isSelected: 0 == widget.index,
        ),
        BottomNavBarIcon(
          index: 1,
          onPress: onPress,
          icon: Icon(
            Icons.flash_on,
            color: Colors.grey,
          ),
          isSelected: 1 == widget.index,
        ),
        BottomNavBarIcon(
          index: 2,
          onPress: onPress,
          icon: Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          isSelected: 2 == widget.index,
        ),
        BottomNavBarIcon(
          index: 3,
          onPress: onPress,
          icon: Icon(
            Icons.settings,
            color: Colors.grey,
          ),
          isSelected: 3 == widget.index,
        )
      ],
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    Key? key,
    required this.index,
    required this.onPress,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  final index;
  final onPress;
  final isSelected;
  final icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress(index);
      },
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      offset: Offset(0, -20),
                      color: lightBlue,
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                  ]
                : []),
        child: icon,
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      elevation: 0,
      backgroundColor: mediumBlack,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/menu2.svg',
          height: 25,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        Container(
          //alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CircularAvatarWidget(
                img: 'assets/images/profile_pic.jpg',
                margin: 0,
                size: 30,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: mediumBlue,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
