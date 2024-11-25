import 'package:ar_job_portal/screens/candidate/candidate_controller.dart';
import 'package:ar_job_portal/widgets/edit_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class CandidateScreen extends GetView<CandidateController> {
  const CandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 80.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          controller.candidateDetails.profileImageURL.isNotEmpty
                              ? NetworkImage(
                                  controller.candidateDetails.profileImageURL)
                              : null,
                      backgroundColor: Get.context!.backgroundColor,
                      radius: 30,
                      child: controller.candidateDetails.profileImageURL.isEmpty
                          ? Text(
                              controller.candidateDetails.name.shortendName,
                              style: Get.context!.titleMedium
                                  ?.copyWith(color: Get.context!.primaryColor),
                            )
                          : null,
                    ),
                    EditDetailsWidget(
                      details: controller.candidateDetails.name,
                      detailsLabel: 'Display Name',
                    ),
                    EditDetailsWidget(
                      details: controller.candidateDetails.email,
                      detailsLabel: 'Email',
                    ).paddingSymmetric(vertical: 8),
                    EditDetailsWidget(
                      details: controller.candidateDetails.contact,
                      detailsLabel: 'Contact Info',
                    ),
                    EditDetailsWidget(
                      details: controller.candidateDetails.jobRole,
                      detailsLabel: 'Job Role',
                    ),
                    EditDetailsWidget(
                      details: controller.candidateDetails.education,
                      detailsLabel: 'Education',
                    ),
                    EditDetailsWidget(
                      details: controller.candidateDetails.resumeURL.isNotEmpty
                          ? controller.candidateDetails.resumeURL
                          : "No Resume",
                      detailsLabel: 'Resume',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
