import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurav_flutter_assignment/business/repo/AlbumRepo.dart';
import 'package:gaurav_flutter_assignment/database/HiveDatabase.dart';
import 'package:gaurav_flutter_assignment/model/album/ImagesModel.dart';
import 'package:gaurav_flutter_assignment/network/impl/GalleryApiImpl.dart';
import 'package:gaurav_flutter_assignment/utils/ErrorCodes.dart';
import 'package:gaurav_flutter_assignment/utils/NETConfig.dart';

class AlbumBloc extends Cubit<AlbumRepo> {
  AlbumBloc() : super(AlbumLoading());

  fetchAlbums() async {
    List<dynamic>? response;
    response = await HiveDatabse.fetchAlbums();
    if (response == null) {
      BaseOptions options =
          BaseOptions(method: 'GET', baseUrl: NETConfig.BASE_URL);
      response =
          await GalleryApiImpl.getData(url: NETConfig.ALBUMS, options: options);
      HiveDatabse.addAlbums(response);
    }
    if (response != null) {
      emit(
        AlbumFetchSuccess(
          ImagesModel.fromJson(response),
        ),
      );
    } else {
      emit(
        AlbumError(ErrorCodes.DATA_ERROR),
      );
    }
  }
}
