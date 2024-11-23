import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

extension SizeExtension on BuildContext {
  ///Retrieves the full screen-height of the current context.
  double get screenHeight => MediaQuery.of(this).size.height;

  ///Retrieves the full screen-width of the current context.
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension AppColorsExtension on BuildContext {
  /// Retrieves the primary color from the current context.
  Color get primaryColor => Theme.of(this).appColors.primaryColor;

  /// Retrieves the primary color with 50% Transparency from the current context.
  Color get primaryColorWithTransparency =>
      Theme.of(this).appColors.primaryColorWithTransparency;

  /// Retrieves the background color from the current context.
  Color get backgroundColor => Theme.of(this).appColors.backgroundColor;

  /// Retrieves the card color from the current context.
  Color get cardColor => Theme.of(this).appColors.cardColor;

  /// Retrieves the primary-text color from the current context.
  Color get primaryTextColor => Theme.of(this).appColors.primaryTextColor;

  /// Retrieves the secondary-text color from the current context.
  Color get secondaryTextColor => Theme.of(this).appColors.secondaryTextColor;

  /// Retrieves the primary-divider color from the current context.
  Color get primaryDividerColor => Theme.of(this).appColors.primaryDividerColor;

  /// Retrieves the secondary-divider color from the current context.
  Color get secondaryDividerColor =>
      Theme.of(this).appColors.secondaryDividerColor;

  /// Retrieves the inactive-tile color from the current context.
  Color get inactiveTileColor => Theme.of(this).appColors.inactiveTileColor;

  /// Retrieves the success color from the current context.
  Color get successColor => Theme.of(this).appColors.successColor;

  /// Retrieves the danger color from the current context.
  Color get dangerColor => Theme.of(this).appColors.dangerColor;
}

extension TextStyleExtension on BuildContext {
  /// Retrieves the titleMedium style from the current context.
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  /// Retrieves the labelLarge style from the current context.
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  /// Retrieves the labelMedium style from the current context.
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  /// Retrieves the labelSmall style from the current context.
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  /// Retrieves the bodyLarge style from the current context.
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  /// Retrieves the bodyMedium style from the current context.
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  /// Retrieves the bodySmall style from the current context.
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
}

extension ButtonStyleExtension on BuildContext {
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      Theme.of(this).elevatedButtonTheme;
  TextButtonThemeData get textButtonThemeData => Theme.of(this).textButtonTheme;
  ButtonStyle? get elevatedButtonStyle =>
      Theme.of(this).elevatedButtonTheme.style;
  ButtonStyle? get textButtonStyle => Theme.of(this).textButtonTheme.style;
  ButtonStyle? get iconButtonStyle => Theme.of(this).iconButtonTheme.style;
}

extension ThemeModeExtension on BuildContext {
  bool get isLightMode =>
      Theme.of(this).brightness == Brightness.dark ? true : false;
}
