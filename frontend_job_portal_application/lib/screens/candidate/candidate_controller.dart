import 'package:ar_job_portal/models/candidate_model.dart';
import 'package:get/get.dart';

class CandidateController extends GetxController {
  late CandidateModel candidateDetails;

  @override
  void onInit() {
    candidateDetails = Get.arguments as CandidateModel;
    super.onInit();
  }
}
