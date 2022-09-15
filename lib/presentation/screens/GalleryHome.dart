import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurav_flutter_assignment/business/bloc/album/AlbumBloc.dart';
import 'package:gaurav_flutter_assignment/business/bloc/photo/PhotoBloc.dart';
import 'package:gaurav_flutter_assignment/business/repo/AlbumRepo.dart';
import 'package:gaurav_flutter_assignment/business/repo/PhotoRepo.dart';
import 'package:gaurav_flutter_assignment/model/album/AlbumModel.dart';
import 'package:gaurav_flutter_assignment/presentation/styles/GalleryStyles.dart';
import 'package:gaurav_flutter_assignment/presentation/widgets/GalleryItemWidget.dart';
import 'package:gaurav_flutter_assignment/resources/ColorsRes.dart';
import 'package:gaurav_flutter_assignment/utils/DeviceUtils.dart';
import 'package:gaurav_flutter_assignment/utils/WidgetFactory.dart';

class GalleryHome extends StatefulWidget {
  const GalleryHome({Key? key}) : super(key: key);

  @override
  _GalleryHomeState createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome> {
  List<AlbumModel> modelAlbum = List.empty(growable: true);
  late AlbumBloc _albumCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _albumCubit = BlocProvider.of<AlbumBloc>(context);
    _albumCubit.fetchAlbums();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cypress',
            style: GalleryStyles.appBar,
          ),
          backgroundColor: ColorsRes.whiteColor,
          elevation: 4.0,
          toolbarHeight: 60,
        ),
        body: BlocBuilder<AlbumBloc, AlbumRepo>(builder: (context, state) {
          if (state is AlbumLoading) {
            return WidgetFactory.buildLoading();
          } else if (state is AlbumFetchSuccess) {
            modelAlbum.addAll(state.modelAlbums.list!);
            BlocProvider.of<PhotoBloc>(contexts).fetchPhotos(modelAlbum);
            return _buildVerticalAlbum(context);
          } else {
            return Center(
              child: Text(
                (state as AlbumError).error,
                style: GalleryStyles.appBar,
              ),
            );
          }
        }));
  }

  Widget _buildVerticalAlbum(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          int albumID = modelAlbum[index % 4].id!;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _Dimens.SPACING_HORZ,
              vertical: _Dimens.SPACING_VERC,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  modelAlbum[index % 4].title ?? 'Album',
                  style: GalleryStyles.albumTitle,
                ),
                BlocBuilder<PhotoBloc, PhotoRepo>(
                    builder: (context, photoState) {
                  if (photoState is PhotoLoading) {
                    return SizedBox(
                      height: DeviceUtils.fractionHeight(context, fraction: 7),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (photoState is PhotoFetchSuccess) {
                    return SizedBox(
                        height: DeviceUtils.fractionHeight(
                          context,
                          fraction: 7,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            return Container(
                              key: UniqueKey(),
                              padding: const EdgeInsets.symmetric(
                                vertical: _Dimens.PADDING_HORZ,
                              ),
                              height: DeviceUtils.fractionHeight(
                                context,
                                fraction: 6,
                              ),
                              width: DeviceUtils.fractionWidth(
                                context,
                                fraction: 3.2,
                              ),
                              child: GalleryItemWidget(
                                photoState.modelPhotosMap[albumID]![index % 3]
                                        .thumbnailUrl ??
                                    '',
                              ),
                            );
                          },
                        ));
                  } else {
                    return WidgetFactory.noImageFound();
                  }
                }),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

abstract class _Dimens {
  static const double SPACING_HORZ = 15.0;
  static const double SPACING_VERC = 18.0;
  static const double PADDING_HORZ = 5.0;
}
