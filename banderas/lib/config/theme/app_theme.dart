import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(244, 156, 68, 172);

const List<Color> colorThemes = [
  customColor,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.orange,
  Colors.teal,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor < colorThemes.length, 'color index must be between 0 and ${colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
    );
  }
}