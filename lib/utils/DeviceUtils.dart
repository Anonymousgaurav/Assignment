import 'package:flutter/cupertino.dart';

abstract class DeviceUtils {
  static double fractionWidth(BuildContext context, {double fraction = 1.0}) {
    assert(fraction > 0.0);

    return MediaQuery.of(context).size.width / fraction;
  }

  static double fractionHeight(BuildContext context, {double fraction = 1.0}) {
    assert(fraction > 0.0);

    return MediaQuery.of(context).size.height / fraction;
  }

  static double factorWidth(BuildContext context, {double factor = 1.0}) {
    return MediaQuery.of(context).size.width * factor;
  }

  static double factorHeight(BuildContext context, {double factor = 1.0}) {
    return MediaQuery.of(context).size.height * factor;
  }
}
