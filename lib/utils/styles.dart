import 'package:amazcart/AppConfig/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class AppStyles {
  static final TextStyle appFont = GoogleFonts.roboto(
    fontSize: 12,
  );

  static final TextStyle kFontBlack15w4 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle kFontBlack15w6 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle kFontGrey12w5 = GoogleFonts.roboto(
    color: AppStyles.greyColorLight,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle kFontGrey14w5 = GoogleFonts.roboto(
    color: AppStyles.greyColorDark,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle kFontWhite14w5 = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle kFontWhite12w5 = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle kFontBlack17w5 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 17,
    fontWeight: FontWeight.w800,
  );
  static final TextStyle kFontBlack14w5 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle kFontBlack13w5 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle kFontBlack12w4 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle kFontBlack13w4 = GoogleFonts.roboto(
    color: AppStyles.blackColor,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle kFontPink15w5 = GoogleFonts.roboto(
    color: AppStyles.pinkColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle kFontDarkBlue12w5 = GoogleFonts.roboto(
    color: AppStyles.darkBlueColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle kFontDarkBlue14w5 = GoogleFonts.roboto(
    color: AppStyles.darkBlueColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle kFontLightBlue12w5 = GoogleFonts.roboto(
    color: AppStyles.lightBlueColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static Color appBackgroundColor = const Color(0xffF6FAFC);

  static Color textFieldFillColor = const Color(0xffE1EBF1);

  static Color pinkColor = const Color(0xff0e0c75);

  static Color mediumPinkColor = const Color(0xffeed0d7);

  static Color lightPinkColor = const Color(0xffFFF4F7);

  static Color darkBlueColor = const Color(0xff4922B7);

  static Color lightBlueColor = const Color(0xff5580D3);

  static Color lightBlueColorAlt = const Color(0xffE8EFF3);

  static Color lightGreyColor = const Color(0xffACB3BF);

  static Color blackColor = const Color(0xff242424);

  static Color greyColorDark = const Color(0xff656565);

  static Color greyColorLight = const Color(0xff8D8D8D);

  static Color greyBorder = const Color(0xffdadada);

  static Color lightYellowColor = const Color(0xffFFEFD1);

  static Color goldenYellowColor = const Color(0xffFFA800);

  static Color appThemeColor = const Color(0xff0e0c75);

  static Color appThemeColorDark = Colors.red;
}
