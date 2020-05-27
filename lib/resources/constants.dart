import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// this is url list that we need to get from the internet / API
class Url {
  static const apiKey = '';
  static const url = '';
  static const imgUrl = '';
}

/// this is color palette, use this to develop a constant color between the app
///
/// there is 8 digits after 0x
/// the first 2 digits are opacity or it's A from RGBA,
///
/// so this format is ARGB instead, the next 6 digits is
/// hex number of rgb
class CPalette {
  /// usually used for: appbar, ??
  static const primaryColor = Color(0xff47C363);

  /// usually used for: button, ??
  static const secondaryColor = Color(0xff5780d9);

  /// usually used for: card color, pop up color, secondary background color
  static const backgroundColor = Color(0xffeceff1);

  /// usually used for: primary background color
  static const backgroundColor2 = Color(0xfff5f5f5);
}

class TStyle {
//  usually used for title
  static const title = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Futura");

// usually used for general
  static const basic = TextStyle(fontFamily: "Futura", fontSize: 16);

//  usually used for active button
  static var active = TextStyle(
      fontFamily: "Futura",
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.bold);

//  usually used for disable button
  static var disable = TextStyle(
    fontFamily: "Futura",
    fontSize: 16,
    color: Colors.black54,
  );

//  usually used for hint
  static const hint =
      TextStyle(fontFamily: "Futura", fontSize: 16, color: Colors.grey);

// usually used for button
  static const button = TextStyle(
      fontFamily: "Futura",
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  // usually used for button
  static var button2 = TextStyle(
    fontFamily: "Futura",
    fontSize: 18,
    color: Colors.black,
  );

//  usually used for separator text
  static const separator = TextStyle(
    fontFamily: "Futura",
    fontSize: 14,
    color: Colors.grey,
  );

// used for terms
  static const terms = TextStyle(
    fontFamily: "Futura",
    fontSize: 14,
    color: Colors.grey,
    decoration: TextDecoration.underline,
  );
}
