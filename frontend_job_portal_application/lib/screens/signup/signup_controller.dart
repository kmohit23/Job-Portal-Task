import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend_job_portal_application/http/user_http_service.dart';
import 'package:frontend_job_portal_application/routes/app_pages.dart';
import 'package:frontend_job_portal_application/state/enums/user_role.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _selectedUserRole = UserRole.user.obs;
  UserRole get selectedUserRole => _selectedUserRole.value;
  updateSelectedUserRole(UserRole newValue) {
    _selectedUserRole.value = newValue;
  }

  navigateToLoginPage() {
    AppPages.login.pushAfterPopAll();
  }

  handleSignUpClick() async {
    final userDetails = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "role": selectedUserRole.name,
    };
    http.Response? response = await AuthHttpService.register(userDetails);
    if (response.isNotNull) {
      Map<String, dynamic> decodedResponse = jsonDecode(response!.body);
      if (response.statusCode == 201) {
        //todo save token
        //temp
        var token = decodedResponse["token"];
        debugPrint('User token :: $token');
        AppPages.home.pushAfterPopAll();
      } else {
        debugPrint(decodedResponse["message"]);
      }
    } else {
      debugPrint('Something went wrong');
    }
  }
}
