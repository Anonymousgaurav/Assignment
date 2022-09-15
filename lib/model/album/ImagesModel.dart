import 'package:gaurav_flutter_assignment/model/album/AlbumModel.dart';

class ImagesModel {
  List<AlbumModel>? list;

  ImagesModel.fromJson(List<dynamic>? json) {
    if (json != null) {
      list = [];
      for (var e in json) {
        list!.add(AlbumModel.fromJson(e));
      }
    }
  }
}
