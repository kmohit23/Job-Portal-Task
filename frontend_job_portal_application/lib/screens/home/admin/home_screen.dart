import 'package:ar_job_portal/routes/app_pages.dart';
import 'package:ar_job_portal/widgets/add_candidate_bottomsheet.dart';
import 'package:ar_job_portal/widgets/app_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ar_job_portal/screens/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class AdminHomeScreen extends GetView<HomeController> {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.userName}(${controller.userRole.name})"),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedButton(
                label: 'Add Candidate',
                clickhandler: () {
                  Get.bottomSheet(const AddDetailsBottomSheet())
                      .whenComplete(controller.resetAddCandidateState);
                },
              ),
              if (controller.candidatesDetails.isNotEmpty)
                Text(
                  'Canidates',
                  style: context.labelLarge,
                ).paddingSymmetric(vertical: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.candidatesDetails.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      AppPages.candidate
                          .push(pageArguements: controller.candidateDetails);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: context.cardColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.candidatesDetails[index].name,
                            style: context.bodyMedium,
                          ),
                          const Icon(Icons.navigate_next)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )).paddingSymmetric(vertical: 16, horizontal: 16),
    );
  }
}

class DottedButton extends StatelessWidget {
  const DottedButton(
      {super.key, required this.label, required this.clickhandler});
  final String label;
  final void Function() clickhandler;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickhandler,
      child: DottedBorder(
        color: context.primaryTextColor,
        borderType: BorderType.RRect,
        radius: const Radius.circular(4.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        dashPattern: const [8, 8],
        child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Add Candidate',
                      style: context.bodyMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Icon(
                    Icons.add,
                    color: context.primaryTextColor,
                    size: 20.0,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
