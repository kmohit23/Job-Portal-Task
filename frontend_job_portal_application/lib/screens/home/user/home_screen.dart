import 'package:ar_job_portal/widgets/add_candidate_bottomsheet.dart';
import 'package:ar_job_portal/widgets/app_button.dart';
import 'package:ar_job_portal/widgets/edit_details_widget.dart';
import 'package:ar_job_portal/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:ar_job_portal/screens/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class UserHomeScreen extends GetView<HomeController> {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${controller.userName.capitalizeFirst}(${controller.userRole.name})"),
        centerTitle: false,
        actions: [
          AppButton.regular(
            labelText: 'Logout',
            clickHandler: controller.logout,
            minimumSize: const Size(40, 20),
            fontSize: 14,
            backgroundColor: context.backgroundColor,
          ).paddingOnly(right: 10),
        ],
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() => controller.candidateDetails.isNotNull
            ? _buildUserCandidateDetails()
            : _buildAddCandidateDetails()),
      ),
    );
  }

  _buildUserCandidateDetails() => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Get.context!.cardColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        controller.candidateDetails!.profileImageURL.isNotEmpty
                            ? NetworkImage(
                                controller.candidateDetails!.profileImageURL)
                            : null,
                    backgroundColor: Get.context!.backgroundColor,
                    radius: 30,
                    child: controller.candidateDetails!.profileImageURL.isEmpty
                        ? Text(
                            controller.candidateDetails!.name.shortendName,
                            style: Get.context!.titleMedium
                                ?.copyWith(color: Get.context!.primaryColor),
                          )
                        : null,
                  ),
                  EditDetailsWidget(
                    details: controller.candidateDetails!.name,
                    detailsLabel: 'Display Name',
                  ),
                  EditDetailsWidget(
                    details: controller.candidateDetails!.email,
                    detailsLabel: 'Email',
                  ).paddingSymmetric(vertical: 8),
                  EditDetailsWidget(
                    details: controller.candidateDetails!.contact,
                    detailsLabel: 'Contact Info',
                  ),
                  EditDetailsWidget(
                    details: controller.candidateDetails!.jobRole,
                    detailsLabel: 'Job Role',
                  ),
                  EditDetailsWidget(
                    details: controller.candidateDetails!.education,
                    detailsLabel: 'Education',
                  ),
                  EditDetailsWidget(
                    details: controller.candidateDetails!.resumeURL.isNotEmpty
                        ? controller.candidateDetails!.resumeURL
                        : "No Resume",
                    detailsLabel: 'Resume',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  _buildAddCandidateDetails() =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Gap(),
        Text(
          'Please add your profile details',
          style: Get.context!.labelLarge,
        ),
        AppButton.regular(
            labelText: 'Add Details',
            clickHandler: () {
              Get.bottomSheet(const AddDetailsBottomSheet())
                  .whenComplete(controller.resetAddCandidateState);
            }),
      ]).paddingSymmetric(vertical: 40.0);
}
