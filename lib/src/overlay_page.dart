import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'content.dart';
import 'overlay_child.dart';
import 'overlay_child_layout_delegate.dart';
import 'overlay_marker.dart';
import 'overlay_marker_layout_delegate.dart';
import 'overlay_page_item.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage({super.key});

  @override
  State<OverlayPage> createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  Widget? _overlayChild;
  Widget? _overlayMarker;

  @override
  Widget build(BuildContext context) {
    final Widget? overlayChild = _overlayChild;
    final Widget? overlayMarker = _overlayMarker;
    return Stack(
      children: [
        SizedBox(
          width: 250,
          child: ListView(
            children: [
              for (final (idx, text) in items.indexed)
                OverlayPageItem(
                  bgColor: colors[idx % colors.length],
                  index: idx + 1,
                  text: text,
                  onTap: _showOverlay,
                ),
            ],
          ),
        ),
        if (overlayChild != null) overlayChild,
        if (overlayChild != null && overlayMarker != null) overlayMarker,
      ],
    );
  }

  void _hideOverlay() {
    setState(() {
      _overlayChild = null;
      _overlayMarker = null;
    });
  }

  void _showOverlay({
    required Color bgColor,
    required int index,
    required String text,
    required Offset offset,
    required Size size,
  }) {
    setState(() {
      _overlayChild = CustomSingleChildLayout(
        delegate: OverlayChildLayoutDelegate(
          margins: const Rect.fromLTRB(80, 80, 0, 0),
          callerOffset: offset,
          callerSize: size,
          additionalOffset: const Offset(20, 0),
        ),
        child: OverlayChild(
          bgColor: bgColor,
          text: text,
          index: index,
          onClose: _hideOverlay,
        ),
      );

      _overlayMarker = CustomSingleChildLayout(
        delegate: OverlayMarkerLayoutDelegate(
          margins: const Rect.fromLTRB(80, 80, 0, 0),
          callerOffset: offset,
          callerSize: size,
          additionalOffset: const Offset(-8, 0),
        ),
        child: OverlayMarker(color: bgColor, width: 24),
      );
    });
  }
}
