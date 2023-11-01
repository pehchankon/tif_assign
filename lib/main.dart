import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/home.page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/apiClient.dart';
import 'data/eventRepository.dart';
import 'constants.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ),
  );

  final apiClient = ApiClient(kBaseAPIUrl);
  final eventRepository = EventRepository(apiClient);

  runApp(
    RepositoryProvider<EventRepository>.value(
      value: eventRepository,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final String title = 'title';

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          home: HomePage(),
        );
      });
}
