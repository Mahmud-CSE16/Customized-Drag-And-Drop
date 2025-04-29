Draggable Grid Demo

📋 Overview
A Flutter application demonstrating various implementations of draggable grid layouts including responsive and staggered grid patterns with intuitive drag-and-drop functionality.
<details>
<summary>🚀 Features</summary>

Responsive Draggable Grid: A grid layout that automatically adapts to different screen sizes while maintaining drag and drop functionality
Draggable Staggered Grid: A dynamic grid with items of varying sizes that can be rearranged through intuitive drag and drop interactions
Clean Dashboard UI: Simple navigation interface with gradient background and descriptive cards

</details>

📱 Screenshots
<div align="center">
<!-- Add your screenshots here -->
<p>Screenshots coming soon</p>
</div>

🛠️ Project Structure
lib/
├── Models/
│   └── grid_item.dart        # Data model for grid items
├── Utilities/
│   └── constants.dart        # App-wide constants
├── Views/
│   ├── Components/
│   │   ├── dashed_border_painter.dart     # Custom painter for dashed borders
│   │   ├── drag_target_grid_area.dart     # Target area for draggable items
│   │   ├── grid_option_card.dart          # UI card for selecting grid demo
│   │   └── item_placeholder.dart          # Placeholder for grid items
│   ├── Pages/
│   │   ├── dashboard_page.dart            # Main dashboard/home page
│   │   ├── draggable_staggered_grid_page.dart    # Staggered grid implementation
│   │   └── responsive_draggable_grid_page.dart   # Responsive grid implementation
│   └── main.dart             # Application entry point

📋 Implementation Details
<details open>
<summary><b>Grid Types</b></summary>
The application demonstrates two types of draggable grid layouts:

Responsive Draggable Grid: A grid that automatically adjusts the number and layout of items based on screen dimensions. Perfect for applications that need to work across multiple device types.
Draggable Staggered Grid: A grid layout where items can have different sizes (spanning multiple columns and rows). This creates a more dynamic and visually interesting layout.

</details>
<details>
<summary><b>GridItem Model</b></summary>
The GridItem model supports:

Unique identification
Custom colors
Variable sizing (crossAxisCellCount, mainAxisCellCount)
Image URL integration

</details>

🚀 Getting Started
Prerequisites

Flutter SDK (latest stable version recommended)
Dart SDK
Android Studio / VS Code with Flutter extensions

Installation

Clone the repository:

bashgit clone https://github.com/yourusername/drag_and_drop.git

Navigate to the project directory:

bashcd drag_and_drop

Install dependencies:

bashflutter pub get

Run the app:

bashflutter run

📚 Usage
The application starts with a dashboard that allows you to select which grid demo you'd like to explore:

Responsive Draggable Grid: Select this option to see a grid that adapts to your device's screen size
Draggable Staggered Grid: Select this option to experience a grid with items of varying sizes

Once in a grid demo, you can:

Long-press on an item to begin dragging
Drag the item to a new position
Release to drop the item in its new location

