import 'package:flutter/material.dart';
import 'package:gaurav_flutter_assignment/presentation/styles/GalleryStyles.dart';

class WidgetFactory {
  static Widget buildLoading() =>
      const Center(child: CircularProgressIndicator());

  static Widget noImageFound() => Center(
          child: Text(
        "No Image",
        style: GalleryStyles.errorMsg,
      ));
}
