#!/bin/bash

echo "🚀 Deploying Özinan Yapı Web App..."

# Clean previous build
echo "🧹 Cleaning previous build..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build optimized web app
echo "🔨 Building optimized web app..."
flutter build web \
  --web-renderer html \
  --dart-define=FLUTTER_WEB_USE_SKIA=false \
  --dart-define=FLUTTER_WEB_USE_CANVASKIT=false \
  --release \
  --tree-shake-icons

# Deploy to Firebase
echo "🚀 Deploying to Firebase..."
firebase deploy --only hosting

echo "✅ Deployment completed!"
echo "🌐 Your app is now live at: https://ozinan-yapi.web.app"
echo "🔒 HTTPS enabled with security headers"
echo "📱 PWA ready for mobile installation" 