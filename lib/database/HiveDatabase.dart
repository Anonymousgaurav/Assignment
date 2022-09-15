import 'package:gaurav_flutter_assignment/resources/DBKeys.dart';
import 'package:hive/hive.dart';

class HiveDatabse {
  static Box? _albumBox;
  static Box? _photoBox;

  static Future<void> addAlbums(List<dynamic>? albums) async {
    _albumBox = await Hive.openBox(DBKeys.albumOpenBox);
    _albumBox?.put(DBKeys.albumKey, albums);
    await _albumBox?.close();
  }

  static Future<List<dynamic>?> fetchAlbums() async {
    _albumBox = await Hive.openBox(DBKeys.albumOpenBox);
    var albums = _albumBox?.get(DBKeys.albumKey);
    await _albumBox?.close();
    return albums;
  }

  static Future<void> addPhotos(List<dynamic>? photos) async {
    _photoBox = await Hive.openBox(DBKeys.photoOpenBox);
    _photoBox?.put(DBKeys.photoKey, photos);
    await _photoBox?.close();
  }

  static Future<List<dynamic>?> fetchPhotos() async {
    _photoBox = await Hive.openBox(DBKeys.photoOpenBox);
    var photos = _photoBox?.get(DBKeys.photoKey);
    await _photoBox?.close();
    return photos;
  }
}
