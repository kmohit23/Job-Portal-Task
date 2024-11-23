import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    2.seconds.delay(navigateToNextPage);
    super.onInit();
  }

  void navigateToNextPage() async {
    AppPages.login.pushAfterPopAll();
  }

  final EdgeInsetsGeometry padding = const EdgeInsets.all(16.0);
}
