import 'package:flutter/material.dart';
import 'package:ar_job_portal/styles/app_theme_colors.dart';

extension ThemeDataExtension on ThemeData {
  AppThemeColors get appColors =>
      extension<AppThemeColors>() ?? AppThemeColors();
}
