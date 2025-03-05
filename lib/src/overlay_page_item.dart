import 'package:flutter/material.dart';

class OverlayPageItem extends StatelessWidget {
  const OverlayPageItem({
    super.key,
    required this.bgColor,
    required this.index,
    required this.text,
    required this.onTap,
  });

  final Color bgColor;
  final int index;
  final String text;
  final void Function({
    required Color bgColor,
    required int index,
    required String text,
    required Offset offset,
    required Size size,
  }) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset offset = renderBox.localToGlobal(Offset.zero);
        final Size size = renderBox.size;
        onTap(bgColor: bgColor, text: text, index: index, offset: offset, size: size);
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
}
