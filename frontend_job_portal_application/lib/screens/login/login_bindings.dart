import 'package:frontend_job_portal_application/screens/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  const LoginBinding();
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
