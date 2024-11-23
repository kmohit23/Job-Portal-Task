import 'package:ar_job_portal/screens/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  const SignupBinding();
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
