import 'dart:ui';

class ThemeDataEvents {}

class ChangeThemeDataEvents extends ThemeDataEvents {
  ChangeThemeDataEvents({required this.isLightMode});

  final bool isLightMode;
}

class ChangeThemeColorEvents extends ThemeDataEvents {
  ChangeThemeColorEvents({required this.themeColor});

  final Color themeColor;
}