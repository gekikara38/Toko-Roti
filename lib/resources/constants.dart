import 'package:flutter/material.dart';

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
  static const secondaryColor = Color(0xff8bc34a);

  /// usually used for: card color, pop up color, secondary background color
  static const backgroundColor = Color(0xfffafafa);

  /// usually used for: primary background color
  static const backgroundColor2 = Color(0xfff5f5f5);
}

class TStyle {
//  usually used for title
  static const title = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Futura");

// usually used for general
  static const basic = TextStyle(fontFamily: "Futura", fontSize: 16);
}
