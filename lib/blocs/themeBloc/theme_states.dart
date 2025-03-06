import 'package:flutter/material.dart';

class ThemeDataStates {
  ThemeDataStates({
    this.isLightMode = true,
    this.themeColor = Colors.blue,
  });
  final bool isLightMode;
  final Color themeColor;

  ThemeDataStates copyWith({
    bool? isLightMode,
    Color? themeColor,
  }) {
    return ThemeDataStates(
      isLightMode: isLightMode ?? this.isLightMode,
      themeColor: themeColor ?? this.themeColor,
    );
  }
}