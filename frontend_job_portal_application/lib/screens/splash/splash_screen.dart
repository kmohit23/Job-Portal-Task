import 'package:flutter/material.dart';
import 'package:ar_job_portal/screens/splash/splash_controller.dart';
import 'package:ar_job_portal/utils/constants.dart';
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
