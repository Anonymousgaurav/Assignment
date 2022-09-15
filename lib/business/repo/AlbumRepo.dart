import 'package:gaurav_flutter_assignment/model/album/ImagesModel.dart';

abstract class AlbumRepo {}

class AlbumLoading extends AlbumRepo {
  AlbumLoading();
}

class AlbumFetchSuccess extends AlbumRepo {
  final ImagesModel modelAlbums;
  bool deleteMode = false;

  AlbumFetchSuccess(this.modelAlbums, {this.deleteMode = false});
}

class AlbumError extends AlbumRepo {
  String error;

  AlbumError(this.error);
}
