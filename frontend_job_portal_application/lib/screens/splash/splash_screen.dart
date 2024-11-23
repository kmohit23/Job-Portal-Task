import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/screens/splash/splash_controller.dart';
import 'package:frontend_job_portal_application/utils/constants.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: controller.padding,
        child: const Center(
          child: Text(Constants.appName),
        ),
      ),
    );
  }
}