import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurav_flutter_assignment/business/repo/PhotoRepo.dart';
import 'package:gaurav_flutter_assignment/database/HiveDatabase.dart';
import 'package:gaurav_flutter_assignment/model/album/AlbumModel.dart';
import 'package:gaurav_flutter_assignment/model/photos/PhotosModel.dart';
import 'package:gaurav_flutter_assignment/network/impl/GalleryApiImpl.dart';
import 'package:gaurav_flutter_assignment/utils/ErrorCodes.dart';
import 'package:gaurav_flutter_assignment/utils/NETConfig.dart';

class PhotoBloc extends Cubit<PhotoRepo> {
  PhotoBloc() : super(PhotoLoading());

  fetchPhotos(List<AlbumModel> modelAlbums) async {
    BaseOptions options = BaseOptions(
      method: 'GET',
      baseUrl: NETConfig.BASE_URL,
    );

    List<dynamic>? response = await HiveDatabse.fetchPhotos();

    if (response == null) {
      response = await Future.wait([
        GalleryApiImpl.getData(
          url: '${NETConfig.PHOTOS}?albumId=${modelAlbums[0].id}',
          options: options,
        )!,
        GalleryApiImpl.getData(
          url: '${NETConfig.PHOTOS}?albumId=${modelAlbums[1].id}',
          options: options,
        )!,
        GalleryApiImpl.getData(
          url: '${NETConfig.PHOTOS}?albumId=${modelAlbums[2].id}',
          options: options,
        )!,
        GalleryApiImpl.getData(
          url: '${NETConfig.PHOTOS}?albumId=${modelAlbums[3].id}',
          options: options,
        )!,
      ]);
      HiveDatabse.addPhotos(response);
    }
    if (response != null) {
      Map<int, List<PhotosModel>> photosData = {};
      for (var album in response) {
        List<PhotosModel> modelPhotos = [];
        for (var item in album) {
          modelPhotos.add(PhotosModel.fromJson(item));
        }
        photosData[album[0]['albumId']] = modelPhotos;
      }
      emit(PhotoFetchSuccess(photosData));
    } else {
      emit(
        PhotoError(ErrorCodes.DATA_ERROR),
      );
    }
  }
}
