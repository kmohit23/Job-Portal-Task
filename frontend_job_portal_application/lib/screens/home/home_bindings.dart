import 'package:ar_job_portal/screens/home/home_controller.dart';

import 'package:get/get.dart';

class HomeBindings implements Bindings {
  const HomeBindings();
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
