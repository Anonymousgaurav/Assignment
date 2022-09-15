import 'package:flutter/material.dart';
import 'package:gaurav_flutter_assignment/presentation/navigator/routes.dart';
import 'package:gaurav_flutter_assignment/presentation/screens/GalleryHome.dart';
import 'package:gaurav_flutter_assignment/utils/TransparentPageRoute.dart';

class GalleryNavigator {
  static Route<dynamic> toHome(RouteSettings settings) {
    switch (settings.name) {
      case GalleryRoutes.gallery:
        return TransparentPageRoute(
          builder: (_) => const GalleryHome(),
        );
      default:
        return TransparentPageRoute(
          builder: (_) => Container(),
        );
    }
  }
}
