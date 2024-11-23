import 'package:frontend_job_portal_application/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  const SplashBinding();
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
