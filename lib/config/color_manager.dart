import 'package:flutter/material.dart';

class AppColorManager {
  static const Color white = Color(0xFFFFFFFF);
  static Color get primary => const Color.fromARGB(255, 22, 224, 86);
  static Color get background => const Color(0xFFEEECEC);
  static const Color black = Colors.black;

  static Color get grey => const Color(0xFF808080);
  static Color get lightGrey => const Color(0xFFD3D3D3);
  static Color get darkGrey => const Color(0xFF5A5A5A);
  static Color get grey1 => const Color(0xFFB2BEB5);
  static Color get grey2 => const Color(0xFF818589);
  static Color get red => const Color(0xFFF85858);
  static Color get darkRed => const Color(0xFF8B0000);

  static Color get yellow => const Color(0xFFFFCA41);
  static Color get blue => const Color(0xFF1D9AF5);
  static Color get green => const Color(0xFF5DB075);
  static Color get cardBackground => AppColorManager.grey.withOpacity(0.2);
}
