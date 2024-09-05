import 'package:esferasoft/app/modules/home/controllers/add_notes_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddNotesController>(
      () => AddNotesController(),
    );
  }
}
