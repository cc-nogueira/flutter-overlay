import 'package:flutter/material.dart';

class OverlayMarker extends StatelessWidget {
  const OverlayMarker({super.key, required this.color, required this.width});

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(width: (width - 3 * width / 4) / 2);
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_dot(3), space, _dot(2), space, _dot(1)],
    );
  }

  Widget _dot(double div) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4.0),
      ),
      height: width / div,
      width: width / 4,
    );
  }
}
