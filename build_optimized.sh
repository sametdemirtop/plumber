#!/bin/bash

echo "Building optimized Flutter web application..."

# Clean previous build
flutter clean

# Get dependencies
flutter pub get

# Build with optimization flags
flutter build web \
  --release \
  --dart-define=FLUTTER_WEB_USE_SKIA=true \
  --dart-define=FLUTTER_WEB_USE_SKIA_RENDERER=true \
  --web-renderer canvaskit \
  --tree-shake-icons \
  --no-sound-null-safety

echo "Build completed! Optimized files are in build/web/"
echo ""
echo "Performance optimizations applied:"
echo "- Removed Google Fonts dependency"
echo "- Optimized image loading with preload"
echo "- Added critical CSS"
echo "- Optimized provider state management"
echo "- Used CanvasKit renderer for better performance"
echo "- Enabled tree shaking for icons" 