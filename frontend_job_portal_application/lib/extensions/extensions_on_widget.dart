import 'package:flutter/material.dart';

extension ExtendedAlignment on Widget {
  /// Centers the widget within its parent widget.
  Align get alignAtCenter => Align(
        alignment: Alignment.center,
        child: this,
      );

  /// Centers the widget along the left edge within its parent widget.
  Align get alignAtCenterLeft => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  /// Centers the widget along the right edge within its parent widget.
  Align get alignAtCenterRight => Align(
        alignment: Alignment.centerRight,
        child: this,
      );

  /// Centers the widget along the top edge within its parent widget.
  Align get alignAtTopCenter => Align(
        alignment: Alignment.topCenter,
        child: this,
      );

  /// Centers the widget along the bottom edge within its parent widget.
  Align get alignAtBottomCenter => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );

  /// Position the widget at the top-left corner within its parent widget.
  Align get alignAtTopLeft => Align(
        alignment: Alignment.topLeft,
        child: this,
      );

  ///  Position the widget at the top-right corner within its parent widget.
  Align get alignAtTopRight => Align(
        alignment: Alignment.topRight,
        child: this,
      );

  /// Position the widget at the bottom-left corner within its parent widget.
  Align get alignAtBottomLeft => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );

  /// Position the widget at the bottom-right corner within its parent widget.
  Align get alignAtBottomRight => Align(
        alignment: Alignment.bottomRight,
        child: this,
      );
}
