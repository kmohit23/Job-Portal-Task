import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/state/enums/button_types.dart';
import 'package:frontend_job_portal_application/styles/app_colors.dart';
import 'package:get/route_manager.dart';
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    this.type,
    this.style,
    this.tooltip,
    this.clickHandler,
    this.isDisabled = false,
    super.key,
  });

  final Widget label;
  final String? tooltip;
  final bool isDisabled;
  final ButtonType? type;
  final ButtonStyle? style;
  final void Function()? clickHandler;

  /// Builds a *Elevated* Button widget* with default colors
  ///
  /// [label] is required.
  ///
  /// [leading] is optional and defaults to *null*.
  ///
  /// [fontSize] is optional and defaults to *null*.
  ///
  /// [backgroundColor] is optional and defaults to *null*
  ///
  /// [foregroundColor] is optional and defaults to *null*
  ///
  /// [isDisabled] is optional and defaults to *null*.
  ///
  /// [padding] is optional and defaults to *Symmetric padding i.e verticalPadding : 12 , horizontalPadding : 32 *.
  ///
  /// [minimumSize] is optional and defaults to *width to double.infinity and height to 50*.
  ///
  /// [maximumSize] is optional and defaults to *width to double.infinity and height to double.infinity*.
  ///
  /// [clickHandler] is optional and defaults to *null*.
  ///
  /// [radius] is optional and defaults to *Circular radius of 10 on all edges*.
  ///
  factory AppButton.regular({
    required String labelText,
    double? radius,
    Widget? leading,
    double? fontSize,
    Color? foregroundColor,
    Color? backgroundColor,
    Size? minimumSize,
    Size? maximumSize,
    bool? isDisabled,
    EdgeInsetsGeometry? padding,
    void Function()? clickHandler,
  }) =>
      ButtonType.regular.generate(
        style: Get.context!.elevatedButtonStyle!,
        labelText: labelText,
        radius: radius,
        leading: leading,
        padding: padding,
        fontSize: fontSize,
        isDisabled: isDisabled,
        fgColor: foregroundColor,
        bgColor: backgroundColor,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        clickHandler: clickHandler,
      );

  /// Builds a *Text* Button widget
  ///
  /// [label] is required.
  ///
  /// [leading] is optional and defaults to *null*.
  ///
  /// [fontSize] is optional and defaults to *null*.
  ///
  /// [isDisabled] is optional and defaults to *false*.
  ///
  /// [padding] is optional and defaults to *Symmetric padding i.e verticalPadding : 12 , horizontalPadding : 32 *.
  ///
  /// [minimumSize] is optional and defaults to *width to double.infinity and height to 50*.
  ///
  /// [maximumSize] is optional and defaults to *width to double.infinity and height to double.infinity*.
  ///
  /// [clickHandler] is optional and defaults to *null*.
  ///
  /// [radius] is optional and defaults to *Circular radius of 10 on all edges*.
  ///
  factory AppButton.text({
    required String labelText,
    double? radius,
    Widget? leading,
    double? fontSize,
    Color? backgroundColor,
    Color? foregroundColor,
    Size? minimumSize,
    Size? maximumSize,
    bool isDisabled = false,
    EdgeInsetsGeometry? padding,
    void Function()? clickHandler,
  }) =>
      ButtonType.text.generate(
        style: Get.context!.textButtonStyle!,
        labelText: labelText,
        radius: radius,
        leading: leading,
        padding: padding,
        fontSize: fontSize,
        isDisabled: isDisabled,
        fgColor: foregroundColor,
        bgColor: backgroundColor,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        clickHandler: clickHandler,
      );

  /// Builds a *Elevated* Button widget with *primaryColor*
  ///
  /// [label] is required.
  ///
  /// [leading] is optional and defaults to *null*.
  ///
  /// [fontSize] is optional and defaults to *null*.
  ///
  /// [isDisabled] is optional and defaults to *false*.
  ///
  /// [padding] is optional and defaults to *Symmetric padding i.e verticalPadding : 12 , horizontalPadding : 32 *.
  ///
  /// [minimumSize] is optional and defaults to *width to double.infinity and height to 50*.
  ///
  /// [maximumSize] is optional and defaults to *width to double.infinity and height to double.infinity*.
  ///
  /// [clickHandler] is optional and defaults to *null*.
  ///
  /// [radius] is optional and defaults to *Circular radius of 10 on all edges*.
  ///
  factory AppButton.primary({
    required String labelText,
    double? radius,
    Widget? leading,
    double? fontSize,
    Size? minimumSize,
    Size? maximumSize,
    bool isDisabled = false,
    EdgeInsetsGeometry? padding,
    void Function()? clickHandler,
  }) =>
      ButtonType.primary.generate(
        style: Get.context!.elevatedButtonStyle!,
        labelText: labelText,
        radius: radius,
        leading: leading,
        padding: padding,
        fontSize: fontSize,
        isDisabled: isDisabled,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        clickHandler: clickHandler,
        bgColor: Get.context!.primaryColor,
        fgColor: AppColors.lightPrimaryTextColor,
      );

  /// Builds a *Elevated* Button widget with *dangerColor*
  ///
  /// [label] is required.
  ///
  /// [leading] is optional and defaults to *null*.
  ///
  /// [fontSize] is optional and defaults to *null*.
  ///
  /// [isDisabled] is optional and defaults to *false*.
  ///
  /// [padding] is optional and defaults to *Symmetric padding i.e verticalPadding : 12 , horizontalPadding : 32 *.
  ///
  /// [minimumSize] is optional and defaults to *width to double.infinity and height to 50*.
  ///
  /// [maximumSize] is optional and defaults to *width to double.infinity and height to double.infinity*.
  ///
  /// [clickHandler] is optional and defaults to *null*.
  ///
  /// [radius] is optional and defaults to *Circular radius of 10 on all edges*.
  ///
  factory AppButton.error({
    required String labelText,
    double? radius,
    Widget? leading,
    double? fontSize,
    Size? minimumSize,
    Size? maximumSize,
    bool isDisabled = false,
    EdgeInsetsGeometry? padding,
    void Function()? clickHandler,
  }) =>
      ButtonType.error.generate(
        style: Get.context!.elevatedButtonStyle!,
        labelText: labelText,
        radius: radius,
        leading: leading,
        padding: padding,
        fontSize: fontSize,
        isDisabled: isDisabled,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        clickHandler: clickHandler,
        bgColor: Get.context!.dangerColor,
        fgColor: AppColors.lightBackgroundColor,
      );

  /// Builds a *Icon* Button widget
  ///
  /// [icon] is required.
  ///
  /// [isDisabled] is optional and defaults to *false*.
  ///
  /// [size] is optional and defaults to *20.0*.
  ///
  /// [padding] is optional and defaults to *zero padding*.
  ///
  /// [tooltip] is optional and defaults to *null*.
  ///
  /// [clickHandler] is optional and defaults to *null*.
  ///
  factory AppButton.icon({
    required Icon icon,
    double? size,
    String? tooltip,
    bool isDisabled = false,
    EdgeInsetsGeometry? padding,
    void Function()? clickHandler,
  }) =>
      AppButton(
        style: Get.context!.iconButtonStyle?.copyWith(
          iconSize: WidgetStatePropertyAll(size),
          padding: WidgetStatePropertyAll(padding),
        ),
        type: ButtonType.icon,
        clickHandler: clickHandler,
        isDisabled: isDisabled,
        tooltip: tooltip,
        label: icon,
      );

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (type == ButtonType.text) {
      widget = _buildTextButton();
    } else if (type == ButtonType.icon) {
      widget = _buildIconButton();
    } else {
      widget = _buildElevatedButton();
    }

    return widget;
  }

  Widget _buildElevatedButton() => ElevatedButton(
        onPressed: _isDisable ? null : _handleOnPressed,
        style: style,
        child: label,
      );

  Widget _buildTextButton() => TextButton(
        onPressed: _isDisable ? null : _handleOnPressed,
        style: style,
        child: label,
      );

  Widget _buildIconButton() => IconButton(
        onPressed: _isDisable ? null : _handleOnPressed,
        style: style,
        icon: label,
        tooltip: tooltip,
      );
  bool get _isDisable => (isDisabled || clickHandler.isNull);
  void _handleOnPressed() {
    clickHandler!();
  }
}
