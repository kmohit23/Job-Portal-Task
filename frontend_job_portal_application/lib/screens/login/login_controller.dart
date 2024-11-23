import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend_job_portal_application/http/user_http_service.dart';
import 'package:frontend_job_portal_application/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

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
      Map<String, dynamic> decodedResponse = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        //todo save token
        //temp
        var token = decodedResponse["token"];
        debugPrint('User token :: $token');
        AppPages.home.pushAfterPopAll();
      } else {
        debugPrint(decodedResponse["message"]);
      }
    } else {
      debugPrint("Something went wrong");
    }
  }
}
