import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_config.dart';
import 'view/entry_point_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task_zarcony',
      theme: ThemeData(
          primaryColor: appConfig.colorMain,
          textTheme: TextTheme(
              //orange text
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appConfig.colorMain,
                  fontSize: 14.0),
              //black bold text
              headline2: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
              //black without blod
              headline3: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontSize: 10.0,fontWeight: FontWeight.w500
              ),
              headline4: TextStyle(color: appConfig.colorText, fontSize: 12.0,fontWeight: FontWeight.bold),
              headline5: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 10.0))),
      home: const EntryPointUi(),
    );
  }
}
