import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            color: kPrimaryColor.withOpacity(0.38),
            blurRadius: 35,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/icons/flower.svg'),
          SvgPicture.asset('assets/icons/user-icon.svg'),
          SvgPicture.asset('assets/icons/heart-icon.svg'),
        ],
      ),
    );
  }
}

class buildAppBar extends StatelessWidget with PreferredSizeWidget {
  const buildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
