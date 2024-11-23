import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/state/enums/button_types.dart';
import 'package:frontend_job_portal_application/widgets/app_button.dart';
import 'package:frontend_job_portal_application/widgets/gap.dart';
import 'package:get/get.dart';
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

extension AppButtonGenerationX on ButtonType {
  /// Builds an AppButton with respect to its type
  AppButton generate({
    required ButtonStyle style,
    double? radius,
    Color? bgColor,
    Color? fgColor,
    Widget? leading,
    Size? minimumSize,
    Size? maximumSize,
    double? fontSize,
    bool? isDisabled,
    required String labelText,
    EdgeInsetsGeometry? padding,
    void Function()? clickHandler,
  }) =>
      AppButton(
        style: style.copyWith(
          minimumSize: WidgetStatePropertyAll(minimumSize),
          maximumSize: WidgetStatePropertyAll(maximumSize),
          padding: WidgetStatePropertyAll(padding),
          backgroundColor: WidgetStatePropertyAll(bgColor),
          foregroundColor: WidgetStatePropertyAll(fgColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? 10.0))),
          ),
        ),
        type: this,
        clickHandler: clickHandler,
        isDisabled: isDisabled ?? false,
        label: leading.isNotNull
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leading!,
                  Gap.byWidth(8.0),
                  Text(
                    labelText,
                    style: Get.context!.labelLarge?.copyWith(
                      color: fgColor,
                      fontSize: fontSize,
                    ),
                  )
                ],
              )
            : Text(
                labelText,
                style: Get.context!.labelLarge?.copyWith(
                  color: fgColor,
                  fontSize: fontSize,
                ),
              ),
      );
}
