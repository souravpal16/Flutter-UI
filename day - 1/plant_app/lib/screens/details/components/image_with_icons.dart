import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class ImageWithIcons extends StatelessWidget {
  const ImageWithIcons({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            height: size.height * 0.8,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    //padding: const EdgeInsets.all(kDefaultPadding),
                    icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Spacer(),
                IconCard(icon: 'assets/icons/sun.svg'),
                IconCard(icon: 'assets/icons/icon_2.svg'),
                IconCard(icon: 'assets/icons/icon_3.svg'),
                IconCard(icon: 'assets/icons/icon_4.svg'),
              ],
            ),
          ),
        ),
        Container(
          width: size.width * 0.75,
          height: size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60),
              bottomLeft: Radius.circular(60),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.2),
              ),
            ],
            image: const DecorationImage(
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/img.png'),
            ),
          ),
        )
      ],
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final String icon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 60,
      width: 60,
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
