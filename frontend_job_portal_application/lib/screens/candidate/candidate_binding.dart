import 'package:ar_job_portal/screens/candidate/candidate_controller.dart';
import 'package:get/get.dart';

class CandidateBinding implements Bindings {
  const CandidateBinding();
  @override
  void dependencies() {
    Get.lazyPut<CandidateController>(() => CandidateController());
  }
}
