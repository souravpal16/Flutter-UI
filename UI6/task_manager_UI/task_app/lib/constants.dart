import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Icon KIcon = Icon(
  Icons.menu,
  color: Colors.black,
);

Color kBackgroundColor = Color(0xffFFFAFB);
Color kPrimaryColor1 = Color(0xffECE2D0);
Color kPrimaryColor2 = Color(0xffA26769);
Color kTextColor = Color(0xff020417);
Color kBannerColor = Color(0xff6D2E46);

Color kBackgroundColorLight = Color(0xffFFFAFB);
Color kPrimaryColor1Light = Color(0xffECE2D0);
Color kPrimaryColor2Light = Color(0xffA26769);
Color kTextColorLight = Color(0xff020417);
Color kBannerColorLight = Color(0xff6D2E46);

Color kBackgroundColorDark = Color(0xff14213D);
Color kPrimaryColor1Dark = Color(0xffECE2D0);
Color kPrimaryColor2Dark = Color(0xffFF8500);
Color kTextColorDark = Color(0xffF7F7FF);
Color kBannerColorDark = Color(0xffFCA311);

TextStyle kBannerTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).scaffoldBackgroundColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
}

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColorLight,
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.copyWith(
            bodyText2: TextStyle(
              color: kTextColorLight,
            ),
            bodyText1: TextStyle(
              color: kTextColorLight,
            ),
            // headline6: TextStyle(
            //   color: Colors.grey.shade300,
            // ),
          ),
    ),
    primaryColorLight: kPrimaryColor2Light,
    primaryColorDark: Colors.grey.shade300,
    primaryColor: kBannerColorLight,
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColorDark,
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.copyWith(
            bodyText2: TextStyle(
              color: kTextColorDark,
            ),
            bodyText1: TextStyle(
              color: kTextColorLight,
            ),
            // headline6: TextStyle(
            //   color: Colors.grey.shade400,
            // ),
          ),
    ),
    primaryColorLight: kPrimaryColor2Dark,
    primaryColorDark: Colors.grey.shade500,
    primaryColor: kBannerColorDark,
  );
}
