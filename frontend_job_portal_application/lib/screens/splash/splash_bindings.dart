import 'package:ar_job_portal/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  const SplashBinding();
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
