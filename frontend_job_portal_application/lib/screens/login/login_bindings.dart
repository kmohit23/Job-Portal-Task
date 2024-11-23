import 'package:ar_job_portal/screens/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  const LoginBinding();
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
