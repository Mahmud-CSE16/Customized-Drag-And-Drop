import 'package:drag_and_drop/Models/grid_item.dart';
import 'package:drag_and_drop/Utilities/constants.dart';
import 'package:drag_and_drop/Views/Components/item_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DraggableStaggeredGridPage extends StatefulWidget {
  const DraggableStaggeredGridPage({Key? key}) : super(key: key);

  @override
  State<DraggableStaggeredGridPage> createState() => _DraggableStaggeredGridPageState();
}

class _DraggableStaggeredGridPageState extends State<DraggableStaggeredGridPage> {
  // Track the currently dragged item ID
  String? draggedItemId;
  // Track the target position where item will be placed
  int? dragTargetIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Staggered Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: staggeredGridItems.length,
          itemBuilder: (context, index) {
            // If we're currently dragging an item, we need to adjust the indices
            // to create the visual push-down effect
            if (draggedItemId != null && dragTargetIndex != null) {
              // Get the index of the item being dragged
              final draggedIndex = staggeredGridItems.indexWhere((item) => item.id == draggedItemId);

              // Safety check - if we can't find the dragged item, just render normally
              if (draggedIndex == -1) {
                return _buildDraggableItem(staggeredGridItems[index], index);
              }

              // Make sure target index is valid
              final targetIndex = dragTargetIndex!.clamp(0, staggeredGridItems.length - 1);

              if (draggedIndex < targetIndex) {
                // Dragging downward
                if (index == draggedIndex) {
                  // At the dragged item's original position, show nothing
                  return const SizedBox.shrink();
                } else if (index == targetIndex) {
                  // At the drop target position, show the placeholder
                  return ItemPlaceholder(item: staggeredGridItems[draggedIndex], index:index);
                } else if (index > draggedIndex && index < targetIndex) {
                  // For items between the drag source and target, move them up one spot
                  // Safely check bounds
                  final newIndex = index + 1;
                  if (newIndex < staggeredGridItems.length) {
                    return _buildDraggableItem(staggeredGridItems[newIndex], index);
                  }
                }
              } else if (draggedIndex > targetIndex) {
                // Dragging upward
                if (index == draggedIndex) {
                  // At the dragged item's original position, show nothing
                  return const SizedBox.shrink();
                } else if (index == targetIndex) {
                  // At the drop target position, show the placeholder
                  return ItemPlaceholder(item: staggeredGridItems[draggedIndex], index:index);
                } else if (index >= targetIndex && index < draggedIndex) {
                  // For items between the drag target and source, move them down one spot
                  // Safely check bounds
                  final newIndex = index - 1;
                  if (newIndex >= 0) {
                    return _buildDraggableItem(staggeredGridItems[newIndex], index);
                  }
                }
              }
            }

            // Normal case - no dragging happening or index not affected
            return _buildDraggableItem(staggeredGridItems[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildDraggableItem(GridItem item, int index) {
    // Create a key to measure the exact size of our widget
    final GlobalKey itemKey = GlobalKey();

    // Create the content widget with image background
    Widget tileContent = Container(
      key: itemKey,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // We'll use a stack to overlay text on the image
        image: DecorationImage(
          image: NetworkImage(item.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: 120.0 * item.mainAxisCellCount,
      // Add a semi-transparent overlay for better text visibility
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: item.color.withOpacity(0.3), // Semi-transparent color overlay
        ),
        child: Center(
          // child: Text(
          //   'Item ${item.id}',
          //   style: const TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //     shadows: [
          //       Shadow(
          //         offset: Offset(1.0, 1.0),
          //         blurRadius: 3.0,
          //         color: Color.fromARGB(255, 0, 0, 0),
          //       ),
          //     ],
          //   ),
          // ),
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
          draggedItemId = null;
          dragTargetIndex = null;
        });
      },
      onDraggableCanceled: (_, __) {
        setState(() {
          // Handle drag end logic
          if (dragTargetIndex != null) {
            final originalIndex = staggeredGridItems.indexWhere((i) => i.id == draggedItemId);
            final targetIndex = dragTargetIndex!;

            if (originalIndex != -1 && originalIndex != targetIndex) {
              final draggedItem = staggeredGridItems[originalIndex];
              staggeredGridItems.removeAt(originalIndex);
              final adjustedTarget = originalIndex < targetIndex
                  ? targetIndex - 1
                  : targetIndex;
              staggeredGridItems.insert(adjustedTarget, draggedItem);
            }
          }

          draggedItemId = null;
          dragTargetIndex = null;
        });
      },
      // Use the feedback parameter to create the dragged representation
      feedback: Builder(
        builder: (BuildContext context) {
          // Get the size from the render object if available
          final RenderBox? renderBox = itemKey.currentContext?.findRenderObject() as RenderBox?;
          final Size size = renderBox?.size ?? Size(100.0 * item.crossAxisCellCount, 100.0 * item.mainAxisCellCount);

          return Material(
            elevation: 4.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(item.imageUrl),
                  fit: BoxFit.cover,
                  opacity: 0.8, // Slightly transparent when dragging
                ),
              ),
              // Add a semi-transparent overlay for better text visibility
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: item.color.withOpacity(0.3), // Semi-transparent color overlay
                ),
                child: Center(
                  child: Text(
                    'Item ${item.id}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      childWhenDragging: const SizedBox.shrink(),  // We'll handle this in the grid builder
      child: DragTarget<String>(
        onWillAccept: (data) => data != item.id,
        onAccept: (data) {
          // Find the index of the dropped item
          final sourceIndex = staggeredGridItems.indexWhere((item) => item.id == data);
          if (sourceIndex != -1) {
            setState(() {
              // Get the item being dragged
              final draggedItem = staggeredGridItems[sourceIndex];
              // Remove it from its original position
              staggeredGridItems.removeAt(sourceIndex);
              // Insert it at the new position
              staggeredGridItems.insert(index, draggedItem);
              // Reset tracking variables
              draggedItemId = null;
              dragTargetIndex = null;
            });
          }
        },
        onMove: (details) {
          // Update the target position as the dragged item moves
          setState(() {
            dragTargetIndex = index;
          });
        },
        onLeave: (data) {
          // We'll handle this in a different way now
        },
        builder: (context, candidateData, rejectedData) {
          return tileContent;
        },
      ),
    );
  }
}