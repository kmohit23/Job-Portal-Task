import 'dart:convert';
import 'package:ar_job_portal/http/candidate_http_service.dart';
import 'package:ar_job_portal/models/candidate_model.dart';
import 'package:ar_job_portal/models/user_model.dart';
import 'package:ar_job_portal/routes/app_pages.dart';
import 'package:ar_job_portal/services/candidate_service.dart';
import 'package:ar_job_portal/services/secure_storage_service.dart';
import 'package:ar_job_portal/services/user_service.dart';
import 'package:ar_job_portal/state/enhanced_enums/add_candidate_states.dart';
import 'package:ar_job_portal/state/enums/user_role.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  late final UserModel _user;

  @override
  void onInit() {
    _user = UserService.to.userData;
    if (_user.role == UserRole.admin) {
      updateCandidate(CandidateService.to.candidatesData);
    } else {
      if (CandidateService.to.userCandidateDetails.isNotNull) {
        addCandidate(CandidateService.to.userCandidateDetails!);
      }
    }
    super.onInit();
  }

  String get userName => _user.name;
  String get userEmail => _user.email;
  UserRole get userRole => _user.role;

  final candidatesDetails = <CandidateModel>[].obs;
  CandidateModel? get candidateDetails =>
      candidatesDetails.isNotEmpty ? candidatesDetails.first : null;

  void addCandidate(CandidateModel newvalue) {
    candidatesDetails.add(newvalue);
  }

  void updateCandidate(List<CandidateModel> newValue) {
    candidatesDetails.value = newValue;
  }

  final _addCandidateState = AddCandidateState.name.obs;
  AddCandidateState get addCandidateState => _addCandidateState.value;
  void updateAddCandidateState(AddCandidateState newValue) {
    _addCandidateState.value = newValue;
  }

  void resetAddCandidateState() {
    _addCandidateState.value = AddCandidateState.name;
    candidateDetailsWhileAdding = null;
    addTextController.clear();
    file = null;
    clearFileName();
  }

  final addTextController = TextEditingController();

  CandidateModel? candidateDetailsWhileAdding;

  PlatformFile? file;
  final fileName = "".obs;
  void updateFileName(String newValue) {
    fileName.value = newValue;
  }

  void clearFileName() {
    fileName.value = "";
  }

  void handleUpload() async {
    if (file.isNotNull) {
      OpenFile.open(file?.path);
    } else {
      final result = await FilePicker.platform.pickFiles();
      file = result?.files[0];
      updateFileName(file!.name);
      debugPrint("Result :: $file");
    }
  }

  void handleAddNext() async {
    switch (addCandidateState) {
      case AddCandidateState.name:
        candidateDetailsWhileAdding = CandidateModel(
          name: addTextController.text,
          email: userEmail,
          contact: '',
          education: '',
          jobRole: '',
        );
        if (userRole == UserRole.admin) {
          updateAddCandidateState(AddCandidateState.email);
        } else {
          updateAddCandidateState(AddCandidateState.contact);
        }
        addTextController.clear();
        break;
      case AddCandidateState.email:
        candidateDetailsWhileAdding = candidateDetailsWhileAdding?.copyWith(
            email: addTextController.text);
        updateAddCandidateState(AddCandidateState.contact);
        addTextController.clear();
        break;
      case AddCandidateState.contact:
        candidateDetailsWhileAdding = candidateDetailsWhileAdding?.copyWith(
            contact: addTextController.text);
        updateAddCandidateState(AddCandidateState.jobRole);
        addTextController.clear();
      case AddCandidateState.jobRole:
        candidateDetailsWhileAdding = candidateDetailsWhileAdding?.copyWith(
            jobRole: addTextController.text);
        updateAddCandidateState(AddCandidateState.education);
        addTextController.clear();
        break;
      case AddCandidateState.education:
        candidateDetailsWhileAdding = candidateDetailsWhileAdding?.copyWith(
            education: addTextController.text);
        String token = await SecureStorageService.readSecureData(
            dotenv.env["AUTH_TOKEN_KEY"]!);
        http.Response? response = await CandidateHttpService.create(
          candidate: candidateDetailsWhileAdding!,
          token: token,
        );
        if (response.isNotNull) {
          if (response?.statusCode == 201) {
            var decodedBody = jsonDecode(response!.body);
            CandidateModel candidate =
                CandidateModel.fromJson(decodedBody["data"]);
            updateCandidate([candidate, ...candidatesDetails]);
          } else {}
        }
        updateAddCandidateState(AddCandidateState.profileImage);
        addTextController.clear();
        break;
      case AddCandidateState.profileImage:
        if (file.isNotNull) {
          String token = await SecureStorageService.readSecureData(
              dotenv.env['AUTH_TOKEN_KEY']!);
          CandidateModel? candidate =
              await CandidateHttpService.uploadFileOfCandidate(
                  fieldName: "profileImage", file: file!.path!, token: token);
          if (candidate.isNotNull) {
            var updatedData = candidatesDetails.map((data) {
              if (data.email == candidate?.email) {
                return candidate!;
              } else {
                return data;
              }
            }).toList();
            updateCandidate(updatedData);
          }
          updateAddCandidateState(AddCandidateState.resume);
          file = null;
          clearFileName();
        }
        break;
      case AddCandidateState.resume:
        if (file.isNotNull) {
          String token = await SecureStorageService.readSecureData(
              dotenv.env['AUTH_TOKEN_KEY']!);
          CandidateModel? candidate =
              await CandidateHttpService.uploadFileOfCandidate(
                  fieldName: "resume", file: file!.path!, token: token);
          if (candidate.isNotNull) {
            var updatedData = candidatesDetails.map((data) {
              if (data.email == candidate?.email) {
                return candidate!;
              } else {
                return data;
              }
            }).toList();
            updateCandidate(updatedData);
          }
          Get.back();
        }
        break;
    }
  }

  void logout() {
    SecureStorageService.deleteSecureData(dotenv.env["AUTH_TOKEN_KEY"]!);
    UserService.to.clearData();
    CandidateService.to.clearData();
    AppPages.login.pushAfterPopAll();
  }
}
