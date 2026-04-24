#!/bin/bash
set -e

FLUTTER_VERSION="3.41.7"

echo ">>> Downloading Flutter $FLUTTER_VERSION (Linux)..."
curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" -o flutter.tar.xz
tar xf flutter.tar.xz

export PATH="$PWD/flutter/bin:$PATH"

echo ">>> Flutter version:"
flutter --version --no-version-check

flutter config --no-analytics

echo ">>> Building Flutter web..."
flutter build web --release

echo ">>> Build complete. Output: build/web"
