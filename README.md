# Draggable Grid Demo

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## Overview

A Flutter application demonstrating various implementations of draggable grid layouts including responsive and staggered grid patterns with intuitive drag-and-drop functionality.

## Screenshots

<div>
<img src="https://raw.githubusercontent.com/Mahmud-CSE16/Customized-Drag-And-Drop/main/Screenrecords/dashboard.jpeg" alt="Dashboard" width="300"/>
<img src="https://raw.githubusercontent.com/Mahmud-CSE16/Customized-Drag-And-Drop/main/Screenrecords/responsive.jpeg" alt="Responsive" width="300"/>
<img src="https://raw.githubusercontent.com/Mahmud-CSE16/Customized-Drag-And-Drop/main/Screenrecords/staggered.jpeg" alt="Staggered" width="300"/>
</div>

## Features

* **Responsive Draggable Grid**: A grid layout that automatically adapts to different screen sizes while maintaining drag and drop functionality
* **Draggable Staggered Grid**: A dynamic grid with items of varying sizes that can be rearranged through intuitive drag and drop interactions
* **Clean Dashboard UI**: Simple navigation interface with gradient background and descriptive cards


## Implementation Details

### Grid Types

The application demonstrates two types of draggable grid layouts:

1. **Responsive Draggable Grid**: A grid that automatically adjusts the number and layout of items based on screen dimensions. Perfect for applications that need to work across multiple device types.
2. **Draggable Staggered Grid**: A grid layout where items can have different sizes (spanning multiple columns and rows). This creates a more dynamic and visually interesting layout.

### GridItem Model

The `GridItem` model supports:
* Unique identification
* Custom colors
* Variable sizing (crossAxisCellCount, mainAxisCellCount)
* Image URL integration

## Getting Started

### Prerequisites

* Flutter SDK (latest stable version recommended)
* Dart SDK
* Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
git clone https://github.com/Mahmud-CSE16/Customized-Drag-And-Drop

2. Navigate to the project directory:
cd drag_and_drop

3. Install dependencies:
flutter pub get

4. Run the app:
flutter run

## Usage

The application starts with a dashboard that allows you to select which grid demo you'd like to explore:

* **Responsive Draggable Grid**: Select this option to see a grid that adapts to your device's screen size
* **Draggable Staggered Grid**: Select this option to experience a grid with items of varying sizes

Once in a grid demo, you can:
* Long-press on an item to begin dragging
* Drag the item to a new position
* Release to drop the item in its new location
