import 'package:flutter/material.dart';

import 'overlay_child.dart';
import 'overlay_child_layout_delegate.dart';
import 'overlay_marker.dart';
import 'overlay_marker_layout_delegate.dart';

class OverlayDialog extends StatelessWidget {
  const OverlayDialog({
    super.key,
    required this.bgColor,
    required this.index,
    required this.text,
    required this.offset,
    required this.size,
  });

  final Color bgColor;
  final int index;
  final String text;
  final Offset offset;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _dialog(context),
        _marker(context),
      ],
    );
  }

  Widget _dialog(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: OverlayChildLayoutDelegate(
        margins: const Rect.fromLTRB(80, 48, 0, 12),
        callerOffset: offset,
        callerSize: size,
        additionalOffset: const Offset(20, 0),
      ),
      child: OverlayChild(
        bgColor: bgColor,
        text: text,
        index: index,
        onClose: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _marker(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: OverlayMarkerLayoutDelegate(
        callerOffset: offset,
        callerSize: size,
        additionalOffset: const Offset(-8, 0),
      ),
      child: OverlayMarker(color: bgColor, width: 24),
    );
  }
}
