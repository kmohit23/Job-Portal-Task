import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class OrTextDivider extends StatelessWidget {
  const OrTextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 20.0,
            thickness: 1,
            color: context.primaryDividerColor,
          ),
        ),
        Stack(
          children: [
            Text(
              'or',
              style: context.labelMedium?.copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = context.primaryDividerColor,
              ),
            ),
            Text(
              'or',
              style: context.labelMedium
                  ?.copyWith(color: context.secondaryTextColor),
            ),
          ],
        ),
        Expanded(
          child: Divider(
            indent: 20.0,
            thickness: 1,
            color: context.primaryDividerColor,
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 50);
  }
}
