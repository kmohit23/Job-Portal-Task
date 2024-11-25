import 'dart:convert';

import 'package:ar_job_portal/http/candidate_http_service.dart';
import 'package:ar_job_portal/models/candidate_model.dart';
import 'package:ar_job_portal/models/user_model.dart';
import 'package:ar_job_portal/services/candidate_service.dart';
import 'package:ar_job_portal/services/secure_storage_service.dart';
import 'package:ar_job_portal/services/user_service.dart';
import 'package:ar_job_portal/state/enums/user_role.dart';
import 'package:flutter/widgets.dart';
import 'package:ar_job_portal/http/auth_http_service.dart';
import 'package:ar_job_portal/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ar_job_portal/extensions/extensions_export.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  navigateToSignupPage() {
    AppPages.signup.pushAfterPopAll();
  }

  handleLoginClick() async {
    final userDetails = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    http.Response? response = await AuthHttpService.login(userDetails);
    if (response.isNotNull) {
      Map<String, dynamic> decodedBody = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var token = decodedBody["token"];
        await SecureStorageService.writeSecureData(
            dotenv.env["AUTH_TOKEN_KEY"]!, token);
        debugPrint('User token :: $token');
        UserModel userData = UserModel.fromJson(decodedBody["user"]);
        UserService.to.updateUser(userData);
        http.Response? candidateResponse =
            await CandidateHttpService.getAll(token: token);
        if (candidateResponse.isNotNull) {
          Map<String, dynamic> decodedBody =
              jsonDecode(candidateResponse!.body);
          var data = decodedBody["data"];
          if (candidateResponse.statusCode == 200) {
            if (data.isNotEmpty) {
              for (var candidateData in data) {
                CandidateModel candidate =
                    CandidateModel.fromJson(candidateData);
                CandidateService.to.addCandidates(candidate);
              }
            }
          }
        } else {
          //
        }
        if (userData.role == UserRole.admin) {
          AppPages.adminHome.pushAfterPopAll();
        } else {
          CandidateModel? candidate;
          if (CandidateService.to.candidatesData.isNotEmpty) {
            var result = CandidateService.to.candidatesData
                .where((data) => data.email == userData.email)
                .toList();
            if (result.isNotEmpty) {
              candidate = result.first;
            }
          }

          if (candidate.isNotNull) {
            CandidateService.to.updateUserCandidateDetails(candidate!);
          }
          AppPages.userHome.pushAfterPopAll();
        }
      } else {
        debugPrint(decodedBody["message"]);
      }
    } else {
      debugPrint("Something went wrong");
    }
  }
}
