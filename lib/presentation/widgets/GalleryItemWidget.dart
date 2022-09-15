import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gaurav_flutter_assignment/utils/DeviceUtils.dart';

const String placeHolder = "assets/images/place_holder.png";

class GalleryItemWidget extends StatelessWidget {
  final String imageUrl;

  const GalleryItemWidget(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: DeviceUtils.fractionHeight(context, fraction: 7),
      width: DeviceUtils.fractionWidth(context, fraction: 7),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: DeviceUtils.fractionHeight(context, fraction: 7),
        width: DeviceUtils.fractionWidth(context, fraction: 7),
        child: Image.asset(
          placeHolder,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: DeviceUtils.fractionHeight(context, fraction: 7),
        width: DeviceUtils.fractionWidth(context, fraction: 7),
        child: Image.asset(placeHolder),
      ),
    );
  }
}
