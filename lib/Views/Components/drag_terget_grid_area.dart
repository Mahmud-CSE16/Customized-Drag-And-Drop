import 'package:flutter/material.dart';

class DragTargetGridArea extends StatelessWidget {
  final String itemId;
  final int index;
  final Function(String, int) onAccept;
  final Function(int) onPositionChanged;
  final Widget child;

  const DragTargetGridArea({
    Key? key,
    required this.itemId,
    required this.index,
    required this.onAccept,
    required this.onPositionChanged,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: (data) => data != itemId,
      onAccept: (data) => onAccept(data, index),
      onMove: (details) => onPositionChanged(index),
      builder: (context, candidateData, rejectedData) {
        return child;
      },
    );
  }
}