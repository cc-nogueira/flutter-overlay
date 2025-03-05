import 'package:flutter/material.dart';

class OverlayChild extends StatelessWidget {
  OverlayChild({
    super.key,
    required this.bgColor,
    required this.text,
    required this.index,
    required this.onClose,
  }) {
    darkBg = bgColor.computeLuminance() < 0.5;
  }

  static const double borderRadius = 12.0;

  final Color bgColor;
  final String text;
  final int index;
  final VoidCallback onClose;

  late final bool darkBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _title(context),
          _body(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const SizedBox(height: 20),
        Text('Overlay for $text', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 16.0 * index),
        const Text('----- Some variable space -----'),
        SizedBox(height: 16.0 * index),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

  Widget _title(BuildContext context) {
    final color = darkBg ? Colors.white : Colors.black;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Overlay',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: color),
          ),
          IconButton(
            onPressed: onClose,
            icon: Icon(Icons.close, color: color),
          ),
        ],
      ),
    );
  }
}
