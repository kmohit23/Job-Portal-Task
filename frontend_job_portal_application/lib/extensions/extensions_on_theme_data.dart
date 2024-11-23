import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/styles/app_theme_colors.dart';

extension ThemeDataExtension on ThemeData {
  AppThemeColors get appColors =>
      extension<AppThemeColors>() ?? AppThemeColors();
}
