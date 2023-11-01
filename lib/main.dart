import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/home.page.dart';

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
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'title';

  @override
  Widget build(BuildContext context) => MaterialApp(
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
}
