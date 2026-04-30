import 'package:flutter/services.dart';
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
    this.brightness = StacForuiBrightness.light,
    this.barrier,
    this.background,
    this.foreground,
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
    this.card,
    this.border,
  });

  final StacForuiBrightness brightness;
  final String? barrier;
  final String? background;
  final String? foreground;
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
  final String? card;
  final String? border;

  factory StacForuiColors.fromJson(Map<String, dynamic> json) =>
      _$StacForuiColorsFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiColorsToJson(this);

  FColors toFColors() {
    final base = brightness == StacForuiBrightness.light
        ? FColors.neutralLight
        : FColors.neutralDark;

    return base.copyWith(
      barrier: barrier?.toColor(),
      background: background?.toColor(),
      foreground: foreground?.toColor(),
      primary: primary?.toColor(),
      primaryForeground: primaryForeground?.toColor(),
      secondary: secondary?.toColor(),
      secondaryForeground: secondaryForeground?.toColor(),
      muted: muted?.toColor(),
      mutedForeground: mutedForeground?.toColor(),
      destructive: destructive?.toColor(),
      destructiveForeground: destructiveForeground?.toColor(),
      error: error?.toColor(),
      errorForeground: errorForeground?.toColor(),
      card: card?.toColor(),
      border: border?.toColor(),
    );
  }
}

enum StacForuiBrightness {
  light,
  dark;

  Brightness get toBrightness =>
      this == StacForuiBrightness.light ? Brightness.light : Brightness.dark;
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
