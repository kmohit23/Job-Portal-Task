import 'package:flutter/material.dart';
import 'package:ar_job_portal/state/enums/gap_types.dart';

class Gap extends StatelessWidget {
  const Gap({
    super.key,
    this.height,
    this.width,
    this.type,
  });
  final double? height;
  final double? width;
  final GapType? type;

  factory Gap.expanded() => const Gap(type: GapType.expanded);
  factory Gap.size(double size) => Gap(
        height: size,
        width: size,
        type: GapType.bySize,
      );
  factory Gap.byHeight(double height) => Gap(
        height: height,
        type: GapType.byHeight,
      );
  factory Gap.byWidth(double width) => Gap(
        width: width,
        type: GapType.byWidth,
      );
  @override
  Widget build(BuildContext context) {
    if (type != null) {
      return _buildEmptySpaceWithRespectToType();
    }
    return SizedBox(height: height, width: width);
  }

  Widget _buildEmptySpaceWithRespectToType() {
    Widget gapWidget;
    switch (type!) {
      case GapType.expanded:
        gapWidget = const SizedBox.expand();
        break;
      case GapType.byHeight:
        gapWidget = SizedBox(height: height);
      case GapType.byWidth:
        gapWidget = SizedBox(width: width);
      case GapType.bySize:
        gapWidget = SizedBox(height: height, width: width);
    }
    return gapWidget;
  }
}
