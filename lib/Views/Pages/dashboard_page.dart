import 'package:drag_and_drop/Views/Components/grid_option_card.dart';
import 'package:drag_and_drop/Views/Pages/draggable_staggered_grid_page.dart';
import 'package:drag_and_drop/Views/Pages/responsive_draggable_grid_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select a Grid Demo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Explore different grid layouts with drag and drop functionality',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                GridOptionCard(
                  title: 'Responsive Draggable Grid',
                  description: 'A grid that adapts to different screen sizes',
                  icon: Icons.grid_view,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResponsiveDraggableGridPage(),
                    ));
                  },
                ),
                const SizedBox(height: 20),
                GridOptionCard(
                  title: 'Draggable Staggered Grid',
                  description: 'A grid with items of varying sizes',
                  icon: Icons.dashboard,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DraggableStaggeredGridPage(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}