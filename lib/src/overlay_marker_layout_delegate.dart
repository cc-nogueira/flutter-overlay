import 'package:flutter/material.dart';

class OverlayMarkerLayoutDelegate extends SingleChildLayoutDelegate {
  const OverlayMarkerLayoutDelegate({
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
    return Offset(
      (callerOffset.dx + callerSize.width - margins.left + additionalOffset.dx),
      (callerOffset.dy + callerSize.height / 2 - margins.top - childSize.height / 2 + additionalOffset.dy),
    );
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
