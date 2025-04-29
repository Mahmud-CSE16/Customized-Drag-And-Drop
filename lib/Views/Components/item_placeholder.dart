import 'package:drag_and_drop/Models/grid_item.dart';
import 'package:drag_and_drop/Views/Components/dashed_border_painter.dart';
import 'package:flutter/material.dart';

class ItemPlaceholder extends StatelessWidget {
  const ItemPlaceholder({super.key, required this.item, required this.index});

  final GridItem item;
  final int index;


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // painter: DashedBorderPainter(
      //   color: Colors.blueAccent,
      //   strokeWidth: 2.0,
      //   gap: 5.0,
      // ),
      child: Container(
        height: 120.0 * item.mainAxisCellCount,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Drop Here',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
