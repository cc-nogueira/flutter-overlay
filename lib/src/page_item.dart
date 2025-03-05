import 'package:flutter/material.dart';

import 'overlay_dialog.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.bgColor,
    required this.index,
    required this.text,
  });

  final Color bgColor;
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showOverlay(context);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text('$index. $text', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    showDialog(
      context: context,
      builder: (context) {
        return OverlayDialog(
          bgColor: bgColor,
          text: text,
          index: index,
          offset: offset,
          size: size,
        );
      },
    );
  }
}
