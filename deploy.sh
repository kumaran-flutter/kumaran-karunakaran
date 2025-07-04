#!/bin/bash

# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build the Flutter web app with the correct base href
flutter build web --base-href "/portfolio/"

# Create the portfolio directory in the build/web directory if it doesn't exist
mkdir -p build/web/portfolio

# Copy all files from build/web to build/web/portfolio
# excluding the portfolio directory itself to avoid recursion
find build/web -maxdepth 1 -mindepth 1 -not -name portfolio -exec cp -r {} build/web/portfolio/ \;

# Deploy to Firebase
# Uncomment the next line when ready to deploy
firebase deploy

echo "Files are prepared for deployment in build/web/"
echo "You can now run 'firebase deploy' to publish your app"
