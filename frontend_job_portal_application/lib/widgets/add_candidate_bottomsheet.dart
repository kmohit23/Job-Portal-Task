import 'package:ar_job_portal/screens/home/home_controller.dart';
import 'package:ar_job_portal/state/enhanced_enums/add_candidate_states.dart';
import 'package:ar_job_portal/widgets/app_button.dart';
import 'package:ar_job_portal/widgets/app_textfield.dart';
import 'package:ar_job_portal/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class AddDetailsBottomSheet extends GetView<HomeController> {
  const AddDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.context!.cardColor,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20))),
      height: 200,
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.addCandidateState.index >=
                AddCandidateState.profileImage.index)
              Text(
                controller.addCandidateState.title,
                style: Get.context!.bodyLarge,
              ).paddingOnly(bottom: 16),
            controller.addCandidateState.index <
                    AddCandidateState.profileImage.index
                ? AppTextField.withLabel(
                    title: controller.addCandidateState.title,
                    controller: controller.addTextController)
                : InkWell(
                    onTap: controller.handleUpload,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Get.context!.primaryTextColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Obx(
                        () => Text(
                          controller.fileName.isNotEmpty
                              ? controller.fileName.value
                              : controller.addCandidateState.buttonLabel,
                          style: context.bodyLarge,
                        ).alignAtCenter,
                      ),
                    ),
                  ),
            Gap.byHeight(20.0),
            AppButton.text(
              labelText: controller.addCandidateState.index >
                      AddCandidateState.education.index
                  ? 'Upload'
                  : controller.addCandidateState.buttonLabel,
              clickHandler: controller.handleAddNext,
              backgroundColor: Get.context!.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
