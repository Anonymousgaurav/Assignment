import 'package:gaurav_flutter_assignment/model/photos/PhotosModel.dart';

abstract class PhotoRepo {}

class PhotoLoading extends PhotoRepo {
  PhotoLoading();
}

class PhotoFetchSuccess extends PhotoRepo {
  final Map<int, List<PhotosModel>> modelPhotosMap;

  PhotoFetchSuccess(this.modelPhotosMap);
}

class PhotoError extends PhotoRepo {
  String error;

  PhotoError(this.error);
}
