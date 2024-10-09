import 'package:banderas/config/theme/app_theme.dart';
import 'package:banderas/presentation/chat/flags_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(selectedColor: 5).theme(),
      title: 'App Banderas',
      debugShowCheckedModeBanner: false,
      home: const FlagsScreen()
    );
  }
}