import 'package:frontend_job_portal_application/screens/home/home_controller.dart';

import 'package:get/get.dart';

class HomeBindings implements Bindings {
  const HomeBindings();
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
