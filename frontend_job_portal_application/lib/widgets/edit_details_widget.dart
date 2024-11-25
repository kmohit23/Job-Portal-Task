import 'package:ar_job_portal/widgets/app_button.dart';
import 'package:ar_job_portal/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class EditDetailsWidget extends StatelessWidget {
  const EditDetailsWidget({
    super.key,
    required this.detailsLabel,
    required this.details,
    this.buttonName,
    this.handleButtonClick,
  });

  final String detailsLabel;
  final String details;
  final String? buttonName;
  final void Function()? handleButtonClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  detailsLabel,
                  style: context.bodyLarge,
                ),
                Gap.byHeight(8.0),
                Text(
                  details,
                  style: context.labelMedium,
                ),
              ],
            ),
          ),
          if (buttonName.isNotNull)
            AppButton.regular(
              labelText: buttonName!,
              clickHandler: handleButtonClick,
              backgroundColor: context.backgroundColor,
              minimumSize: Size.zero,
            ),
        ],
      ),
    ).paddingSymmetric(horizontal: 8, vertical: 16);
  }
}
