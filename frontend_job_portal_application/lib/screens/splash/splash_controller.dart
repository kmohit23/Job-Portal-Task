import 'package:ar_job_portal/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:ar_job_portal/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    2.seconds.delay(navigateToNextPage);
    super.onInit();
  }

  void navigateToNextPage() async {
    String token = await SecureStorageService.readSecureData('token');
    if (token.isEmpty) {
      AppPages.login.pushAfterPopAll();
    } else {
      AppPages.home.pushAfterPopAll();
    }
  }

  final EdgeInsetsGeometry padding = const EdgeInsets.all(16.0);
}
