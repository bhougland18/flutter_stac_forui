import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/stac_forui_components.dart';

class TestStacApp extends StatelessWidget {
  const TestStacApp({super.key, required this.json});

  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    StacForui.register();
    final colorScheme = const FColorScheme(
      brightness: Brightness.light,
      background: Color(0xFFFFFFFF),
      foreground: Color(0xFF020817),
      primary: Color(0xFF000000),
      primaryForeground: Color(0xFFFFFFFF),
      secondary: Color(0xFFF1F5F9),
      secondaryForeground: Color(0xFF0F172A),
      muted: Color(0xFFF1F5F9),
      mutedForeground: Color(0xFF64748B),
      destructive: Color(0xFFEF4444),
      destructiveForeground: Color(0xFFFFFFFF),
      error: Color(0xFFEF4444),
      errorForeground: Color(0xFFFFFFFF),
      border: Color(0xFFE2E8F0),
    );

    return MaterialApp(
      home: FTheme(
        data: FThemeData.inherit(colorScheme: colorScheme),
        child: Builder(builder: (context) {
          return Stac.fromJson(json, context) ?? const SizedBox.shrink();
        }),
      ),
    );
  }
}
