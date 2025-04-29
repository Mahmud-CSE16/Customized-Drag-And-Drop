
import 'package:drag_and_drop/Views/Pages/dashboard_page.dart';
import 'package:drag_and_drop/Views/Pages/responsive_draggable_grid_page.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Draggable Staggered Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DraggableStaggeredGridPage(),
      // home: const ResponsiveDraggableGridPage(),
      home: DashboardPage(),
    );
  }
}
