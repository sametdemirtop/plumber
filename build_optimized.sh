#!/bin/bash

echo "Building optimized Flutter web app for older devices..."

# Clean previous build
flutter clean

# Get dependencies
flutter pub get

# Build with HTML renderer and optimizations for older devices
flutter build web \
  --web-renderer html \
  --dart-define=FLUTTER_WEB_USE_SKIA=false \
  --dart-define=FLUTTER_WEB_USE_CANVASKIT=false \
  --release \
  --tree-shake-icons

echo "Build completed! Optimized for older Android devices."
echo "Files are in build/web/" 