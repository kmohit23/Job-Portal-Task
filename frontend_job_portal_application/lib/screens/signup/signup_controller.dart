import 'dart:convert';

import 'package:ar_job_portal/services/secure_storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:ar_job_portal/http/user_http_service.dart';
import 'package:ar_job_portal/routes/app_pages.dart';
import 'package:ar_job_portal/state/enums/user_role.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ar_job_portal/extensions/extensions_export.dart';

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
        var token = decodedResponse["token"];
        SecureStorageService.writeSecureData('token', token);
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
