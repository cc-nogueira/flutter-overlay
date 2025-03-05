import 'package:flutter/material.dart';

class OverlayChildLayoutDelegate extends SingleChildLayoutDelegate {
  const OverlayChildLayoutDelegate({
    required this.margins,
    required this.callerOffset,
    required this.callerSize,
    required this.additionalOffset,
  });

  final Rect margins;
  final Offset callerOffset;
  final Size callerSize;
  final Offset additionalOffset;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final double dx = (callerOffset.dx + callerSize.width - margins.left + additionalOffset.dx)
        .clamp(0, size.width - margins.right - childSize.width);

    final double dy =
        (callerOffset.dy + callerSize.height / 2 - margins.top + additionalOffset.dy - childSize.height / 2)
            .clamp(0, size.height - margins.bottom - childSize.height);

    return Offset(dx, dy);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
