import 'package:flutter/material.dart';

class OverlayChildLayoutDelegate extends SingleChildLayoutDelegate {
  const OverlayChildLayoutDelegate({
    required this.margins,
    required this.callerOffset,
    required this.callerSize,
    required this.additionalOffset,
    this.marginTop = 24,

  });

  final double marginTop;
  final Rect margins;
  final Offset callerOffset;
  final Size callerSize;
  final Offset additionalOffset;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final double dx = (callerOffset.dx + callerSize.width + additionalOffset.dx)
        .clamp(margins.left, size.width - margins.right - childSize.width);

    final double dy =
        (callerOffset.dy + callerSize.height / 2 - marginTop - additionalOffset.dy - childSize.height / 2)
            .clamp(marginTop + margins.top, size.height - margins.bottom - childSize.height);

    return Offset(dx, dy);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
