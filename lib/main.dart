import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaurav_flutter_assignment/business/bloc/album/AlbumBloc.dart';
import 'package:gaurav_flutter_assignment/business/bloc/photo/PhotoBloc.dart';
import 'package:gaurav_flutter_assignment/presentation/navigator/GalleryNavigator.dart';
import 'package:gaurav_flutter_assignment/presentation/navigator/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumBloc>(create: (context) => AlbumBloc()),
        BlocProvider<PhotoBloc>(create: (context) => PhotoBloc()),
      ],
      child: const MaterialApp(
        title: 'Infinite Scroll Task',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: GalleryNavigator.toHome,
        initialRoute: GalleryRoutes.gallery,
      ),
    );
  }
}
