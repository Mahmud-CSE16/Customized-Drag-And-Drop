import 'package:flutter/cupertino.dart';

class GridItem {
  final String id;
  final Color color;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final String imageUrl;

  GridItem({
    required this.id,
    required this.color,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.imageUrl,
  });

  // Copy method to create a new instance with overridden properties
  GridItem copyWith({
    String? id,
    Color? color,
    int? crossAxisCellCount,
    int? mainAxisCellCount,
    String? imageUrl,
  }) {
    return GridItem(
      id: id ?? this.id,
      color: color ?? this.color,
      crossAxisCellCount: crossAxisCellCount ?? this.crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount ?? this.mainAxisCellCount,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
