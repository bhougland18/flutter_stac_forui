import 'package:flutter/widgets.dart';

extension StacForuiColorUtils on String {
  Color toColor([Color? defaultValue]) {
    try {
      final String hexString;
      if (startsWith('#')) {
        hexString = substring(1);
      } else {
        hexString = this;
      }
      return Color(int.parse('FF$hexString', radix: 16));
    } catch (_) {
      return defaultValue ?? const Color(0xFF000000);
    }
  }
}
