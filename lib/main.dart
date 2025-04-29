import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Model class for our grid items
class GridItem {
  final String id;
  final Color color;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final String imageUrl; // Property for image URL

  GridItem({
    required this.id,
    required this.color,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.imageUrl,
  });
}

// Fixed list of GridItems with image URLs
final List<GridItem> items = [
  GridItem(
    id: "0",
    color: Colors.primaries[0 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1524024973431-2ad916746881?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "1",
    color: Colors.primaries[1 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1444845026749-81acc3926736?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=864&q=80',
  ),
  GridItem(
    id: "2",
    color: Colors.primaries[2 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "3",
    color: Colors.primaries[3 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1504472478235-9bc48ba4d60f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
  ),
  GridItem(
    id: "4",
    color: Colors.primaries[4 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1520301255226-bf5f144451c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80',
  ),
  GridItem(
    id: "5",
    color: Colors.primaries[5 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "6",
    color: Colors.primaries[6 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1524704654690-b56c05c78a00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
  ),
  GridItem(
    id: "7",
    color: Colors.primaries[7 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1602000737534-f5d2bd78a78b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
  ),
  GridItem(
    id: "8",
    color: Colors.primaries[8 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1580777187326-d45ec82084d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
  ),
  GridItem(
    id: "9",
    color: Colors.primaries[9 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1531804226530-70f8004aa44e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
  ),
  GridItem(
    id: "10",
    color: Colors.primaries[10 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1465056836041-7f43ac27dcb5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
  ),
  GridItem(
    id: "11",
    color: Colors.primaries[11 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1489311778769-38fbf664895a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "12",
    color: Colors.primaries[12 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1524704796725-9fc3044a58b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=905&q=80',
  ),
  GridItem(
    id: "13",
    color: Colors.primaries[13 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1573553256520-d7c529344d67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "14",
    color: Colors.primaries[14 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1444930694458-01babf71870c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=963&q=80',
  ),
  GridItem(
    id: "15",
    color: Colors.primaries[15 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1571752726703-5e7d1f6a986d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=865&q=80',
  ),
  GridItem(
    id: "16",
    color: Colors.primaries[16 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1514503612056-e3f673b3f3bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=826&q=80',
  ),
  GridItem(
    id: "17",
    color: Colors.primaries[17 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
  ),
  GridItem(
    id: "18",
    color: Colors.primaries[18 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1504567961542-e24d9439a724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
  ),
  GridItem(
    id: "19",
    color: Colors.primaries[19 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    imageUrl: 'https://images.unsplash.com/photo-1506260408121-e353d10b87c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80',
  ),
  GridItem(
    id: "20",
    color: Colors.primaries[20 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "21",
    color: Colors.primaries[21 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    imageUrl: 'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "22",
    color: Colors.primaries[22 % Colors.primaries.length],
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1456926631375-92c8ce872def?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
  GridItem(
    id: "23",
    color: Colors.primaries[23 % Colors.primaries.length],
    crossAxisCellCount: 1,
    mainAxisCellCount: 3,
    imageUrl: 'https://images.unsplash.com/photo-1475809913362-28a064062ccd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ),
];

// Build a placeholder that shows where the dragged item will be placed
Widget _buildPlaceholder(GridItem item, int index) {
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Staggered Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DraggableStaggeredGridPage(),
    );
  }
}

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
          itemCount: items.length,
          itemBuilder: (context, index) {
            // If we're currently dragging an item, we need to adjust the indices
            // to create the visual push-down effect
            if (draggedItemId != null && dragTargetIndex != null) {
              // Get the index of the item being dragged
              final draggedIndex = items.indexWhere((item) => item.id == draggedItemId);

              // Safety check - if we can't find the dragged item, just render normally
              if (draggedIndex == -1) {
                return _buildDraggableItem(items[index], index);
              }

              // Make sure target index is valid
              final targetIndex = dragTargetIndex!.clamp(0, items.length - 1);

              if (draggedIndex < targetIndex) {
                // Dragging downward
                if (index == draggedIndex) {
                  // At the dragged item's original position, show nothing
                  return const SizedBox.shrink();
                } else if (index == targetIndex) {
                  // At the drop target position, show the placeholder
                  return _buildPlaceholder(items[draggedIndex], index);
                } else if (index > draggedIndex && index < targetIndex) {
                  // For items between the drag source and target, move them up one spot
                  // Safely check bounds
                  final newIndex = index + 1;
                  if (newIndex < items.length) {
                    return _buildDraggableItem(items[newIndex], index);
                  }
                }
              } else if (draggedIndex > targetIndex) {
                // Dragging upward
                if (index == draggedIndex) {
                  // At the dragged item's original position, show nothing
                  return const SizedBox.shrink();
                } else if (index == targetIndex) {
                  // At the drop target position, show the placeholder
                  return _buildPlaceholder(items[draggedIndex], index);
                } else if (index >= targetIndex && index < draggedIndex) {
                  // For items between the drag target and source, move them down one spot
                  // Safely check bounds
                  final newIndex = index - 1;
                  if (newIndex >= 0) {
                    return _buildDraggableItem(items[newIndex], index);
                  }
                }
              }
            }

            // Normal case - no dragging happening or index not affected
            return _buildDraggableItem(items[index], index);
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
          final sourceIndex = items.indexWhere((item) => item.id == data);
          if (sourceIndex != -1) {
            setState(() {
              // Get the item being dragged
              final draggedItem = items[sourceIndex];
              // Remove it from its original position
              items.removeAt(sourceIndex);
              // Insert it at the new position
              items.insert(index, draggedItem);
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

// Custom painter for drawing dashed borders
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(12),
      ));

    // Create a dash path
    final Path dashPath = Path();
    final double dashWidth = 10.0;
    final double dashSpace = gap;
    double distance = 0.0;

    for (final PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color ||
          oldDelegate.strokeWidth != strokeWidth ||
          oldDelegate.gap != gap;
}









// import 'dart:ui';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:cached_network_image/cached_network_image.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Responsive Draggable Grid',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ResponsiveDraggableGridPage(),
//     );
//   }
// }
//
// class ResponsiveDraggableGridPage extends StatefulWidget {
//   const ResponsiveDraggableGridPage({Key? key}) : super(key: key);
//
//   @override
//   State<ResponsiveDraggableGridPage> createState() => _ResponsiveDraggableGridPageState();
// }
//
// // Add DragTargetGridArea to handle drag targeting areas
// class DragTargetGridArea extends StatelessWidget {
//   final String itemId;
//   final int index;
//   final Function(String, int) onAccept;
//   final Function(int) onPositionChanged;
//   final Widget child;
//
//   const DragTargetGridArea({
//     Key? key,
//     required this.itemId,
//     required this.index,
//     required this.onAccept,
//     required this.onPositionChanged,
//     required this.child,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DragTarget<String>(
//       onWillAccept: (data) => data != itemId,
//       onAccept: (data) => onAccept(data, index),
//       onMove: (details) => onPositionChanged(index),
//       builder: (context, candidateData, rejectedData) {
//         return child;
//       },
//     );
//   }
// }
//
// class _ResponsiveDraggableGridPageState extends State<ResponsiveDraggableGridPage> {
//   // Our list of items - each item has an ID, color, size, and imageUrl
//   final List<GridItem> items = [
//     GridItem(
//       id: "0",
//       color: Colors.primaries[0 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1524024973431-2ad916746881?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//     ),
//     GridItem(
//       id: "1",
//       color: Colors.primaries[1 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1444845026749-81acc3926736?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=864&q=80',
//     ),
//     GridItem(
//       id: "2",
//       color: Colors.primaries[2 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//     ),
//     GridItem(
//       id: "3",
//       color: Colors.primaries[3 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1504472478235-9bc48ba4d60f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
//     ),
//     GridItem(
//       id: "4",
//       color: Colors.primaries[4 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1520301255226-bf5f144451c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80',
//     ),
//     GridItem(
//       id: "5",
//       color: Colors.primaries[5 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//     ),
//     GridItem(
//       id: "6",
//       color: Colors.primaries[6 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1524704654690-b56c05c78a00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
//     ),
//     GridItem(
//       id: "7",
//       color: Colors.primaries[7 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1602000737534-f5d2bd78a78b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
//     ),
//     GridItem(
//       id: "8",
//       color: Colors.primaries[8 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1580777187326-d45ec82084d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
//     ),
//     GridItem(
//       id: "9",
//       color: Colors.primaries[9 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1531804226530-70f8004aa44e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
//     ),
//     GridItem(
//       id: "10",
//       color: Colors.primaries[10 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1465056836041-7f43ac27dcb5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
//     ),
//     GridItem(
//       id: "11",
//       color: Colors.primaries[11 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1489311778769-38fbf664895a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//     ),
//     GridItem(
//       id: "12",
//       color: Colors.primaries[12 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1524704796725-9fc3044a58b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=905&q=80',
//     ),
//     GridItem(
//       id: "13",
//       color: Colors.primaries[13 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1573553256520-d7c529344d67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//     ),
//     GridItem(
//       id: "14",
//       color: Colors.primaries[14 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1444930694458-01babf71870c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=963&q=80',
//     ),
//     GridItem(
//       id: "15",
//       color: Colors.primaries[15 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1571752726703-5e7d1f6a986d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=865&q=80',
//     ),
//     GridItem(
//       id: "16",
//       color: Colors.primaries[16 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1514503612056-e3f673b3f3bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=826&q=80',
//     ),
//     GridItem(
//       id: "17",
//       color: Colors.primaries[17 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
//     ),
//     GridItem(
//       id: "18",
//       color: Colors.primaries[18 % Colors.primaries.length],
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1504567961542-e24d9439a724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
//     ),
//     GridItem(
//       id: "19",
//       color: Colors.primaries[19 % Colors.primaries.length],
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       imageUrl: 'https://images.unsplash.com/photo-1506260408121-e353d10b87c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80',
//     ),
//   ];
//
//   // Track the currently dragged item ID
//   String? draggedItemId;
//   // Track the target position where item will be placed
//   int? dragTargetIndex;
//
//   // Function to determine the number of columns based on screen width
//   int _getColumnCount(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//
//     if (width < 600) {
//       return 2; // Phone
//     } else if (width < 1024) {
//       return 4; // Tablet
//     } else {
//       return 4; // Desktop
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get responsive column count
//     final columnCount = _getColumnCount(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Responsive Grid ($columnCount columns)'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: _buildDraggableGrid(context, columnCount),
//       ),
//     );
//   }
//
//   Widget _buildDraggableGrid(BuildContext context, int columnCount) {
//     // Instead of filtering and modifying a copy, calculate visibleItems based on the drag state
//     List<GridItem> effectiveItems = List.from(items);
//
//     // If we're dragging, remove the dragged item and insert the placeholder
//     if (draggedItemId != null && dragTargetIndex != null) {
//       // Get the current item index
//       final draggedIndex = items.indexWhere((item) => item.id == draggedItemId);
//
//       if (draggedIndex != -1) {
//         // Calculate the adjusted target position
//         int insertPosition = dragTargetIndex!;
//         if (draggedIndex < dragTargetIndex!) {
//           insertPosition -= 1;
//         }
//         insertPosition = insertPosition.clamp(0, effectiveItems.length - 1);
//
//         // Get the dragged item
//         final draggedItem = effectiveItems[draggedIndex];
//
//         // Remove the dragged item
//         effectiveItems.removeAt(draggedIndex);
//
//         // Insert a placeholder at the target position
//         effectiveItems.insert(
//             insertPosition,
//             draggedItem.copyWith(id: 'placeholder')
//         );
//       }
//     }
//
//     // Create track sizes for the grid (equal width tracks)
//     final List<TrackSize> columnSizes = List.generate(
//         columnCount,
//             (_) => 1.fr
//     );
//
//     // Create a list of grid placements
//     final List<GridPlacement> gridPlacements = [];
//
//     // Track occupied cells in the grid
//     final Map<String, bool> occupiedCells = {};
//
//     // Current row and column position for placing items
//     int currentRow = 0;
//     int currentCol = 0;
//
//     // Place each item in the grid
//     for (int i = 0; i < effectiveItems.length; i++) {
//       final item = effectiveItems[i];
//
//       // Find the next available cell position
//       while (occupiedCells['$currentRow,$currentCol'] == true) {
//         currentCol++;
//         if (currentCol >= columnCount) {
//           currentCol = 0;
//           currentRow++;
//         }
//       }
//
//       // Check how many columns are available in this row
//       int availableColumns = 0;
//       for (int c = currentCol; c < columnCount; c++) {
//         if (occupiedCells['$currentRow,$c'] != true) {
//           availableColumns++;
//         } else {
//           break; // Stop counting at first occupied cell
//         }
//       }
//
//       // Calculate the effective span based on item's desired span and available space
//       final int effectiveSpan = min(item.crossAxisCellCount, availableColumns);
//
//       // If not enough space in this row for the item's span, move to the next row
//       if (effectiveSpan < item.crossAxisCellCount && item.crossAxisCellCount > 1) {
//         currentCol = 0;
//         currentRow++;
//         // Recalculate effective span for the new row
//         availableColumns = columnCount;
//         for (int c = 0; c < columnCount; c++) {
//           if (occupiedCells['$currentRow,$c'] == true) {
//             availableColumns = c;
//             break;
//           }
//         }
//       }
//
//       // Now place the item with its proper span
//       final int finalSpan = min(item.crossAxisCellCount, availableColumns);
//
//       // Mark cells as occupied
//       for (int col = currentCol; col < currentCol + finalSpan; col++) {
//         occupiedCells['$currentRow,$col'] = true;
//       }
//
//       // Create grid placement
//       gridPlacements.add(
//         GridPlacement(
//           rowStart: currentRow,
//           columnStart: currentCol,
//           columnSpan: finalSpan,
//           child: item.id == 'placeholder'
//               ? _buildPlaceholder(item)
//               : _buildDraggableItem(item, i, effectiveItems),
//         ),
//       );
//
//       // Move to next position
//       currentCol += finalSpan;
//       if (currentCol >= columnCount) {
//         currentCol = 0;
//         currentRow++;
//       }
//     }
//
//     // Calculate total number of rows needed
//     final int rowCount = currentRow + 1;
//
//     // Use a fixed-height container to ensure constraints are properly passed
//     return SingleChildScrollView(
//       child: LayoutGrid(
//         columnSizes: columnSizes,
//         rowSizes: List.generate(rowCount, (_) => auto),
//         rowGap: 12,
//         columnGap: 12,
//         children: gridPlacements,
//       ),
//     );
//   }
//
//   Widget _buildPlaceholder(GridItem item) {
//     return CustomPaint(
//       painter: DashedBorderPainter(
//         color: Colors.blueAccent,
//         strokeWidth: 2.0,
//         gap: 5.0,
//       ),
//       child: Container(
//         height: 120.0, // Match the item height
//         decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Stack(
//           children: [
//             // Background gradient
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.blueAccent.withOpacity(0.05),
//                     Colors.blueAccent.withOpacity(0.15),
//                   ],
//                 ),
//               ),
//             ),
//             // Content
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.add_photo_alternate_outlined,
//                     color: Colors.blueAccent,
//                     size: 36,
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Drop Here',
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   if (item.crossAxisCellCount > 1)
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         'Spans ${item.crossAxisCellCount} columns',
//                         style: const TextStyle(
//                           color: Colors.blueAccent,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDraggableItem(GridItem item, int index, List<GridItem> currentItems) {
//     // Create a key to measure the exact size of our widget
//     final GlobalKey itemKey = GlobalKey();
//
//     // Create the content widget with optimized image loading
//     Widget tileContent = Container(
//       key: itemKey,
//       height: 120.0,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: item.color.withOpacity(0.3), // Fallback color while loading
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             // Use CachedNetworkImage for better performance
//             CachedNetworkImage(
//               imageUrl: item.imageUrl,
//               fit: BoxFit.cover,
//               placeholder: (context, url) => Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(item.color),
//                 ),
//               ),
//               errorWidget: (context, url, error) => Container(
//                 color: item.color,
//                 child: const Center(
//                   child: Icon(
//                     Icons.error_outline,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                 ),
//               ),
//             ),
//             // Color overlay
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     item.color.withOpacity(0.3),
//                     item.color.withOpacity(0.7),
//                   ],
//                 ),
//               ),
//             ),
//             // Content
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Item ${item.id}',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 3.0,
//                           color: Colors.black54,
//                           offset: Offset(1.0, 1.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   if (item.crossAxisCellCount > 1)
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: Colors.black45,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         'Spans ${item.crossAxisCellCount} columns',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//     return LongPressDraggable<String>(
//       data: item.id,
//       delay: const Duration(milliseconds: 500),
//       hapticFeedbackOnStart: true,
//       onDragStarted: () {
//         setState(() {
//           draggedItemId = item.id;
//         });
//       },
//       onDragEnd: (_) {
//         setState(() {
//           // Handle drag end logic
//           if (dragTargetIndex != null) {
//             final originalIndex = items.indexWhere((i) => i.id == draggedItemId);
//             final targetIndex = dragTargetIndex!;
//
//             if (originalIndex != -1 && originalIndex != targetIndex) {
//               final draggedItem = items[originalIndex];
//               items.removeAt(originalIndex);
//               final adjustedTarget = originalIndex < targetIndex
//                   ? targetIndex - 1
//                   : targetIndex;
//               items.insert(adjustedTarget, draggedItem);
//             }
//           }
//
//           draggedItemId = null;
//           dragTargetIndex = null;
//         });
//       },
//       onDraggableCanceled: (_, __) {
//         setState(() {
//           // Handle drag end logic
//           if (dragTargetIndex != null) {
//             final originalIndex = items.indexWhere((i) => i.id == draggedItemId);
//             final targetIndex = dragTargetIndex!;
//
//             if (originalIndex != -1 && originalIndex != targetIndex) {
//               final draggedItem = items[originalIndex];
//               items.removeAt(originalIndex);
//               final adjustedTarget = originalIndex < targetIndex
//                   ? targetIndex - 1
//                   : targetIndex;
//               items.insert(adjustedTarget, draggedItem);
//             }
//           }
//
//           draggedItemId = null;
//           dragTargetIndex = null;
//         });
//       },
//       onDragCompleted: () {
//         setState(() {
//           draggedItemId = null;
//           dragTargetIndex = null;
//         });
//       },
//       // Feedback widget (what you see while dragging)
//       feedback: Builder(
//         builder: (BuildContext context) {
//           final RenderBox? renderBox = itemKey.currentContext?.findRenderObject() as RenderBox?;
//           final Size size = renderBox?.size ?? Size(100.0 * item.crossAxisCellCount, 180.0);
//
//           return Material(
//             elevation: 8.0,
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(12),
//             child: Container(
//               width: size.width,
//               height: 120.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     // Use CachedNetworkImage here too
//                     CachedNetworkImage(
//                       imageUrl: item.imageUrl,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => Container(color: item.color),
//                       errorWidget: (context, url, error) => Container(color: item.color),
//                     ),
//                     // Gradient overlay
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             item.color.withOpacity(0.3),
//                             item.color.withOpacity(0.7),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Content
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Item ${item.id}',
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 3.0,
//                                   color: Colors.black54,
//                                   offset: Offset(1.0, 1.0),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           if (item.crossAxisCellCount > 1)
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                               decoration: BoxDecoration(
//                                 color: Colors.black45,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Text(
//                                 'Spans ${item.crossAxisCellCount} columns',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       childWhenDragging: const SizedBox.shrink(),
//       child: DragTargetGridArea(
//         itemId: item.id,
//         index: index,
//         onAccept: (data, targetIndex) {
//           setState(() {
//             dragTargetIndex = targetIndex;
//           });
//         },
//         onPositionChanged: (targetIndex) {
//           setState(() {
//             dragTargetIndex = targetIndex;
//           });
//         },
//         child: tileContent,
//       ),
//     );
//   }
// }
//
// // Model class for our grid items
// class GridItem {
//   final String id;
//   final Color color;
//   final int crossAxisCellCount;
//   final int mainAxisCellCount;
//   final String imageUrl; // Added imageUrl field
//
//   GridItem({
//     required this.id,
//     required this.color,
//     required this.crossAxisCellCount,
//     required this.mainAxisCellCount,
//     required this.imageUrl, // Added imageUrl parameter
//   });
//
//   // Copy method to create a new instance with overridden properties
//   GridItem copyWith({
//     String? id,
//     Color? color,
//     int? crossAxisCellCount,
//     int? mainAxisCellCount,
//     String? imageUrl,
//   }) {
//     return GridItem(
//       id: id ?? this.id,
//       color: color ?? this.color,
//       crossAxisCellCount: crossAxisCellCount ?? this.crossAxisCellCount,
//       mainAxisCellCount: mainAxisCellCount ?? this.mainAxisCellCount,
//       imageUrl: imageUrl ?? this.imageUrl,
//     );
//   }
// }
//
// // Custom painter for drawing dashed borders
// class DashedBorderPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final double gap;
//
//   DashedBorderPainter({
//     required this.color,
//     required this.strokeWidth,
//     required this.gap,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke;
//
//     final Path path = Path()
//       ..addRRect(RRect.fromRectAndRadius(
//         Rect.fromLTWH(0, 0, size.width, size.height),
//         const Radius.circular(12),
//       ));
//
//     // Create a dash path
//     final Path dashPath = Path();
//     final double dashWidth = 10.0;
//     final double dashSpace = gap;
//     double distance = 0.0;
//
//     for (final PathMetric pathMetric in path.computeMetrics()) {
//       while (distance < pathMetric.length) {
//         dashPath.addPath(
//           pathMetric.extractPath(distance, distance + dashWidth),
//           Offset.zero,
//         );
//         distance += dashWidth;
//         distance += dashSpace;
//       }
//     }
//
//     canvas.drawPath(dashPath, paint);
//   }
//
//   @override
//   bool shouldRepaint(DashedBorderPainter oldDelegate) =>
//       oldDelegate.color != color ||
//           oldDelegate.strokeWidth != strokeWidth ||
//           oldDelegate.gap != gap;
// }