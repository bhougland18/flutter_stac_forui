import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';

part 'stac_forui_theme.g.dart';

@JsonSerializable()
class StacForuiTheme extends StacWidget {
  const StacForuiTheme({
    required this.child,
    this.colors,
    this.typography,
  });

  final Map<String, dynamic>? child;
  final StacForuiColors? colors;
  final StacForuiTypography? typography;

  factory StacForuiTheme.fromJson(Map<String, dynamic> json) =>
      _$StacForuiThemeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiThemeToJson(this);
}

@JsonSerializable()
class StacForuiColors {
  const StacForuiColors({
    this.primary,
    this.primaryForeground,
    this.secondary,
    this.secondaryForeground,
    this.muted,
    this.mutedForeground,
    this.destructive,
    this.destructiveForeground,
    this.error,
    this.errorForeground,
    this.background,
    this.foreground,
    this.border,
  });

  final String? primary;
  final String? primaryForeground;
  final String? secondary;
  final String? secondaryForeground;
  final String? muted;
  final String? mutedForeground;
  final String? destructive;
  final String? destructiveForeground;
  final String? error;
  final String? errorForeground;
  final String? background;
  final String? foreground;
  final String? border;

  factory StacForuiColors.fromJson(Map<String, dynamic> json) =>
      _$StacForuiColorsFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiColorsToJson(this);

  FColorScheme toFColorScheme() {
    return FColorScheme(
      brightness: Brightness.light,
      primary: primary?.toColor() ?? const Color(0xFF000000),
      primaryForeground:
          primaryForeground?.toColor() ?? const Color(0xFFFFFFFF),
      secondary: secondary?.toColor() ?? const Color(0xFFF1F5F9),
      secondaryForeground:
          secondaryForeground?.toColor() ?? const Color(0xFF0F172A),
      muted: muted?.toColor() ?? const Color(0xFFF1F5F9),
      mutedForeground: mutedForeground?.toColor() ?? const Color(0xFF64748B),
      destructive: destructive?.toColor() ?? const Color(0xFFEF4444),
      destructiveForeground:
          destructiveForeground?.toColor() ?? const Color(0xFFFFFFFF),
      error: error?.toColor() ?? const Color(0xFFEF4444),
      errorForeground: errorForeground?.toColor() ?? const Color(0xFFFFFFFF),
      background: background?.toColor() ?? const Color(0xFFFFFFFF),
      foreground: foreground?.toColor() ?? const Color(0xFF020817),
      border: border?.toColor() ?? const Color(0xFFE2E8F0),
    );
  }
}

@JsonSerializable()
class StacForuiTypography {
  const StacForuiTypography({
    this.fontFamily,
  });

  final String? fontFamily;

  factory StacForuiTypography.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTypographyFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiTypographyToJson(this);
}
