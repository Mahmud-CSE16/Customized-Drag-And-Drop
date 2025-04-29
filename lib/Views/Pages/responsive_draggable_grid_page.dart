import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drag_and_drop/Models/grid_item.dart';
import 'package:drag_and_drop/Utilities/constants.dart';
import 'package:drag_and_drop/Views/Components/drag_terget_grid_area.dart';
import 'package:drag_and_drop/Views/Components/item_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';


class ResponsiveDraggableGridPage extends StatefulWidget {
  const ResponsiveDraggableGridPage({Key? key}) : super(key: key);

  @override
  State<ResponsiveDraggableGridPage> createState() => _ResponsiveDraggableGridPageState();
}


class _ResponsiveDraggableGridPageState extends State<ResponsiveDraggableGridPage> {

  // Track the currently dragged item ID
  String? draggedItemId;
  // Track the target position where item will be placed
  int? dragTargetIndex;

  // Function to determine the number of columns based on screen width
  int _getColumnCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return 2; // Phone
    } else if (width < 1024) {
      return 4; // Tablet
    } else {
      return 4; // Desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get responsive column count
    final columnCount = _getColumnCount(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid ($columnCount columns)'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _buildDraggableGrid(context, columnCount),
      ),
    );
  }

  Widget _buildDraggableGrid(BuildContext context, int columnCount) {
    // Instead of filtering and modifying a copy, calculate visibleItems based on the drag state
    List<GridItem> effectiveItems = List.from(items);

    // If we're dragging, remove the dragged item and insert the placeholder
    if (draggedItemId != null && dragTargetIndex != null) {
      // Get the current item index
      final draggedIndex = items.indexWhere((item) => item.id == draggedItemId);

      if (draggedIndex != -1) {
        // Calculate the adjusted target position
        int insertPosition = dragTargetIndex!;
        if (draggedIndex < dragTargetIndex!) {
          insertPosition -= 1;
        }
        insertPosition = insertPosition.clamp(0, effectiveItems.length - 1);

        // Get the dragged item
        final draggedItem = effectiveItems[draggedIndex];

        // Remove the dragged item
        effectiveItems.removeAt(draggedIndex);

        // Insert a placeholder at the target position
        effectiveItems.insert(
            insertPosition,
            draggedItem.copyWith(id: 'placeholder')
        );
      }
    }

    // Create track sizes for the grid (equal width tracks)
    final List<TrackSize> columnSizes = List.generate(
        columnCount,
            (_) => 1.fr
    );

    // Create a list of grid placements
    final List<GridPlacement> gridPlacements = [];

    // Track occupied cells in the grid
    final Map<String, bool> occupiedCells = {};

    // Current row and column position for placing items
    int currentRow = 0;
    int currentCol = 0;

    // Place each item in the grid
    for (int i = 0; i < effectiveItems.length; i++) {
      final item = effectiveItems[i];

      // Find the next available cell position
      while (occupiedCells['$currentRow,$currentCol'] == true) {
        currentCol++;
        if (currentCol >= columnCount) {
          currentCol = 0;
          currentRow++;
        }
      }

      // Check how many columns are available in this row
      int availableColumns = 0;
      for (int c = currentCol; c < columnCount; c++) {
        if (occupiedCells['$currentRow,$c'] != true) {
          availableColumns++;
        } else {
          break; // Stop counting at first occupied cell
        }
      }

      // Calculate the effective span based on item's desired span and available space
      final int effectiveSpan = min(item.crossAxisCellCount, availableColumns);

      // If not enough space in this row for the item's span, move to the next row
      if (effectiveSpan < item.crossAxisCellCount && item.crossAxisCellCount > 1) {
        currentCol = 0;
        currentRow++;
        // Recalculate effective span for the new row
        availableColumns = columnCount;
        for (int c = 0; c < columnCount; c++) {
          if (occupiedCells['$currentRow,$c'] == true) {
            availableColumns = c;
            break;
          }
        }
      }

      // Now place the item with its proper span
      final int finalSpan = min(item.crossAxisCellCount, availableColumns);

      // Mark cells as occupied
      for (int col = currentCol; col < currentCol + finalSpan; col++) {
        occupiedCells['$currentRow,$col'] = true;
      }

      // Create grid placement
      gridPlacements.add(
        GridPlacement(
          rowStart: currentRow,
          columnStart: currentCol,
          columnSpan: finalSpan,
          child: item.id == 'placeholder'
              ? ItemPlaceholder(item: item,index: i,)
              : _buildDraggableItem(item, i, effectiveItems),
        ),
      );

      // Move to next position
      currentCol += finalSpan;
      if (currentCol >= columnCount) {
        currentCol = 0;
        currentRow++;
      }
    }

    // Calculate total number of rows needed
    final int rowCount = currentRow + 1;

    // Use a fixed-height container to ensure constraints are properly passed
    return SingleChildScrollView(
      child: LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: List.generate(rowCount, (_) => auto),
        rowGap: 12,
        columnGap: 12,
        children: gridPlacements,
      ),
    );
  }

  Widget _buildDraggableItem(GridItem item, int index, List<GridItem> currentItems) {
    // Create a key to measure the exact size of our widget
    final GlobalKey itemKey = GlobalKey();

    // Create the content widget with optimized image loading
    Widget tileContent = Container(
      key: itemKey,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: item.color.withOpacity(0.3), // Fallback color while loading
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Use CachedNetworkImage for better performance
            CachedNetworkImage(
              imageUrl: item.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(item.color),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: item.color,
                child: const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            // Color overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    item.color.withOpacity(0.3),
                    item.color.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item ${item.id}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (item.crossAxisCellCount > 1)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Spans ${item.crossAxisCellCount} columns',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return LongPressDraggable<String>(
      data: item.id,
      delay: const Duration(milliseconds: 500),
      hapticFeedbackOnStart: true,
      onDragStarted: () {
        setState(() {
          draggedItemId = item.id;
        });
      },
      onDragEnd: (_) {
        setState(() {
          // Handle drag end logic
          if (dragTargetIndex != null) {
            final originalIndex = items.indexWhere((i) => i.id == draggedItemId);
            final targetIndex = dragTargetIndex!;

            if (originalIndex != -1 && originalIndex != targetIndex) {
              final draggedItem = items[originalIndex];
              items.removeAt(originalIndex);
              final adjustedTarget = originalIndex < targetIndex
                  ? targetIndex - 1
                  : targetIndex;
              items.insert(adjustedTarget, draggedItem);
            }
          }

          draggedItemId = null;
          dragTargetIndex = null;
        });
      },
      onDraggableCanceled: (_, __) {
        setState(() {
          // Handle drag end logic
          if (dragTargetIndex != null) {
            final originalIndex = items.indexWhere((i) => i.id == draggedItemId);
            final targetIndex = dragTargetIndex!;

            if (originalIndex != -1 && originalIndex != targetIndex) {
              final draggedItem = items[originalIndex];
              items.removeAt(originalIndex);
              final adjustedTarget = originalIndex < targetIndex
                  ? targetIndex - 1
                  : targetIndex;
              items.insert(adjustedTarget, draggedItem);
            }
          }

          draggedItemId = null;
          dragTargetIndex = null;
        });
      },
      onDragCompleted: () {
        setState(() {
          draggedItemId = null;
          dragTargetIndex = null;
        });
      },
      // Feedback widget (what you see while dragging)
      feedback: Builder(
        builder: (BuildContext context) {
          final RenderBox? renderBox = itemKey.currentContext?.findRenderObject() as RenderBox?;
          final Size size = renderBox?.size ?? Size(100.0 * item.crossAxisCellCount, 180.0);

          return Material(
            elevation: 8.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: size.width,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Use CachedNetworkImage here too
                    CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(color: item.color),
                      errorWidget: (context, url, error) => Container(color: item.color),
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            item.color.withOpacity(0.3),
                            item.color.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item ${item.id}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black54,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                          if (item.crossAxisCellCount > 1)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Spans ${item.crossAxisCellCount} columns',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      childWhenDragging: const SizedBox.shrink(),
      child: DragTargetGridArea(
        itemId: item.id,
        index: index,
        onAccept: (data, targetIndex) {
          setState(() {
            dragTargetIndex = targetIndex;
          });
        },
        onPositionChanged: (targetIndex) {
          setState(() {
            dragTargetIndex = targetIndex;
          });
        },
        child: tileContent,
      ),
    );
  }
}