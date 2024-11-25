import 'package:ar_job_portal/models/candidate_model.dart';
import 'package:get/get.dart';

class CandidateService extends GetxService {
  static CandidateService get to => Get.find();

  Future<CandidateService> init() async {
    return this;
  }

  final _candidates = <CandidateModel>[].obs;
  List<CandidateModel> get candidatesData => _candidates;
  CandidateModel? userCandidateDetails;
  void updateCandidates(List<CandidateModel> newValue) {
    _candidates.value = newValue;
  }

  void addCandidates(CandidateModel newValue) {
    _candidates.add(newValue);
  }

  void updateUserCandidateDetails(CandidateModel newValue) {
    userCandidateDetails = newValue;
  }

  clearData() {
    _candidates.clear();
    userCandidateDetails = null;
  }
}
