import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/styles/app_colors.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  AppThemeColors({
    this.primaryColor = AppColors.primaryColor,
    this.primaryColorWithTransparency = AppColors.primaryColorWithTransparency,
    this.backgroundColor = AppColors.lightBackgroundColor,
    this.cardColor = AppColors.lightCardColor,
    this.primaryTextColor = AppColors.lightPrimaryTextColor,
    this.secondaryTextColor = AppColors.lightSecondaryTextColor,
    this.primaryDividerColor = AppColors.lightDividerPrimaryColor,
    this.secondaryDividerColor = AppColors.lightDividerSecondaryColor,
    this.inactiveTileColor = AppColors.lightInactiveTileColor,
    this.successColor = AppColors.successColor,
    this.dangerColor = AppColors.dangerColor,
  });
  final Color primaryColor;
  final Color primaryColorWithTransparency;
  final Color backgroundColor;
  final Color cardColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color primaryDividerColor;
  final Color secondaryDividerColor;
  final Color inactiveTileColor;
  final Color successColor;
  final Color dangerColor;

  factory AppThemeColors.dark() => AppThemeColors(
        primaryColor: AppColors.primaryColor,
        primaryColorWithTransparency: AppColors.primaryColorWithTransparency,
        backgroundColor: AppColors.darkBackgroundColor,
        cardColor: AppColors.darkCardColor,
        primaryTextColor: AppColors.darkPrimaryTextColor,
        secondaryTextColor: AppColors.darkSecondaryTextColor,
        primaryDividerColor: AppColors.darkDividerPrimaryColor,
        secondaryDividerColor: AppColors.darkDividerSecondaryColor,
        inactiveTileColor: AppColors.darkInactiveTileColor,
        successColor: AppColors.successColor,
        dangerColor: AppColors.dangerColor,
      );

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? appPrimaryColor,
    Color? appPrimaryColorWithTransparency,
    Color? appbackgroundColor,
    Color? appCardColor,
    Color? appPrimaryTextColor,
    Color? appSecondaryTextColor,
    Color? appDividerPrimaryColor,
    Color? appDividerSecondaryColor,
    Color? appInactiveTileColor,
    Color? appSuccessColor,
    Color? appDangerColor,
  }) =>
      AppThemeColors(
        primaryColor: appPrimaryColor ?? primaryColor,
        primaryColorWithTransparency:
            appPrimaryColorWithTransparency ?? primaryColorWithTransparency,
        backgroundColor: appbackgroundColor ?? backgroundColor,
        cardColor: appCardColor ?? cardColor,
        primaryTextColor: appPrimaryTextColor ?? primaryTextColor,
        secondaryTextColor: appSecondaryTextColor ?? secondaryTextColor,
        primaryDividerColor: appDividerPrimaryColor ?? primaryDividerColor,
        secondaryDividerColor:
            appDividerSecondaryColor ?? secondaryDividerColor,
        inactiveTileColor: appInactiveTileColor ?? inactiveTileColor,
        successColor: appSuccessColor ?? successColor,
        dangerColor: appDangerColor ?? dangerColor,
      );

  @override
  ThemeExtension<AppThemeColors> lerp(
      covariant ThemeExtension<AppThemeColors>? other, double t) {
    if (other == null) {
      return this;
    }
    return AppThemeColors();
  }
}
