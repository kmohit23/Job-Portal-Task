import 'package:flutter/material.dart';
import 'package:ar_job_portal/state/enhanced_enums/text_field_type.dart';
import 'package:ar_job_portal/widgets/gap.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.title = '',
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = 48,
    this.hintText = '',
    this.minLines,
    this.maxLines,
    this.padding,
    this.type = AppTextFieldType.genric,
  });
  final TextEditingController controller;
  final String title;
  final double height;
  final double width;
  final double borderRadius;
  final String hintText;
  final int? minLines;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final AppTextFieldType type;

  factory AppTextField.withLabel({
    required TextEditingController controller,
    required String title,
    double height = 48,
    double width = double.infinity,
    double borderRadius = 48,
    String hintText = '',
    EdgeInsetsGeometry? padding,
    int minLines = 1,
    int maxLines = 1,
  }) =>
      AppTextField(
        controller: controller,
        title: title,
        height: height,
        width: width,
        borderRadius: borderRadius,
        hintText: hintText,
        padding: padding,
        minLines: minLines,
        maxLines: maxLines,
        type: AppTextFieldType.withLabel,
      );

  @override
  Widget build(BuildContext context) {
    return _buildTextFieldWithRespcetToType(context);
  }

  Widget _buildTextFieldWithRespcetToType(BuildContext context) {
    Widget textField;
    switch (type) {
      case AppTextFieldType.genric:
        textField = _buildTextField(context);
        break;
      case AppTextFieldType.withLabel:
        textField = _buildTextFieldWithLabel(context);
        break;
    }
    return textField;
  }

  _buildTextFieldWithLabel(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.bodyLarge,
          ),
          Gap.byHeight(8.0),
          _buildTextField(context),
        ],
      );

  Widget _buildTextField(BuildContext context) => SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        expands: type.isExpands,
        maxLines: maxLines,
        minLines: minLines,
        textAlignVertical: type.textAlignVertical,
        cursorHeight: 16,
        cursorColor: context.primaryTextColor,
        style: context.bodyLarge,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.secondaryDividerColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          filled: true,
          hintStyle:
              context.bodyLarge?.copyWith(color: context.secondaryTextColor),
          hintText: hintText,
          fillColor: context.cardColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryDividerColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          contentPadding: padding ?? type.padding,
        ),
      ));
}
