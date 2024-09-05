import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Colors.deepPurpleAccent, //<-- SEE HERE
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
