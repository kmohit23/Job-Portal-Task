import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/screens/signup/signup_controller.dart';
import 'package:frontend_job_portal_application/state/enums/user_role.dart';
import 'package:frontend_job_portal_application/widgets/app_textfield.dart';
import 'package:frontend_job_portal_application/widgets/gap.dart';
import 'package:frontend_job_portal_application/widgets/or_text_divider.dart';
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

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
            controller: controller.nameController,
            title: 'Name',
          ),
          Gap.byHeight(24),
          AppTextField.withLabel(
            controller: controller.emailController,
            title: 'Email',
          ),
          Gap.byHeight(24),
          AppTextField.withLabel(
            controller: controller.passwordController,
            title: 'Password',
          ),
          Gap.byHeight(24),
          SizedBox(
            height: 50,
            width: context.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Role',
                  style: context.labelMedium,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Obx(
                    () => DropdownButton(
                      value: controller.selectedUserRole.name,
                      alignment: Alignment.center,
                      underline: const Gap(),
                      style: context.labelMedium,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      items: UserRole.values
                          .map((type) => DropdownMenuItem(
                                value: type.name,
                                child: Text(type.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller
                            .updateSelectedUserRole(UserRole.fromSting(value!));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap.byHeight(24),
          ElevatedButton(
              onPressed: controller.handleSignUpClick,
              child: const Text('Sign Up')),
          const OrTextDivider(),
          InkWell(
            onTap: controller.navigateToLoginPage,
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Already have an account?'),
                  TextSpan(text: 'Log in', style: context.labelSmall),
                ],
                style: context.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
