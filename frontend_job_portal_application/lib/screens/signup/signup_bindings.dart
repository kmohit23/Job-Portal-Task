import 'package:frontend_job_portal_application/screens/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  const SignupBinding();
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
