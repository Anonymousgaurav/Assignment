import 'package:flutter/widgets.dart';
import 'package:gaurav_flutter_assignment/resources/ColorsRes.dart';
import 'package:gaurav_flutter_assignment/resources/Fonts.dart';

class GalleryStyles {
  static TextStyle get appBar {
    return TextStyle(
      fontSize: 18,
      color: ColorsRes.textSecondaryColor,
      fontFamily: Fonts.primaryFontFamily,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      letterSpacing: 1.0,
    );
  }

  static TextStyle get albumTitle {
    return TextStyle(
      fontSize: 14,
      color: ColorsRes.textTitleColor,
      fontFamily: Fonts.primaryFontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 1.0,
    );
  }

  static TextStyle get errorMsg {
    return TextStyle(
      fontSize: 18,
      color: ColorsRes.redColor,
      fontFamily: Fonts.primaryFontFamily,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      letterSpacing: 1.0,
    );
  }
}
