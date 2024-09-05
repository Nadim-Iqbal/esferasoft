import 'package:esferasoft/app/modules/home/views/add_notes_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const ADDNOTES = Routes.ADDNOTES;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDNOTES,
      page: () => AddNotesScreen(),
      binding: HomeBinding(),
    ),
  ];
}
