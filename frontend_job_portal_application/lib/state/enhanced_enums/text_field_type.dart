import 'package:flutter/material.dart';

enum AppTextFieldType {
  genric(
    isExpands: true,
    textAlignVertical: TextAlignVertical.top,
    padding: EdgeInsets.all(24),
  ),
  withLabel(
    isExpands: false,
    textAlignVertical: TextAlignVertical.center,
    padding: EdgeInsets.symmetric(horizontal: 24),
  );

  const AppTextFieldType({
    required this.isExpands,
    required this.textAlignVertical,
    required this.padding,
  });
  final bool isExpands;
  final TextAlignVertical textAlignVertical;
  final EdgeInsetsGeometry padding;
}
