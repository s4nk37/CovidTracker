import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color background = 1 != 11 ? Color(0xFFF2F6F8) : Color(0xFF121212);
const Color primary = 1 != 11 ? Color(0xFFFA5252) : Colors.black;
const Color green = 1 == 1 ? Color(0xFF34C360) : Colors.black;
const Color grey = 1 == 11 ? Color(0xFFAFB8BE) : Colors.black;
const Color pink = Color(0xFFF576C9);
const Color blue = Color(0xFF2748A9);
const Color white = Colors.white;
const Color darkGrey = Colors.black54;
const Color lightWhite = 1 == 1 ? Colors.white70 : Colors.blueGrey;

//AppStyling
class AppTheme {
  static const Color lightBg = Color(0xFFF2F6F8);
  static const Color lightPrimary = Color(0xFFFA5252);
  static const Color lightBody1 = Colors.black;
  static const Color lightBody2 = Colors.black;
  static const Color lightBody2ds = Color(0xff696969);
  static const Color lightGreen = Color(0xFF34C360);
  static const Color lightGrey = Color(0xFFAFB8BE);
  static const Color lightPink = Color(0xFFF576C9);
  static const Color lightBlue = Color(0xFF2748A9);
  static const Color headline4 = Colors.white;
  static const Color lightDarkGrey = Colors.black54;
  static const Color lightWhite70 = Colors.white70;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBg,
    primaryColor: lightPrimary,
    fontFamily: 'Product Sans',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ), //White Text
      // bodyText1: TextStyle(
      //   color: lightBody1,
      //   fontSize: SizeConfig.safeBlockHorizontal * 4,
      // ), //Label
      // bodyText2: TextStyle(
      //   color: lightBody2,
      //   fontSize: SizeConfig.safeBlockHorizontal * 8,
      // ), //numbers
    ),
//      cardTheme: CardTheme(
//        color: Colors.white,
//        shape: RoundedRectangleBorder(
//          borderRadius:
//          BorderRadius.circular(15.0),
//        ),
//      )
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: lightBg,
    primaryColor: lightPrimary,
    fontFamily: 'Product Sans',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ), //White Text
      // bodyText1: TextStyle(
      //   color: lightBody1,
      //   fontSize: SizeConfig.safeBlockHorizontal * 4.5,
      // ), //Label
      // bodyText2: TextStyle(
      //   color: lightBody2,
      //   fontSize: SizeConfig.safeBlockHorizontal * 8,
      // ), //numbers
    ),
//      cardTheme: CardTheme(
//        color: Colors.white,
//        shape: RoundedRectangleBorder(
//          borderRadius:
//          BorderRadius.circular(15.0),
//        ),
//      )
  );
}

//Responsive Template
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

//Percentage Calculator
String calc(int a, int b) {
  if (b != 0) {
    String c = ((a / b) * 100).round().toInt().toString();
    return ('$c%');
  } else {
    return ('0%');
  }
}

//Current Date and time for home and country
String formattedDate = DateFormat.yMMMMd().add_jm().format(DateTime.now());
