// It generates a dart file with static const paths to all svg files in the assets/temp directory.
// To run this script, run the following command in the terminal: dart generate_assets.dart

import 'dart:io';

void main() {
  const assetsPath = 'assets';
  const dartFilePath = 'lib/styles/assets.dart';

  final directory = Directory(assetsPath);
  final svgFiles = directory
      .listSync(recursive: true)
      .where((file) => file.path.endsWith('.svg'))
      .toList();

  final buffer = StringBuffer();
  buffer.writeln("part of 'styles.dart';");
  buffer.writeln(
    "/// Defines constants for icon asset paths used throughout the app.",
  );
  buffer.writeln(
    "/// `AppIcons` centralizes SVG icon paths, categorizing them for general use.",
  );
  buffer.writeln(
    "/// Each constant is a `static const String` pointing to an SVG asset.",
  );
  buffer.writeln('class AppIcons {');

  for (var file in svgFiles) {
    final fileName = file.uri.pathSegments.last;
    final varName = toCamelCase(
      fileName.replaceAll('.svg', '').replaceAll(RegExp(r'\W'), '_'),
    );
    final relativePath = file.path
        .replaceFirst(assetsPath, '')
        .replaceAll('\\', '/');
    buffer.writeln('  static const $varName = \'$assetsPath$relativePath\';');
  }

  buffer.writeln('}');

  File(dartFilePath).writeAsStringSync(buffer.toString(), mode: FileMode.write);

  // ignore: avoid_print
  print('Generated ${svgFiles.length} icon paths in $dartFilePath');
}

String toCamelCase(String text) {
  final words = text.split('_');
  return words[0] +
      words.skip(1).map((w) => w[0].toUpperCase() + w.substring(1)).join();
}
