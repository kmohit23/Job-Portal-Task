import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/screens/login/login_controller.dart';
import 'package:frontend_job_portal_application/widgets/app_textfield.dart';
import 'package:frontend_job_portal_application/widgets/gap.dart';
import 'package:frontend_job_portal_application/widgets/or_text_divider.dart';
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField.withLabel(
              controller: controller.emailController,
              title: 'Email',
            ),
            Gap.byHeight(24.0),
            AppTextField.withLabel(
              controller: controller.passwordController,
              title: 'Password',
            ),
            Gap.byHeight(24),
            ElevatedButton(
              onPressed: controller.handleLoginClick,
              child: const Text("Login"),
            ),
            const OrTextDivider(),
            InkWell(
              onTap: controller.navigateToSignupPage,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'New User ? '),
                    TextSpan(text: 'Sign up', style: context.labelSmall),
                  ],
                  style: Get.context!.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
